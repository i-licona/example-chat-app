import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/presentation/providers/chat_provider.dart';
import 'package:flutter_application_1/presentation/widgets/chat/her_message.bubble.dart';
import 'package:flutter_application_1/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.5),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/474x/6b/64/13/6b6413dfbcdbba31ee15db91fae38ad6.jpg'),  
          ), 
        ),
        title: const Text('Mi amor ❤'),
        centerTitle:false
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* Properties */
    final chatProvider = context.watch<ChatProvider>();
    /* Widget */
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder:(context, index) {
                final message = chatProvider.messages[index];
                return ( message.fromWho == FromWho.me ) 
                ? MyMessageBubble( message: message, )
                : HerMessageBubble( message: message, );
              }, )),
            /* Caja de texto */
            MessageFieldBox(
              onValue: (value)=> chatProvider.sendMessage(value) 
            ),
          ],
        ),
      ),
    );
  }
}