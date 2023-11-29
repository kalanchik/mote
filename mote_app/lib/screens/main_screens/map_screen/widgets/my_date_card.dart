import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mote_app/models/test_users.dart';

class MyDateCard extends StatelessWidget {
  final bool isAnon;
  const MyDateCard({super.key, required this.isAnon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
                image: isAnon
                    ? null
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          TestUsers.dima.imgUrls[0],
                        ),
                      ),
              ),
              child: isAnon
                  ? const Center(
                      child: Text(
                        '?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          isAnon ? 'Свидание вслепую' : 'Свидание',
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        isAnon ? 'Скрыт' : 'Дима, 19',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                        height: 15,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        '12.10.23',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Theme.of(context).primaryColor,
                    ],
                  ),
                ),
                child: const Icon(
                  Ionicons.map_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
