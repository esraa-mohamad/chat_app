import 'package:chat_app/Pages/sign_up.dart';
import 'package:chat_app/componants/componants.dart';
import 'package:chat_app/componants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
                Image.asset(kLogo,height: 100,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Data',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  'Sign in',
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
                      email=data;

                    }
                ),
                const SizedBox(
                  height: 12,
                ),
                textField(
                  obscureText: true,
                  hintText: 'Password',
                  hintColor:Colors.white,
                  hintSize: 20,
                    onChange: (data)
                    {
                      password=data;

                    }
                ),
                const SizedBox(
                  height: 15,
                ),
                elevatedButton(
                 onTap: ()async{
                   if (key.currentState!.validate()) {
                     isAsyncCall=true;
                     setState(() {

                     });
                     try{
                       await logInAccount();
                        // ignore: use_build_context_synchronously
                        showSnackBar(context, 'Login is succeed' , color: Colors.green);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, 'ChatPage',arguments: email);
                     }on FirebaseAuthException catch (e)
                     {
                       if (e.code == 'user-not-found') {
                         showSnackBar(context,'No user found for that email.', color: Colors.red);
                       } else if (e.code == 'wrong-password') {
                         showSnackBar(context, 'Wrong password provided for that user.' , color: Colors.red);
                       }
                     }
                     isAsyncCall=false;
                     setState(() {

                     });
                   }
                   else{}
                 },
                  textButton: 'Sign in',
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
                      "don't have an account! ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,

                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        Navigator.pushNamed(context, 'SignUp');
                      },
                      child: const Text(
                        "Sing Up",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,

                        ),
                      ),
                    ),
                  ],
                ),
                // RichText(text:  TextSpan(
                //     children: [
                //       const TextSpan(
                //           text: "Don`t have an account ? ",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //
                //           ),
                //       ),
                //       TextSpan(
                //           text:" Register ",
                //           style: const TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //           ),
                //           recognizer: TapGestureRecognizer()..onTap =()
                //           {
                //             Navigator.push(context,
                //                 MaterialPageRoute(builder: (context)=>const  SignUp()
                //                 ),
                //             );
                //           }
                //
                //       ),
                //     ]
                // )),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Future<void> logInAccount() async {
    final credential =await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}



