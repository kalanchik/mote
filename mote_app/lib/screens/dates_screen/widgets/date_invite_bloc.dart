import 'package:flutter/material.dart';
import 'package:mote_app/screens/dates_screen/widgets/date_invite_card.dart';

class DateInviteBloc extends StatelessWidget {
  final List myDateInvite;
  const DateInviteBloc({super.key, required this.myDateInvite});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Приглашения',
                style: theme.textTheme.headlineMedium,
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: const Text('Все 11'),
              // ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        myDateInvite.isEmpty
            ? Container(
                height: 50,
                child: Center(
                  child: Text(
                    'Приглашений пока нет 🧐',
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: 310,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => const DateInviteCard(),
                ),
              ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
