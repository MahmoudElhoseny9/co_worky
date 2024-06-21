import 'dart:io';

import 'package:co_worky/presentation/widgets/custom_button.dart';
import 'package:co_worky/presentation/widgets/edit_profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExtraInfoPage extends StatefulWidget {
  const ExtraInfoPage({super.key});

  @override
  State<ExtraInfoPage> createState() => _ExtraInfoPageState();
}

class _ExtraInfoPageState extends State<ExtraInfoPage> {
  String? selectedCountry;
  String? selectedState;
  final _userController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  File? _imageFile;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: const AlignmentDirectional(0, -1),
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0, 0.5],
              begin: const AlignmentDirectional(0, 1),
              end: const AlignmentDirectional(0, -1),
              colors: [
                Theme.of(context).primaryColor.withOpacity(0.2),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, \nSet up your profile',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Align(
                        alignment: const Alignment(0, 0),
                        child: _imageFile != null
                            ? Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(_imageFile!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('assets/no_photo.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                      ),
                      Align(
                        alignment: const Alignment(0.2, 0),
                        child: IconButton.filled(
                          onPressed: _pickImage,
                          style: IconButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                          icon: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Upload Photo',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              2,
                            ),
                          ),
                        ],
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Form(
                        key: _formKey,
                        child:  Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    EditProfileTextField(
                                      controller: _userController,
                                      labelText: 'User name',
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your user name';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    EditProfileTextField(
                                      controller: _nameController,
                                      labelText: 'Full name',
                                      keyboardType: TextInputType.name,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Full Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    EditProfileTextField(
                                      controller: _phoneController,
                                      labelText: "Phone Number",
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your Phone number';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8, 4, 8, 4),
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select your country';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          labelText: "Country",
                                        ),
                                        value: selectedCountry,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedCountry = newValue;
                                          });
                                        },
                                        items: ["co-worker", "user"]
                                            .map((String country) {
                                          return DropdownMenuItem<String>(
                                            value: country,
                                            child: Text(country),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    EditProfileTextField(
                                      controller: _addressController,
                                      labelText: "Address",
                                      keyboardType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your address';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    CustomButton(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      textColor: Colors.white,
                                      text: "Save",
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }
}
