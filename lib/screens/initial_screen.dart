import 'package:books_app/constants/colors.dart';
import 'package:books_app/constants/routes.dart';
import 'package:books_app/services/auth.dart';
import 'package:books_app/services/database_service.dart';
import 'package:books_app/utils/size_config.dart';
import 'package:books_app/widgets/auth/social_media_handles.dart';
import 'package:books_app/widgets/button.dart';
import 'package:books_app/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  //Init FirebaseFirebaseAuthService

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final FirebaseAuthService firebaseAuthService =
        Provider.of<FirebaseAuthService>(context);
    SizeConfig().init(context);
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(top: 30, right: 15.0),
                  //     child: _skipButton(),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    'assets/images/ExplrLogo(150x150).png',
                    scale: 1.4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Explr',
                    style: GoogleFonts.lato(
                        color: Theme.of(context).textTheme.bodyText1!.color,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          EmailTextField(_emailController),
                          PasswordTextField(_passwordController)
                        ],
                      ),
                    ),
                  ),
                  buildForgotPasswordButton(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Button(
                      name: 'Sign in',
                      color: Theme.of(context).colorScheme.background,
                      myFunction: () async {
                        if (formKey.currentState!.validate()) {
                          firebaseAuthService.signInWithEmail(context,
                              _emailController.text, _passwordController.text);
                        }

                        print("sign in");
                      },
                    ),
                    // child: AuthButton(
                    //   text: 'Sign in',
                    //   formKey: formKey,
                    //   onClick: onSubmit,
                    //   onSuccess: onSuccess,
                    //   onError: onError,
                    // ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 1,
                        width: 120,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        ' or you can ',
                        style: GoogleFonts.poppins(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                          height: 1,
                          width: 120,
                          color: Theme.of(context).colorScheme.background),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _signUpWithEmail(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SocialMediaHandles(),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: Text('Forgot password?',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: const Color.fromRGBO(224, 39, 20, 1),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
        onPressed: () {
          Navigator.pushNamed(context, Routes.FORGOT_PASSWORD);
        },
      ),
    );
  }

  // Future<String> onSubmit() async {
  //   return BackendService()
  //       .login(_emailController.text, _passwordController.text);
  // }

  void onSuccess() {
    print('Logged in successfully');
    Navigator.pushNamed(context, Routes.HOME);
  }

  Widget _signUpWithEmail() {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AspectRatio(
        aspectRatio: 343 / 52,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
                side:
                    BorderSide(color: Theme.of(context).colorScheme.background),
                borderRadius: BorderRadius.circular(16)),
            minimumSize: Size(width * 0.6, height * 0.08),
          ),
          label: Text(
            'Sign up with Email',
            style: GoogleFonts.poppins(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          onPressed: () async {
            Navigator.pushNamed(context, Routes.REGISTER);
          },
          icon: Icon(Icons.mail_outline_outlined,
              color: Theme.of(context).colorScheme.background),
        ),
      ),
    );
  }

// OLD _signUpWithEmailButton
  // Widget _signUpwithEmail() {
  //   return SizedBox(
  //     height: 44,
  //     width: 250,
  //     child: ElevatedButton.icon(
  //       style: ElevatedButton.styleFrom(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  //         // primary: Color(0xFF246BFD),
  //         primary: blackButton,
  //       ),
  //       onPressed: () async {
  //         Navigator.pushNamed(context, Routes.REGISTER);
  //       },
  //       icon: const Icon(
  //         Icons.mail_outline_outlined,
  //         color: Colors.white,
  //       ),
  //       label: Text(
  //         'Sign up with email',
  //         style: GoogleFonts.poppins(
  //           fontWeight: FontWeight.w500,
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _skipButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       print('Skip button pressed');
  //       Navigator.pushNamed(context, Routes.DASHBOARD);
  //     },
  //     style: ElevatedButton.styleFrom(
  //       primary: blackButton,
  //       onPrimary: Colors.white12,
  //       minimumSize: const Size(55, 24.75),
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  //     ),
  //     child: Text(
  //       'Skip',
  //       style: GoogleFonts.poppins(
  //           color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
  //     ),
  //   );
  // }

}
