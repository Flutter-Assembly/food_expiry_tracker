import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/ui/core/button_solid.dart';
import 'package:food_expiry_tracker/ui/core/custom_textform_field.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:food_expiry_tracker/utilities/app_constants.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  File _image;
  final imagePicker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image was selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 28.0,
          ),
          color: Colors.black,
          onPressed: () => ExtendedNavigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: kHeadingText3Medium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kPrimaryYellow, width: 5),
                ),
                child: _image == null
                    ? Image.asset('assets/images/user2.png')
                    : CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.file(
                            _image,
                            height: 85,
                            width: 85,
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      builder: (context) => SizedBox(
                        height: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          children: [
                            Container(
                              height: 3,
                              width: 55,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      'Select Picture',
                                      textAlign: TextAlign.center,
                                      style: kHeadingText2Medium,
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      'Choose a picture from',
                                      textAlign: TextAlign.center,
                                      style: kBodyText3Regular,
                                    ),
                                    SizedBox(height: 40),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () => getImageFromGallery()
                                              .then((value) =>
                                                  Navigator.pop(context)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                  '$imagesPath/photo_gallery_icon.png'),
                                              SizedBox(height: 20),
                                              Text(
                                                'Photo Gallery',
                                                style: kHeadingText3Medium
                                                    .copyWith(
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Image.asset(
                                                '$imagesPath/camera_icon.png'),
                                            SizedBox(height: 20),
                                            Text(
                                              'Camera',
                                              style:
                                                  kHeadingText3Medium.copyWith(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Change Profile Picture',
                    textAlign: TextAlign.center,
                    style: kHeadingText2Medium.copyWith(fontSize: 15),
                  ),
                ),
              ),
              CustomTextFormField(
                height: 35,
                hintText: 'Name',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                height: 35,
                lengthLimit: 11,
                isNumberOnlyInput: true,
                hintText: 'Phone Number',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                height: 35,
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 30),
              ButtonSolid(
                onPressed: () {},
                title: 'Save Changes',
                bgColor: kPrimaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  getClip(Size size) {
    return Rect.fromLTWH(0, 0, 200, 100);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
