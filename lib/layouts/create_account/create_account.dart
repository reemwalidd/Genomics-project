import 'package:flutter/material.dart';
import 'package:lung/components/components.dart';
import 'package:lung/layouts/finish_registration/finish_registration.dart';
import 'package:lung/layouts/login/login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
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
                const Text('Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700
                  ),
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: nameController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'Name must be not empty';
                      }
                    return null;
                  },
                  inputType: TextInputType.name,
                  label: 'Name',
                  prefix: Icons.person,
                ),
                const SizedBox(height: 10,),
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
                  controller: phoneController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Phone must be not empty';
                    }
                    return null;
                  },
                  inputType: TextInputType.phone,
                  label: 'Phone',
                  prefix: Icons.phone,
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
                const SizedBox(height: 10,),
                defaultTextFormField(
                  controller: confirmPasswordController,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Name must be not empty';
                    }
                    else if(value != passwordController.text)
                    {
                      return 'Password does not match';
                    }
                    return null;
                  },
                  inputType: TextInputType.visiblePassword,
                  label: 'Confirm Password',
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
                  text: 'Sign up',
                  onPressed: (){
                    navigateTo(context, const FinishRegistration());
                  },
                  radius: 30,
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Have an account?',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    ),
                    defaultTextButton(
                      function: (){
                        navigateAndFinish(context, const LoginScreen());
                      },
                      text: 'Sign in'
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
