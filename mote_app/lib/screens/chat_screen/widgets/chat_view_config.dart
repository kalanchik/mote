import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';

class ChatViewConfig {
  ChatViewConfig._();
  // Всплывающее окно при долго нажатии
  static ReplyPopupConfiguration replyPopupConfig(BuildContext context) {
    return ReplyPopupConfiguration(
      buttonTextStyle: TextStyle(
        color: TSetColor.textColor(context),
      ),
      topBorderColor: Colors.transparent,
      backgroundColor: TSetColor.onBackgroundColor(context),
    );
  }

  // Окно с реакциями на сообщение
  static ReactionPopupConfiguration reactionPopupConfiguration(
    BuildContext context,
  ) {
    return ReactionPopupConfiguration(
      userReactionCallback: (message, reaction) {
        print(message.toJson());
      },
      shadow: const BoxShadow(),
      backgroundColor: TSetColor.onBackgroundColor(context),
    );
  }

  static ChatBubbleConfiguration chatBubbleConfiguration(BuildContext context) {
    return ChatBubbleConfiguration(
      outgoingChatBubbleConfig: ChatBubble(
        color: Theme.of(context).primaryColor,
      ),
      inComingChatBubbleConfig: ChatBubble(
        color: TSetColor.accentColor(context),
      ),
    );
  }

  static SendMessageConfiguration sendMessageConfiguration(
      BuildContext context) {
    return SendMessageConfiguration(
      imagePickerConfiguration: const ImagePickerConfiguration(
        imageQuality: 50,
      ),
      voiceRecordingConfiguration: const VoiceRecordingConfiguration(),
      replyDialogColor: TSetColor.backgroundColor(context),
      replyTitleColor: Theme.of(context).primaryColor,
      replyMessageColor: TSetColor.textColor(context),
      enableCameraImagePicker: false,
      closeIconColor: Colors.grey,
      defaultSendButtonColor: Theme.of(context).primaryColor,
      textFieldConfig: TextFieldConfiguration(
        hintText: 'Сообщение',
        textStyle: TextStyle(
          color: TSetColor.textColor(context),
        ),
      ),
      textFieldBackgroundColor: TSetColor.onBackgroundColor(context),
    );
  }

  static MessageConfiguration messageConfiguration(BuildContext context) {
    return MessageConfiguration(
      messageReactionConfig: MessageReactionConfiguration(
        reactionsBottomSheetConfig: ReactionsBottomSheetConfiguration(
          reactionSize: 25,
          backgroundColor: TSetColor.backgroundColor(context),
          reactionWidgetDecoration: BoxDecoration(
            color: TSetColor.onBackgroundColor(context),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        backgroundColor: TSetColor.onBackgroundColor(context),
        borderColor: Colors.transparent,
      ),
    );
  }
}
