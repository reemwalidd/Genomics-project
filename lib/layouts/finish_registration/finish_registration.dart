import 'package:flutter/material.dart';
import 'package:lung/components/components.dart';
import 'package:lung/layouts/finish_registration/complete_registration.dart';

 enum Gender {male, female}

class FinishRegistration extends StatefulWidget {
  const FinishRegistration({Key? key}) : super(key: key);

  @override
  State<FinishRegistration> createState() => _FinishRegistrationState();
}

class _FinishRegistrationState extends State<FinishRegistration> {
  TextEditingController ageController = TextEditingController();
  TextEditingController treatmentController = TextEditingController();

  Gender? _gender = Gender.female;
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.png',
                  height: 100,
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: ageController,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Age must be not empty';
                    }
                    return null;
                  },
                  inputType: TextInputType.number,
                  label: 'Age',
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      decoration:  BoxDecoration(
                        color: const Color(0xffF5CFCD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        title:  const Text('Female'),
                        leading: Radio(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                      width: 150,
                      decoration:  BoxDecoration(
                        color: const Color(0xffF5CFCD),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ListTile(
                        title:  const Text('Male'),
                        leading: Radio(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                DropdownButtonHideUnderline(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffFF0000),),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xffFF0000),),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    isExpanded: true,
                    elevation: 8,
                    hint: const Text('Choose Your Marital Status'),
                    icon: const Icon(Icons.arrow_drop_down,size: 35,),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Single', 'Married', ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: treatmentController,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Treatment must be not empty';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  label: 'Last Treatment',
                ),
                const SizedBox(height: 20,),
                defaultButton(
                  text: 'Next',
                  onPressed: (){
                    navigateTo(context, const CompleteRegistration());
                  },
                  radius: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
