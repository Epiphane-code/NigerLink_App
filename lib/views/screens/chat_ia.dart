import 'package:e_services_niger/views/widgets/app_header.dart';
import 'package:flutter/material.dart';

class ChatIa extends StatefulWidget {
  const ChatIa({super.key});

  @override
  State<ChatIa> createState() => _ChatIaState();
}

class _ChatIaState extends State<ChatIa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SafeArea(child: Column(children: [
         Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF007A4D),
              ),
              child: Row(
                children: [

                  IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white54,)),
                  // Titre
                  const Expanded(
                    child: Text(
                      'Aboki AI',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Fermer
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
      ],)) ,
    );
  }
}