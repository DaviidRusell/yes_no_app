import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.onSecondary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(
          message: message,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final Message message;

  const _ImageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        fit: BoxFit.cover,
        height: 150,
        width: size.width * 0.7,
        message.imageUrl!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 150,
            width: size.width * 0.7,
            child: const Text('YesOrNo is sending you a sticker...'),
          );
        },
      ),
    );
  }
}
