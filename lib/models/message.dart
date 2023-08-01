import 'package:chat_app/componants/constants.dart';

class Message
{
  final String messages;

  final String id;

  Message(this.messages, this.id);

  factory Message.fromJson( jsonData)
  {
    return Message(jsonData[kMessagesCollection],jsonData['id']);
  }
}
