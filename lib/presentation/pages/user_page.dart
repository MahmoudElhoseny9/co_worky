import 'dart:io';

import 'package:co_worky/presentation/widgets/user_widgets/User_text_field.dart';
import 'package:co_worky/presentation/widgets/user_widgets/save_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    //double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blueGrey,
                  Colors.white
                ], // Replace with your desired colors
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            _image == null ? null : FileImage(_image!),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 40,
                        ),
                        onPressed: () {
                          pickImage();
                        },
                        icon: Icon(
                          color: Colors.white,
                          Icons.add_a_photo,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mahmoud Elhoseny",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("User Name"),
                          SizedBox(
                            height: 10,
                          ),
                          UserTextField(
                            icon: Icons.person,
                            initialValue: "mahoud",
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Email ID"),
                          SizedBox(
                            height: 10,
                          ),
                          UserTextField(
                            icon: Icons.email,
                            initialValue: "mahmoudelhoseny14@gmail.com",
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Mobile Number"),
                          SizedBox(
                            height: 10,
                          ),
                          UserTextField(
                            icon: Icons.smartphone,
                            initialValue: "01030203280",
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Date Of Birth"),
                          SizedBox(
                            height: 10,
                          ),
                          UserTextField(
                            icon: Icons.calendar_month,
                            initialValue: "08-8-2000",
                            keyboardType: TextInputType.datetime,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Faculty or Major"),
                          SizedBox(
                            height: 10,
                          ),
                          UserTextField(
                            icon: Icons.track_changes,
                            initialValue: "Computer and Information",
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: SaveUserButton(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}

