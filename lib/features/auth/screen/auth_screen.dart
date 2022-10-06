import 'package:amazon_clone_app/common/widget/custom_button.dart';
import 'package:amazon_clone_app/common/widget/custom_textfield.dart';
import 'package:amazon_clone_app/constants/golbal_variables.dart';
import 'package:amazon_clone_app/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthServices authServices = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authServices.signUpUser(
      context: context,
      name: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  void signInUser() {
    authServices.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: [
                      CustomTextFiled(
                        controller: _nameController,
                        hintText: 'Name',
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      CustomTextFiled(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      CustomTextFiled(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: "Create Account",
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      ),
                    ],
                  ),
                  key: _signUpFormKey,
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundColor,
              leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              title: const Text(
                "Sign-in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.white,
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 7,
                      ),
                      CustomTextFiled(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      CustomTextFiled(
                        controller: _passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                          text: "Log In",
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                    ],
                  ),
                  key: _signInFormKey,
                ),
              ),
          ],
        ),
      )),
    );
  }
}
