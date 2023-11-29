import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_anon_chat_event.dart';
part 'create_anon_chat_state.dart';

class CreateAnonChatBloc
    extends Bloc<CreateAnonChatEvent, CreateAnonChatState> {
  CreateAnonChatBloc() : super(CreateAnonChatInitial()) {
    on<CreateAnonChatRegister>((event, emit) async {
      emit(CreateAnonChatRegisterChat());
      // TODO: Загружаем чат на сервер
      await Future.delayed(
        const Duration(seconds: 2),
      );
      emit(CreateAnonChatComplete());
    });
  }
}
