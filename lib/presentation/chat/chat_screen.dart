import 'package:flutter/material.dart';

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
      body: const _ChatView4(),
    );
  }
}

class _ChatView4 extends StatelessWidget {
  const _ChatView4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Text('Indice: $index');
                },
              ),
            ),
            const Text('Mundo'),
          ],
        ),
      ),
    );
  }
}
