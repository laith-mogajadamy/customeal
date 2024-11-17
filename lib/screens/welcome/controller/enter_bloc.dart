// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:customeal/core/services/auth.dart';
import 'package:customeal/core/services/uploadfile.dart';
import 'package:customeal/core/utils/formstatus.dart';
import 'package:customeal/core/utils/prefrences.dart';
import 'package:customeal/models/user.dart';
import 'package:customeal/models/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;

part 'enter_event.dart';
part 'enter_state.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterBloc() : super(const EnterState()) {
    on<Getuser>((event, emit) async {
      print("getuser");
      String? useremail = Preferences.getemail();
      String? userpassword = Preferences.getpassword();
      print("-------------------");
      print(useremail);
      print(userpassword);
      print("-------------------");
      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));

      http.Response response = await Auth.login(useremail!, userpassword!);
      print(response);

      var responsemap = await jsonDecode(response.body);
      print(responsemap);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: UserModel.fromJson(responsemap["user"]),
            password: userpassword,
            token: responsemap["access_token"],
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
      } else {
        emit(
          state.copyWith(
              formStatus: SubmissionFailed(state.message),
              message: "login failed",
              islogedin: "false"),
        );
      }
      print("state.user");
      print(state.user);
    });
    //

    //
    on<LanguageChanged>((event, emit) async {
      emit(
        state.copyWith(
          language: event.language,
        ),
      );
    });
    //
    on<UserProfiledit>((event, emit) async {
      print("Profiledit");
      print(state.token);
      emit(state.copyWith(editStatus: FormSubmitting()));
      Response response = await Uploadfile.userprofileedit(
        state.user.id,
        state.token,
        event.fimage,
        event.name,
        event.email,
        event.password,
        event.passwordconfirmation,
        event.number,
        event.city,
        event.location,
      );
      print(response.statusCode);
      print("data=${response.data}");

      // Map<String, dynamic> responsemap = await jsonDecode(response.data);
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: UserModel.fromJson(response.data),
            message: " profile edit successed",
            editStatus: SubmissionSuccess(),
          ),
        );
        print("state.message${state.message}");

        print("state.user${state.user}");
      } else {
        emit(
          state.copyWith(
            message: " profile edit failed",
            editStatus: SubmissionFailed(state.message),
          ),
        );
      }
    });
    //

    on<Bottomshow>((event, emit) async {
      emit(
        state.copyWith(
          bottom: event.bottom,
        ),
      );
    });
    //
    on<RegisterBottomshow>((event, emit) async {
      print(" RegisterBottomshow${event.bottom}");

      emit(
        state.copyWith(
          registerbottom: event.bottom,
        ),
      );
    });
    //

    on<LoginEmailChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        email: event.email,
      ));
    });
    on<LoginPasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        password: event.password,
      ));
    });
    on<LoginReTypePasswordChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        retypePassword: event.retypePassword,
      ));
    });
    on<LoginNameChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        name: event.name,
      ));
    });
    on<LoginNumberChanged>((event, emit) async {
      emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        phone: event.number,
      ));
    });

    on<CityChanged>((event, emit) async {
      emit(state.copyWith(
        city: event.city,
      ));
    });

    //
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(
          formStatus: FormSubmitting(),
          email: state.email,
          password: state.password));

      http.Response response = await Auth.login(state.email, state.password);
      var responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            user: UserModel.fromJson(responsemap['user']),
            token: responsemap["access_token"],
            message: " log in successed",
            formStatus: SubmissionSuccess(),
            islogedin: "true",
          ),
        );
        Preferences.savetoken(responsemap["access_token"]);
        print("token:${responsemap["access_token"]}");
        print("user:${state.user}");

        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
        Preferences.savetoken(responsemap["access_token"]);
        print("++++++++++++++");
        print("token:${responsemap["access_token"]}");
        print("++++++++++++++");
        print(state.formStatus);
      } else {
        emit(
          state.copyWith(
              formStatus: SubmissionFailed(state.message),
              message: "login failed",
              islogedin: "false"),
        );
        print(state.formStatus);
      }
    });
    on<ClientRegisterSubmitted>((event, emit) async {
      emit(state.copyWith(
        formStatus: FormSubmitting(),
      ));
      Response response = await Auth.clientregister(
        state.name,
        state.email,
        state.password,
        state.retypePassword,
        state.phone,
        state.city,
      );
      print("message==${state.message}");
      print("*********");
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 201) {
        add(
          LoginSubmitted(),
        );
        Preferences.savetoken(response.data["accessToken"]);
        Preferences.saveemail(state.email);
        Preferences.savepassword(state.password);
        print("++++++++++++++");
        print("token:${response.data["accessToken"]}");
        print("++++++++++++++");
        print(state.formStatus);
      } else {
        emit(
          state.copyWith(
            formStatus: SubmissionFailed(state.message),
          ),
        );
        print(state.formStatus);
      }
    });
    //

    //

    on<Logout>((event, emit) async {
      emit(
        state.copyWith(
          logoutStatus: FormSubmitting(),
        ),
      );
      http.Response response = await Auth.logout(state.token);
      Map responsemap = await jsonDecode(response.body);
      print("message==${state.message}");
      print("*********");
      print(responsemap);
      print("statusCode==${response.statusCode}");
      print("*********");
      if (response.statusCode == 200) {
        Preferences.clear();
        emit(
          state.copyWith(
              user: const User(
                id: 0,
                name: "",
                email: "",
                phone: "",
                city: "",
                location: '',
              ),
              logoutStatus: SubmissionSuccess(),
              message: responsemap["message"],
              email: "",
              password: "",
              token: "",
              islogedin: "false"),
        );
      } else {
        emit(
          state.copyWith(
              message: responsemap["message"],
              logoutStatus: SubmissionFailed(state.message),
              islogedin: "false"),
        );
        print(state.logoutStatus);
      }
    });
  }
}
