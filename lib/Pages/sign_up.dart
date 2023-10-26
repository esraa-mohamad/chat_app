
import 'package:chat_app/componants/componants.dart';
import 'package:chat_app/componants/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

String? email;
String? password;
GlobalKey<FormState>key=GlobalKey();
bool isAsyncCall=false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isAsyncCall,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: key,
            child: ListView(
              children:
              [
                const SizedBox(
                  height: 75,
                ),
                Image.asset(kLogo,
                height: 100,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Data',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,

                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                textField(
                  hintText: 'Email',
                  hintColor:Colors.white,
                  hintSize: 20,
                  onChange: (data)
                    {
                      email =data;
                    }
                ),
                const SizedBox(
                  height: 20,
                ),
                textField(
                  obscureText: true,
                  hintText: 'Password',
                  hintColor:Colors.white,
                  hintSize: 20,
                  onChange: (data)
                  {
                    password=data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                elevatedButton(
                    onTap: () async{
                      if (key.currentState!.validate()) {
                        isAsyncCall=true;
                        setState(() {
                        });
                        try{
                          await registerAccount();
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, 'Register is succeed' , color: Colors.green);
                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, 'ChatPage',arguments: email);
                        }on FirebaseAuthException catch (e)
                        {
                          if (e.code == 'weak-password') {
                            showSnackBar(context,'The password provided is too weak.' ,color: Colors.red);
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'The account already exists for that email.' , color: Colors.red);
                          }
                        }
                        isAsyncCall=false;
                        setState(() {

                        });
                      }
                      else{}
                    },
                    textButton: 'Sign Up',
                  buttonColor: Colors.white,
                  textSize: 22,
                  textColor: Colors.black,
                  widthButton:double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text(
                      "Already have an account! ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,

                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sing in",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,

                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> registerAccount() async {
    final credential =await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
