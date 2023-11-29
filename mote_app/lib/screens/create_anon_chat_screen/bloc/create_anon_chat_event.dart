part of 'create_anon_chat_bloc.dart';

abstract class CreateAnonChatEvent extends Equatable {}

class CreateAnonChatRegister extends CreateAnonChatEvent {
  // final Map<String, dynamic> данные о чате
  @override
  List<Object> get props => [];
}
