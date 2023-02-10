part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

//? Event Check Email
class AuthCheckEmail extends AuthEvent {
  final String email;
  const AuthCheckEmail(this.email);
  @override
  List<Object> get props => [email];
}

//? Event Register
class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);
  @override
  List<Object> get props => [data];
}

//? Event Login
class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);
  @override
  List<Object> get props => [data];
}

// //? Event Current User
class AuthGetCurrentUser extends AuthEvent {}

//? Event untuk Update User
class AuthUpdateUser extends AuthEvent {
  final UserEditFormModel data;
  const AuthUpdateUser(this.data);
  @override
  List<Object> get props => [data];
}

//? Event untuk Update Pin
class AuthUpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;
  const AuthUpdatePin(
    this.oldPin,
    this.newPin,
  );
  @override
  List<Object> get props => [
        oldPin,
        newPin,
      ];
}

class AuthLogout extends AuthEvent {}

class AuthUpdateBalance extends AuthEvent {
  final int amount;
  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}
