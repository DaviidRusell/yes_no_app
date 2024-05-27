import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> listMessage = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    listMessage.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }

    moveScrollToButton();
    notifyListeners();
  }

  void moveScrollToButton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.extentTotal,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  Future<void> herReplay() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    listMessage.add(herMessage);
    notifyListeners();
    moveScrollToButton();
  }
}
