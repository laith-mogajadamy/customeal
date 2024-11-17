part of 'enter_bloc.dart';

class EnterState extends Equatable {
  final String islogedin;
  final bool bottom;
  final bool registerbottom;

  final File? fimage;

  final FormSubmissionStatus editStatus;
  final FormSubmissionStatus logoutStatus;
  final String language;

  //
  final User user;
  final int id;
  final String token;

  final String name;
  bool get isValidName => email.length > 8;
  final String email;
  bool get isValidEmail => email.length > 10;
  final String password;
  final String retypePassword;
  bool get isValidPassword => password.length > 6;
  final String phone;
  bool get isValidnumber => phone.length >= 10;

  final String city;
  final String location;

//

  final FormSubmissionStatus formStatus;
  final String message;
//

  const EnterState({
    // this.user = const User(
    //     token: "", email: "", name: "", number: "", type: "", password: ""),
    this.islogedin = '',
    this.bottom = false,
    this.registerbottom = false,
    this.fimage,
    this.editStatus = const InitialFormStatus(),
    this.logoutStatus = const InitialFormStatus(),
    this.language = 'en',

    //
    this.user = const User(
      id: 0,
      name: "",
      email: "",
      phone: "",
      city: "",
      location: '',
    ),
    this.token = '',
    this.id = 0,
    this.email = '',
    this.password = '',
    this.retypePassword = '',
    this.name = '',
    this.phone = '',
    this.city = '',
    this.location = '',

    //

    this.message = '',
    this.formStatus = const InitialFormStatus(),
  });

  EnterState copyWith({
    String? islogedin,
    bool? bottom,
    bool? registerbottom,
    File? fimage,
    FormSubmissionStatus? editStatus,
    FormSubmissionStatus? logoutStatus,
    String? language,

    //
    User? user,
    String? token,
    int? id,
    String? email,
    String? image,
    String? password,
    String? retypePassword,
    String? name,
    String? phone,
    String? city,
    String? location,

    //

    String? message,
    FormSubmissionStatus? formStatus,

    //
    String? yearsofpractice,
  }) {
    return EnterState(
      islogedin: islogedin ?? this.islogedin,
      bottom: bottom ?? this.bottom,
      registerbottom: registerbottom ?? this.registerbottom,
      fimage: fimage ?? this.fimage,

      editStatus: editStatus ?? this.editStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      language: language ?? this.language,

      //
      user: user ?? this.user,
      token: token ?? this.token,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      name: name ?? this.name,
      phone: phone ?? this.phone,

      city: city ?? this.city,
      location: location ?? this.location,

      //

      message: message ?? this.message,
      formStatus: formStatus ?? this.formStatus,
      //
    );
  }

  @override
  List<Object?> get props => [
        islogedin,
        bottom,
        registerbottom,
        fimage,

        editStatus,
        logoutStatus,
        language,
        //
        user,
        token,
        id,
        email,
        password,
        retypePassword,
        name,
        phone,

        city,
        location,

        message,
        formStatus,
        //
      ];
}
