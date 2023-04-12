import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() {
  //essto es slo para los image networks
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],

      child: MaterialApp(
          title: 'Yes No App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 4).theme(),
          home: const ChatScreen()),
    );
  }
}

// esto eso solo para ller los image networks
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


// pasos para provider chat 

// 1. creo mi entidad Message con sus propiedades entre ellas text en carpeta domain
// 2. creo mi clase chatProvider y ademas que extienda de ChangeNotifier en carpeta providers
// 3. creo en este chatProvider una lista de mensajes de tipo message y ademas digo que text es igual a cualquier texto que escriba 
// (llenar los campos requeridos en este caso fromwho y text a eso refiere)
// 4. voy a main y envuelvo el material app en un widget multiprovider 
// 5. declaro los provider que necesitare para toda la app asi: 

//   providers: [
//         ChangeNotifierProvider(create: (_) => ChatProvider())
//       ],

// 6. para este caso creo la screen de chat screen en el cual llamo a mi provider asi : 
// final chatProvider = context.watch<ChatProvider>();

// 7. como tengo un  listview builder digo que el itemcount es igual al .lenght de chatProvider.messageList.lenght 
// 8. declaro una nueva variable en el listview builder asi  final message = chatProvider.messageList[index]; 
// 9. luego leo de quien viene el mensaje para determinar que mensajes apareceran en la vista y leo asi de quien viene: 
// 10.  return (message.fromWho == FromWho.hers)
//                       ? const HerMessageBubble()
//                       :  MyMessageBubble(message: message); 

// 11. paso los mensajes en la vista a traves de final Message message; en el widget que corresponde en este caso 
//      :  MyMessageBubble(message: message); 
// 12. esto implica llamar una variable tipada con la entidad en este caso final Message message y al text 
// le paso message.text;
