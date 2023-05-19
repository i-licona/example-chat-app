import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({ required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20) 
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(
              color: Colors.white
            ),),
          ),
        ),
        const SizedBox(height: 5,),
        if (message.imageUrl != null)  _ImageBubble(url: message.imageUrl ?? 'https://i.pinimg.com/736x/15/bf/ad/15bfade24616a249a19ad4fade17ee7e.jpg',) ,
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url;
  const _ImageBubble({ required this.url });
  @override
  Widget build(BuildContext context) {
    /* saber las dimensiones del dispositivo */
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius:BorderRadius.circular(20),
      child: Image.network(
       url,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder:(context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            alignment: AlignmentDirectional.center,
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Mi amor esta enviando una imagen'),
          );
        },
        ),  
    );
  }
}