import 'package:flutter/material.dart';
import 'package:mote_app/models/message.dart';

class ChatBuble extends StatelessWidget {
  final Message message;
  const ChatBuble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return message.userid == 999
        ? buildNotification(message: message)
        : Row(
            mainAxisAlignment: 1 != message.userid
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  margin: 1 != message.userid
                      ? const EdgeInsets.only(
                          top: 10,
                          right: 100,
                        )
                      : const EdgeInsets.only(
                          top: 10,
                          left: 100,
                        ),
                  decoration: BoxDecoration(
                    color: 1 != message.userid
                        ? Colors.grey[200]
                        : Theme.of(context).primaryColor,
                    borderRadius: 1 != message.userid
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(15),
                          )
                        : const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: 1 != message.userid
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Flexible(
                          child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: message.message,
                              style: TextStyle(
                                color: 1 != message.userid
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}

Widget buildNotification({required Message message}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
