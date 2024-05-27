import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colors.onPrimary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )),
        const SizedBox(
          height: 5,
        )
      ],
    );
  }
}
