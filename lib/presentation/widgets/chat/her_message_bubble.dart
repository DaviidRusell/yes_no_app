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
              color: colors.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                message.text,
                style: const TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 1,
        ),
        _ImageBubble(
          message: message,
        ),
        const SizedBox(
          height: 5,
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
            child: const Text('Mi amor esta enviando un meme...'),
          );
        },
      ),
    );
  }
}
