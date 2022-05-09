import 'package:flutter/material.dart';
import 'package:lung/components/components.dart';
import 'package:lung/layouts/create_account/create_account.dart';
import 'package:lung/layouts/finish_registration/finish_registration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.png',height: 100,),
                const SizedBox(height: 10,),
                const Text('Login',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: emailController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Email must be not empty';
                    }
                    return null;
                  },
                  inputType: TextInputType.emailAddress,
                  label: 'Email Address',
                  prefix: Icons.email_outlined,
                ),
                const SizedBox(height: 10,),
                defaultTextFormField(
                    controller: passwordController,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'Password must be not empty';
                      }
                      return null;
                    },
                    inputType: TextInputType.visiblePassword,
                    label: 'Password',
                    prefix: Icons.lock,
                    suffix: isVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                    isPassword: isVisible,
                    onSuffixPressed: (){
                      setState(() {
                        isVisible = !isVisible;
                      });
                    }
                ),
                const SizedBox(height: 20,),
                defaultButton(
                  text: 'login',
                  onPressed: (){
                    navigateTo(context, const FinishRegistration());
                  },
                  radius: 30,
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?',
                      style: TextStyle(
                          fontSize: 20
                      ),
                    ),
                    defaultTextButton(
                        function: (){
                          navigateAndFinish(context, const CreateAccount());
                        },
                        text: 'Sign Up'
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
}
