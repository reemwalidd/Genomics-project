

import 'package:flutter/material.dart';
import 'package:lung/components/components.dart';
import 'package:intl/intl.dart';
import 'package:lung/home.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({Key? key}) : super(key: key);

  @override
  State<CompleteRegistration> createState() => _CompleteRegistrationState();
}

enum Genatic {yes, no}
enum Disease {yes, no}

class _CompleteRegistrationState extends State<CompleteRegistration> {
  TextEditingController dateController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController genaticController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();
  Genatic? _genatic = Genatic.no;
  Disease? _disease = Disease.no;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.png',
                  height: 100,
                ),
                const SizedBox(height: 30,),
                // gentaic history
                const Text('Is there a genatic history of the disease? If yes what?',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10,),
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
                        title:  const Text('Yes'),
                        leading: Radio(
                          value: Genatic.yes,
                          groupValue: _genatic,
                          onChanged: (Genatic? value) {
                            setState(() {
                              _genatic = value;
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
                      child: Center(
                        child: ListTile(
                          title:  const Text('No'),
                          leading: Radio(
                            value: Genatic.no,
                            groupValue: _genatic,
                            onChanged: (Genatic? value) {
                              setState(() {
                                _genatic = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                defaultTextFormField(
                  controller: genaticController,
                  validator: (value){
                    if(value!.isEmpty)
                      {
                        return'Genatic History must be not null';
                      }
                    return null;
                  },
                  inputType: TextInputType.text,
                  label: 'Genatic History',
                ),
                const SizedBox(height: 20,),
                // diseases history
                const Text('Do you suffer from any diseases? If yes what?',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10,),
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
                        title:  const Text('Yes'),
                        leading: Radio(
                          value: Disease.yes,
                          groupValue: _disease,
                          onChanged: (Disease? value) {
                            setState(() {
                              _disease = value;
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
                      child: Center(
                        child: ListTile(
                          title:  const Text('No'),
                          leading: Radio(
                            value: Disease.no,
                            groupValue: _disease,
                            onChanged: (Disease? value) {
                              setState(() {
                                _disease = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                defaultTextFormField(
                  controller: diseaseController,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return'Disease History must be not null';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  label: 'Other Diseases',
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: doctorController,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Doctor Name must be not empty';
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  label: 'Doctor Name',
                  prefix: Icons.person
                ),
                const SizedBox(height: 20,),
                defaultTextFormField(
                  controller: dateController,
                  validator: (value){
                    if(value!.isEmpty)
                    {
                      return 'Date must be not empty';
                    }
                    return null;
                  },
                  onTap: ()
                  {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.parse('2022-05-01'),
                    ).then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  inputType: TextInputType.text,
                  label: 'Last Visit',
                  prefix: Icons.calendar_today_outlined
                ),
                const SizedBox(height: 20,),
                defaultButton(
                  text: 'Next',
                  onPressed: (){
                    navigateTo(context, const Home());
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
