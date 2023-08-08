import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/providers/chat_provider.dart';
import 'package:flutter_application_1/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp()); 
} 

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatProvider(),)
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color.fromARGB(255, 8, 214, 166)
      ),
        home: const ChatScreen()
      ),
    );
  }
}