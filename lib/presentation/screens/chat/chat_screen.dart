import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

import '../../../infrastructure/models/admob_helper.dart';
import '../../widgets/chat/my_message_bubble.dart';
import '../../widgets/shared/banner_admob.dart';
import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

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
      body: _ChatView(),
      bottomNavigationBar: BannerAdMob(myBanner: myBanner),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myBanner = AdmobHelper.getBannerAd();
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            BannerAdMob(myBanner: myBanner),
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.listMessage.length,
              itemBuilder: (context, index) {
                final message = chatProvider.listMessage[index];
                return (message.fromWho == FromWho.me)
                    ? MyMessageBubble(
                        message: message,
                      )
                    : HerMessageBubble(
                        message: message,
                      );
              },
            )),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
