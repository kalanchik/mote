import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:mote_app/models/message.dart';
import 'package:mote_app/utils/constants/color_pallete.dart';
import 'package:mote_app/utils/setColors/setcolors.dart';
import 'package:mote_app/utils/theme/theme.dart';

class AnonChatBubble extends StatelessWidget {
  final Message messageInfo;
  const AnonChatBubble({super.key, required this.messageInfo});

  bool isReceiver(int userId) {
    return userId == 1;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 8, right: 8),
      child: Container(
        margin: EdgeInsets.only(
          left: isReceiver(messageInfo.userid) ? 0 : 5,
          right: isReceiver(messageInfo.userid) ? 5 : 0,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: isReceiver(messageInfo.userid) ? 100 : 0,
            right: isReceiver(messageInfo.userid) ? 0 : 100,
          ),
          child: Row(
            mainAxisAlignment: isReceiver(messageInfo.userid)
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Flexible(
                child: ClipPath(
                  clipper: LowerNipMessageClipper(
                    isReceiver(messageInfo.userid)
                        ? MessageType.send
                        : MessageType.receive,
                    bubbleRadius: 25,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: isReceiver(messageInfo.userid)
                          ? theme.primaryColor
                          : TSetColor.accentColor(context),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          messageInfo.message,
                          style: TextStyle(
                            fontSize: 15,
                            color: isReceiver(messageInfo.userid)
                                ? TSetColor.buttonTextColor(context)
                                : isLight(context)
                                    ? Colors.white
                                    : TColor.darkBackground,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
