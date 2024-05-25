import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({
    super.key,
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
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Indice ',
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 1,
        ),
        _ImageBubble(),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        fit: BoxFit.cover,
        height: 150,
        width: size.width * 0.7,
        'https://yesno.wtf/assets/no/15-7446b1035f784986609f456e15d30a5b.gif',
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
