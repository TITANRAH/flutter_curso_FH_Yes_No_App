import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi amor'),
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.vogue.es/photos/5e2565fe90e8230008309ada/2:3/w_2560%2Cc_limit/GettyImages-1200648961.jpg'),
          ),
        ),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    // debo pasar la instancia declarada en main
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                // llamo a la instancia de chatprovider y segun la cantidad e mensajes 
                // apareceran en vista
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  // digo que mensaje es igual a los mensajesList en su posicion index
                  final message = chatProvider.messageList[index];

                  // si messagelist que ahora es message aqui veo de quien viene 
                  // y determino cual mostrar
                      
                  return (message.fromWho == FromWho.hers)
                      ?  HerMessageBubble(message: message)
                      :  MyMessageBubble(message: message);
                  // si el numerop del index es par es her
                  // return (index % 2 == 0)
                  //     ? const HerMessageBubble()
                  //     : const MyMessageBubble();
                },
              ),
            ),

            ///caja de texto
            MessageFieldBox(onValue: (value)=> chatProvider.sendMessage(value),)
          ],
        ),
      ),
    );
  }
}
