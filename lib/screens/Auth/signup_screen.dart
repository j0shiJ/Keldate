import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keldate/screens/Auth/otp_screen.dart';

import 'package:keldate/theme/theme_helper.dart';
import 'package:keldate/widgets/Commons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _countryCode = '+1';
  XFile? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    // Request storage permission
    var status = await Permission.storage.request();

    if (status.isGranted) {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedImage = image;
      });
    } else {
      // Handle the case when permission is denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Permission denied to access the photo library')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(21.h),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/appbarBGimg.png',
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 2.5.h, bottom: 2.8.h),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/images/Group.svg',
                          height: 4.7.h,
                        ),
                        SizedBox(height: 1.6.h),
                        Row(
                          children: [
                            Text(
                              'Sign in ',
                              style: TextStyle(
                                color: LightCodeColors().whiteA700,
                                fontSize: 21.sp,
                                height: 0.12.h,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'to your account ',
                              style: TextStyle(
                                color: LightCodeColors().whiteA700,
                                fontSize: 20.sp,
                                height: 0.12.h,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        body: Container(
          color: Color(0xffF4F7FB),
          padding: EdgeInsets.all(2.5.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: 'Valider',
                    onPressed: () {
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    },
                    width: 29.3,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 2.5.h, 0, 2.5.h),
                child: CustomTextFormField(
                  controller: _emailController,
                  labelText: "Enter your email",
                  hintText: "Email",
                  prefixIcon: Icons.email_outlined,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 1.5.h),
                child: Row(
                  children: [
                    CountryCodePicker(
                      onChanged: (country) {
                        setState(() {
                          _countryCode = country.dialCode!;
                        });
                      },
                      backgroundColor: Colors.white,
                      initialSelection: 'FR',
                      favorite: ['+33', 'FR', '+91', 'IN'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFormField(
                        width: 52.14.w,
                        controller: _phoneController,
                        labelText: "Phone number",
                        hintText: "Phone number",
                        prefixIcon: Icons.phone_iphone_outlined,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Profile Photo",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              // Container for image picker
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                width: double.infinity,
                height: 33.h, // Height for the image picker container
                child: Center(
                  child: _pickedImage == null
                      ? IconButton(
                          icon: Icon(Icons.add_a_photo_outlined, size: 5.h),
                          onPressed: _pickImage,
                        )
                      : Image.file(
                          File(_pickedImage!.path),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "I have read and agree to the ",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        children: [
                          TextSpan(
                            text: "privacy policy and terms",
                            style: TextStyle(
                              color: Color(0xFF4D81E7),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Privacy policy and terms clicked");
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
