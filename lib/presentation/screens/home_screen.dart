import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:yes_no_app/infrastructure/models/admob_helper.dart';
import 'package:yes_no_app/presentation/widgets/shared/banner_admob.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RateMyApp rateMyApp = RateMyApp(
      googlePlayIdentifier: "com.yesorno.siono",
      minDays: 0,
      minLaunches: 2,
      remindDays: 1,
      remindLaunches: 1);
  @override
  void initState() {
    super.initState();
    rateMyApp.init().then((value) {
      if (rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(
          context,
          title: "Rate this app",
          message:
              "If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn't take you more than one minute.",
          rateButton: 'RATE', // The dialog "rate" button text.
          noButton: 'NO THANKS', // The dialog "no" button text.
          laterButton: 'MAYBE LATER', // The dialog "later" button text.
          onDismissed: () =>
              rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final myBanner = AdmobHelper.getBannerAd();
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
          child: SingleChildScrollView(
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
                  height: 50,
                ),

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
        ),
      ),
      bottomNavigationBar: BannerAdMob(myBanner: myBanner),
    );
  }
}
