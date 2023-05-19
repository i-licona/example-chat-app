import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/helpers/get_yes_no_answer.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();
  
  List<Message> messages = [
    Message(text: 'Hola amor', fromWho: FromWho.me),
    Message(text: 'Ya volviste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text ) async{
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    // verify if is a question
    if(text.endsWith('?')) herReply();

    notifyListeners();
    moveScrollToButton();
  }

  Future<void> herReply() async{
    final Message herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
    notifyListeners();
    moveScrollToButton();
  }

  Future<void> moveScrollToButton() async{
    await Future.delayed(const Duration(milliseconds: 100));    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}