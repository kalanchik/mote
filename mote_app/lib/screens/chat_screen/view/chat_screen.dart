import 'package:auto_route/auto_route.dart';
import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mote_app/models/mote_models/fire_chat.dart';
import 'package:mote_app/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:mote_app/screens/chat_screen/utils/chat_action.dart';
import 'package:mote_app/screens/chat_screen/widgets/chat_view_config.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

@RoutePage()
class ChatScreen extends StatefulWidget {
  final FireChat chat;
  const ChatScreen({super.key, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatBloc _bloc;

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    _bloc = ChatBloc(chatid: widget.chat.id)
      ..add(ChatLoading(
        chatId: widget.chat.id,
        users: widget.chat.users,
      ));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoaded) {
              return ChatView(
                messageConfig: ChatViewConfig.messageConfiguration(context),
                replyPopupConfig: ChatViewConfig.replyPopupConfig(context),
                reactionPopupConfig: ReactionPopupConfiguration(
                  userReactionCallback: (message, reaction) {
                    print(message.toJson());
                  },
                  shadow: const BoxShadow(),
                  backgroundColor: TSetColor.onBackgroundColor(context),
                ),
                chatBubbleConfig:
                    ChatViewConfig.chatBubbleConfiguration(context),
                showTypingIndicator: false,
                onSendTap: (message, reply, type) async {
                  await ChatAction.tapSend(
                    message: message,
                    reply: reply,
                    type: type,
                    userId: state.fireChatUsers.currentUserId,
                    chatId: widget.chat.id,
                  );
                },
                appBar: ChatViewAppBar(
                  elevation: 0,
                  profilePicture: widget.chat.mainPhoto,
                  backGroundColor: TSetColor.backgroundColor(context),
                  chatTitle: widget.chat.name,
                ),
                chatBackgroundConfig: ChatBackgroundConfiguration(
                  backgroundColor: TSetColor.backgroundColor(context),
                ),
                chatController: state.chatController,
                currentUser: ChatUser(
                  id: state.fireChatUsers.currentUserId,
                  name: state.fireChatUsers.currentUserName,
                ),
                chatViewState: ChatViewState.hasMessages,
                sendMessageConfig:
                    ChatViewConfig.sendMessageConfiguration(context),
              );
            }
            return Center(
              child: LoadingAnimationWidget.twoRotatingArc(
                color: Theme.of(context).primaryColor,
                size: 50,
              ),
            );
          },
        ),
      ),
    );
  }
}
