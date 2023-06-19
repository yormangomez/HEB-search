import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_heb/login/api/provide_api.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ProviderAPI providerAPI = ProviderAPI();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ValidLoginEvent>((event, emit) async {});
    on<LoginHebEvent>((event, emit) async {
      await providerAPI.getEmail(event.email);
    });
  }
}
