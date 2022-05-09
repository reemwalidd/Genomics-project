import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File? _image;
  List? _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {
        // pass
      });
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
      model: 'assets/images/model_unquant.tflite',
      labels: 'assets/images/labels.txt',
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image!);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image!);
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.blue)),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  indicatorColor: Colors.white60,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue,
                  tabs: const[
                    Tab(
                      text: "How to Use?",
                    ),
                    Tab(
                      text: "Home", //"منتهية",
                    ),
                  ],
                ),
              ),
              Flexible(
                child: TabBarView(
                  children: [
                    buildPage2('How to Page'),
                    buildPage1('Home Page'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildPage1(String text) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: ListView(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 6),
                  const Text("Cancer Detection",
                      style: TextStyle(
                        color: Color(0xFFE99600),
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                      )),
                  const SizedBox(height: 10),
                  Center(
                      child: _loading
                          ? SizedBox(
                              width: 200,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/cancer.png',
                                    cacheHeight: 200,
                                    cacheWidth: 200,
                                  ),
                                  const SizedBox(height: 50),
                                ],
                              ))
                          : Column(
                            children: <Widget>[
                              SizedBox(
                                height: 250,
                                child: Image.file(_image!),
                              ),
                              const SizedBox(height: 20),
                              _output != null
                                  ? Text(
                                      '${_output![0]}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                      ),
                                    )
                                  : Container(),
                            ],
                          )),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding:  const EdgeInsets.only(top: 1.0),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                             Text('  ',
                                style:  TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Roboto',
                                  color:  Color(0xFF26C6DA),
                                )),
                             Text(
                              '',
                              style:  TextStyle(
                                  fontSize: 35.0,
                                  fontFamily: 'Roboto',
                                  color:  Color(0xFF26C6DA)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => pickImage(),
                            child: Container(
                                width: MediaQuery.of(context).size.width - 210,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 17,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE99600),
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text("Take a photo",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20))),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () => pickGalleryImage(),
                            child: Container(
                                width: MediaQuery.of(context).size.width - 210,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 17,
                                ),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE99600),
                                    borderRadius: BorderRadius.circular(6)),
                                child: const Text("Select from the storage",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18))),
                          ),
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }

  Widget buildPage2(String text) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 25),
              const Text("How To Use",
                  style: TextStyle(
                    color: Color(0xFFE99600),
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  )),
              const SizedBox(height: 10),
              Center(
                  child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/howto.png',
                    cacheHeight: 150,
                    cacheWidth: 150,
                  ),
                ],
              )),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding:  const EdgeInsets.only(top: 1.0),
                    child:  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                         Text(
                          'Steps for Prediction - ',
                          style:  TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'Roboto',
                              color:  Color(0xFF26C6DA)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
               Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child:  Row(
                      children: const <Widget>[
                         Text('  ',
                            style:  TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Roboto',
                              color:  Color(0xFF26C6DA),
                            )),
                      ],
                    ),
                  ),
                   const Text(
                      '1. Go to Home Tab.\n2. Select one option.\n    - Take a photo: Use camera to take photo of X-Ray.\n    - Select from storage: Use a saved image.\n\nYour Prediction result is ready.',
                      style:  TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
