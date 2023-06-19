part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginHebEvent extends LoginEvent {
  final String email;

  const LoginHebEvent({
    required this.email,
  });

  @override
  List<Object> get props => [email];
}

class ValidLoginEvent extends LoginEvent {
  final String email;
  final String code;

  const ValidLoginEvent({
    required this.email,
    required this.code,
  });

  @override
  List<Object> get props => [email, code];
}
