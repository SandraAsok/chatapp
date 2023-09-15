// import 'package:chatapp/core/constants.dart';
// import 'package:chatapp/pages/signup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class SignIn extends StatefulWidget {
//   const SignIn({super.key});

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
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
//                       "Sign In",
//                       style: TextStyle(
//                         color: white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Text(
//                       "Login to your account",
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
//                         height: kheight / 2,
//                         width: kwidth,
//                         decoration: BoxDecoration(
//                           color: white,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
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
//                             Container(
//                               alignment: Alignment.bottomRight,
//                               child: TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "forgot password?",
//                                   style: TextStyle(
//                                       color: black,
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             height10,
//                             Center(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: purple,
//                                   borderRadius: BorderRadius.circular(10.0),
//                                 ),
//                                 child: TextButton(
//                                   onPressed: () {},
//                                   child:
//                                       Text("Sign In", style: textbuttonstyle),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Don't have an account?",
//                         style: commontext,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.of(context).push(CupertinoPageRoute(
//                             builder: (context) => SignUp(),
//                           ));
//                         },
//                         child: Text(
//                           "Sign Up",
//                           style: purpletext,
//                         ),
//                       ),
//                     ],
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

import 'package:chatapp/core/constants.dart';
import 'package:chatapp/core/function.dart';
import 'package:chatapp/pages/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Stack(
      children: [
        Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              height25,
              InkWell(
                onTap: () {
                  googleSignIn();
                },
                // hoverColor: grey,
                child: Container(
                  width: size.width * 0.9,
                  height: size.width * 0.13,
                  decoration: BoxDecoration(
                      border: Border.all(color: white),
                      borderRadius: BorderRadius.circular(20),
                      color: black),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-icon-png-transparent-background-osteopathy-16.png')),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(fontSize: 20, color: white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              height25,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account? ",
                    style: TextStyle(color: white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
