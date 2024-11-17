part of 'enter_bloc.dart';

abstract class EnterEvent extends Equatable {}

class Getuser extends EnterEvent {
  Getuser();

  @override
  List<Object?> get props => [];
}

class LanguageChanged extends EnterEvent {
  final String? language;

  LanguageChanged({this.language});

  @override
  List<Object?> get props => [language];
}

class ImageChange extends EnterEvent {
  final File? fimage;

  ImageChange({this.fimage});

  @override
  List<Object?> get props => [fimage];
}

class Bottomshow extends EnterEvent {
  final bool? bottom;
  final String? destenation;

  Bottomshow({this.bottom, this.destenation});

  @override
  List<Object?> get props => [bottom, destenation];
}

class RegisterBottomshow extends EnterEvent {
  final bool? bottom;

  RegisterBottomshow({
    this.bottom,
  });

  @override
  List<Object?> get props => [
        bottom,
      ];
}

class UserProfiledit extends EnterEvent {
  final File? fimage;
  final String? name;
  final String? email;
  final String? password;
  final String? passwordconfirmation;
  final String? number;

  final String? city;

  final String? location;

  UserProfiledit({
    this.fimage,
    this.name,
    this.email,
    this.number,
    this.location,
    this.password,
    this.passwordconfirmation,
    this.city,
  });

  @override
  List<Object?> get props => [
        fimage,
        name,
        email,
        number,
        location,
        password,
        passwordconfirmation,
        city,
      ];
}

class LoginEmailChanged extends EnterEvent {
  final String? email;

  LoginEmailChanged({this.email});

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChanged extends EnterEvent {
  final String? password;

  LoginPasswordChanged({this.password});

  @override
  List<Object?> get props => [password];
}

class LoginReTypePasswordChanged extends EnterEvent {
  final String? retypePassword;

  LoginReTypePasswordChanged({this.retypePassword});

  @override
  List<Object?> get props => [retypePassword];
}

class LoginNameChanged extends EnterEvent {
  final String? name;

  LoginNameChanged({this.name});

  @override
  List<Object?> get props => [name];
}

class LoginNumberChanged extends EnterEvent {
  final String? number;

  LoginNumberChanged({this.number});

  @override
  List<Object?> get props => [number];
}

class CityChanged extends EnterEvent {
  final String? city;

  CityChanged({this.city});

  @override
  List<Object?> get props => [city];
}

class LoginSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}

class Logout extends EnterEvent {
  final String? token;
  Logout({this.token});

  @override
  List<Object?> get props => [token];
}

class ClientRegisterSubmitted extends EnterEvent {
  @override
  List<Object?> get props => [];
}
