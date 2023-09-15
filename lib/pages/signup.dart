// import 'package:chatapp/core/constants.dart';
// import 'package:chatapp/pages/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({super.key});

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   @override
//   Widget build(BuildContext context) {
//     var kheight = MediaQuery.of(context).size.height;
//     var kwidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: kheight / 4,
//             width: kwidth,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [purple, Color(0xFF6380fb)],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.vertical(
//                     bottom: Radius.elliptical(kwidth, 105.0))),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 70.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Center(
//                     child: Text(
//                       "Sign Up",
//                       style: TextStyle(
//                         color: white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       "Create a new account",
//                       style: TextStyle(
//                         color: white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsetsDirectional.symmetric(
//                         vertical: 20.0, horizontal: 20.0),
//                     child: Material(
//                       elevation: 5.0,
//                       borderRadius: BorderRadius.circular(10),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             vertical: 30.0, horizontal: 20.0),
//                         height: kheight / 1.5,
//                         width: kwidth,
//                         decoration: BoxDecoration(
//                           color: white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Name",
//                               style: commontext,
//                             ),
//                             height10,
//                             Container(
//                               decoration: textfielddecor,
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     prefixIcon: Icon(
//                                       Icons.person,
//                                       color: purple,
//                                     )),
//                               ),
//                             ),
//                             Text(
//                               "Email",
//                               style: commontext,
//                             ),
//                             height10,
//                             Container(
//                               decoration: textfielddecor,
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     prefixIcon: Icon(
//                                       Icons.email_outlined,
//                                       color: purple,
//                                     )),
//                               ),
//                             ),
//                             height20,
//                             Text(
//                               "Password",
//                               style: commontext,
//                             ),
//                             height10,
//                             Container(
//                               decoration: textfielddecor,
//                               child: TextField(
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     prefixIcon: Icon(
//                                       Icons.lock,
//                                       color: purple,
//                                     )),
//                               ),
//                             ),
//                             height10,
//                             Text(
//                               "Confirm Password",
//                               style: commontext,
//                             ),
//                             height10,
//                             Container(
//                               decoration: textfielddecor,
//                               child: TextField(
//                                 obscureText: true,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none,
//                                     prefixIcon: Icon(
//                                       Icons.lock,
//                                       color: purple,
//                                     )),
//                               ),
//                             ),
//                             height20,
//                             Center(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: purple,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context)
//                                         .push(CupertinoPageRoute(
//                                       builder: (context) => Home(),
//                                     ));
//                                   },
//                                   child:
//                                       Text("Sign Up", style: textbuttonstyle),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:chatapp/core/constants.dart';
import 'package:chatapp/core/function.dart';
import 'package:chatapp/pages/signin.dart';
import 'package:chatapp/widgets/textfield_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/widgets/utils.dart';

import '../../../main.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Future<void> signUp() async {
      final isValid = formKey.currentState!.validate();
      if (!isValid) return;
      // if (EmailValidator.validate(emailController.text) &&
      //     passwordController.text.trim().length >= 8) {
      showDialog(
        context: context,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim());

        User currentuser = FirebaseAuth.instance.currentUser!;
        currentuser.updateDisplayName(nameController.text);
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        utils.showSnackbar(e.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      // } else {
      //   return false;
      // }
      return;
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                height20,
                TextFieldSignUp(
                    controller: nameController,
                    icon: Icons.edit,
                    title: 'Name'),
                height10,
                TextFieldSignUp(
                    selection: 1,
                    controller: emailController,
                    icon: Icons.email,
                    title: 'Email'),
                height10,
                TextFieldSignUp(
                  // validator: ,
                  passwordVisible: true,
                  controller: passwordController,
                  icon: Icons.lock,
                  title: 'Password',
                ),
                height20,
                InkWell(
                  onTap: () {
                    signUp();
                  },
                  child: Container(
                    width: size.width * 0.9,
                    height: size.width * 0.13,
                    decoration: BoxDecoration(
                        border: Border.all(color: white),
                        borderRadius: BorderRadius.circular(20),
                        color: black),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'SignUp',
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      ),
                    ),
                  ),
                ),
                height10,
                Center(
                  child: SizedBox(
                    width: size.width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: size.width * 0.3,
                            height: 1,
                            color: grey,
                          ),
                          const Text('or Sign up with'),
                          Container(
                            width: size.width * 0.3,
                            height: 1,
                            color: black,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                height10,
                GestureDetector(
                  onTap: () {
                    googleSignIn();
                  },
                  child: SizedBox(
                    width: 40,
                    child: Image.network(
                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png'),
                  ),
                ),
                height10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: black, fontSize: 15),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
