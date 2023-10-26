import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

// ignore: must_be_immutable
class MessageChat extends StatelessWidget {
   MessageChat({super.key , required this.message});

  Message message ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
        padding: const EdgeInsets.only(left: 17,top: 28,bottom: 28,right: 17),
        decoration:  const BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child:  Text(
          message.messages,
          style: const TextStyle(
              fontSize: 20,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
