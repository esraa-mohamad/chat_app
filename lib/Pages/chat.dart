import 'package:chat_app/componants/componants.dart';
import 'package:chat_app/componants/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  TextEditingController messageController=TextEditingController();

  CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollection);

  final _controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt,descending: true).snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              List<Message>messagesList=[];
              for(int i=0;i<snapshot.data!.docs.length;i++)
                {
                  messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
                }
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(kLogo,height: 60,),
                      const Text('Chat'),
                    ],
                  ),
                  centerTitle: true,
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                          itemBuilder: (context,index)
                          {
                            return messagesList[index].id==email ?
                            chatMessage(
                              message:messagesList[index],
                            ) : chatMessageFriend(
                              message:messagesList[index],
                              colorMessage: kMessageColor,
                            );
                          }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: textFieldChat(
                          controller: messageController,
                          hintText: 'Send Message',
                          hintColor: kPrimaryColor,
                          suffixIcon:Icons.send,
                          iconColor: kPrimaryColor,
                          outlineRadius: 15,
                          outlineBorder: kPrimaryColor,
                          onSubmitted: (data)
                          {
                            messages.add({
                              'messages':data,
                              'createdAt':DateTime.now(),
                              'id':email,
                            });
                            messageController.clear();
                            _controller.animateTo(
                              0,
                              curve: Curves.easeIn,
                              duration: const Duration(milliseconds: 500),
                            );
                          },
                        onPressed: (String data)
                        {
                          messages.add({
                            'messages':data,
                            'createdAt':DateTime.now(),
                            'id':email,
                          });
                          messageController.clear();
                          _controller.animateTo(
                            0,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              );
            }
          else
            {
              return const Text('Loading.....');
            }
        },
    );
  }
}
