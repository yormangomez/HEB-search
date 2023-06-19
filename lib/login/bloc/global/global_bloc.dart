import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_heb/login/api/provide_api.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  final ProviderAPI providerAPI = ProviderAPI();

  GlobalBloc() : super(GlobalInitial()) {
    on<GlobalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
