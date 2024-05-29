import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('YesOrNo'),
          centerTitle: false,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: AssetImage(
              'assets/yesno.png',
            )),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Instructions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'End the sentence with "?" when you want to ask a question.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Example",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '✅Is it going to rain today?\n✅Should I buy an ice cream?\n✅Will my team win the game?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Invalid questions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '❌Is it going to rain today\n❌Should I buy an ice cream\n❌Will my team win the game',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "NOTE",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'The app will show you a random answer, either "Yes" or "No," on the screen.Immediately after, the app will search and display a GIF related to the response',
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 3,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: Container()),
                Center(
                    child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 100,
                        ),
                        onPressed: () => Navigator.pushNamed(context, 'chat'))),

                // SizedBox(
                //   width: double.infinity,
                //   child: FilledButton(
                //     child: Text(
                //       "ask me a question!",
                //       style: Theme.of(context).textTheme.titleLarge,
                //     ),
                //     onPressed: () {},
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }
}
