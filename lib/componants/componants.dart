import 'package:chat_app/componants/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

Widget textField({
  Function(String)? onChange,
  String? labelText,
  String? hintText,
  Color? labelColor,
  double? labelSize,
  Color? hintColor,
  double? hintSize,
  IconData? suffixIcon,
  IconData? prefixIcon,
  Color? iconColor,
  Color outlineBorder=Colors.white,
  double outlineRadius=10,
  bool obscureText=false,
})
{
  return TextFormField(
    obscureText: obscureText,
    onChanged: onChange,
    validator: (data)
    {
     if(data!.isEmpty)
       {
         return'The field should not be empty';
       }
     return null;
    },
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle:
       TextStyle(fontSize: labelSize, color: labelColor),
      hintText: hintText,
      hintStyle: TextStyle(
        color: hintColor,
        fontSize:hintSize ,
      ),
      suffixIcon:  Icon(
          suffixIcon,
          color: iconColor,
        ),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: outlineBorder,
        ),
        borderRadius: BorderRadius.circular(
          (outlineRadius),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: outlineBorder,
        ),
        borderRadius: BorderRadius.circular(
          (outlineRadius),
        ),
      ),
    ),
  );
}

Widget elevatedButton({
  VoidCallback?onTap,
  required String textButton,
  required Color textColor,
  required double textSize,
  required Color buttonColor,
  double buttonRadius=10,
  double? widthButton,

})
{
  return GestureDetector(
    onTap: onTap ,
    child: Container(
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
      width: widthButton,
      height: 60,
      child: Center(
        child: Text(textButton,
        style: TextStyle(
          fontSize: textSize,
          color: textColor
        ),),
      ),
    ),
  );
}


Widget chatMessage({
  required Message message,
})
{
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

Widget chatMessageFriend({
  required Message message,
  Color? colorMessage,
})
{
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 10),
      padding: const EdgeInsets.only(left: 17,top: 28,bottom: 28,right: 17),
      decoration:   BoxDecoration(
        color: colorMessage,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
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

Widget textFieldChat({
  Function(String)? onChange,
  Function(String)? onSubmitted,
  TextEditingController? controller,
  String? labelText,
  String? hintText,
  Color? labelColor,
  double? labelSize,
  Color? hintColor,
  double? hintSize,
  IconData? suffixIcon,
  IconData? prefixIcon,
  Color? iconColor,
  Color outlineBorder=Colors.white,
  double outlineRadius=10,
  Function? onPressed,
})
{
  return TextField(
    onChanged: onChange,
    onSubmitted: onSubmitted,
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle:
      TextStyle(fontSize: labelSize, color: labelColor),
      hintText: hintText,
      hintStyle: TextStyle(
        color: hintColor,
        fontSize:hintSize ,
      ),
      suffixIcon:  IconButton(
        onPressed:(){
          onPressed;
        } ,
        icon: Icon(
          suffixIcon,
          color: iconColor,
        ),
      ),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: outlineBorder,
        ),
        borderRadius: BorderRadius.circular(
          (outlineRadius),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: outlineBorder,
        ),
        borderRadius: BorderRadius.circular(
          (outlineRadius),
        ),
      ),
    ),
  );
}