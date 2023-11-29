import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/group_message_model.dart';

class GroupMessageBubble extends StatelessWidget {
  final MeetUserMessage messageInfo;
  const GroupMessageBubble({super.key, required this.messageInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 8, right: 8),
      child: Stack(
        children: [
          messageInfo.isReceiver
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 0,
                  left: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(messageInfo.avatar),
                    radius: 24,
                  ),
                ),
          Container(
            margin: EdgeInsets.only(
              left: messageInfo.isReceiver ? 0 : 60,
              right: messageInfo.isReceiver ? 10 : 0,
            ),
            child: Row(
              mainAxisAlignment: messageInfo.isReceiver
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Flexible(
                  child: ClipPath(
                    clipper: LowerNipMessageClipper(
                      messageInfo.isReceiver
                          ? MessageType.send
                          : MessageType.receive,
                      bubbleRadius: 25,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: messageInfo.isReceiver ? null : Colors.grey[100],
                        gradient: messageInfo.isReceiver
                            ? LinearGradient(colors: [
                                Colors.red,
                                Theme.of(context).primaryColor,
                              ])
                            : null,
                      ),
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          messageInfo.isReceiver
                              ? const SizedBox.shrink()
                              : Text(
                                  messageInfo.userName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                          messageInfo.isReceiver
                              ? const SizedBox.shrink()
                              : const SizedBox(
                                  height: 5,
                                ),
                          Text(
                            messageInfo.messageText,
                            style: TextStyle(
                              fontSize: 15,
                              color: messageInfo.isReceiver
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
