import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keldate/screens/Signup_Screen.dart';
import 'package:keldate/theme/provider/theme_provider.dart';
import 'package:keldate/theme/theme_helper.dart';
import 'package:keldate/widgets/Commons.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(), child: LoginScreen());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false; // Checkbox state
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  String _countryCode = '+1'; // Default country code
  XFile? _pickedImage; // Holds the selected image
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  String signin = "Sign in";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide keyboard when tapping outside
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(21.h), // Set the height of the AppBar
          child: AppBar(
            automaticallyImplyLeading:
                false, // To remove the default back button
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                // Background Image
                Image.asset(
                  'assets/images/appbarBGimg.png', // Replace with your background image
                  fit: BoxFit.cover,
                ),
                // Logo and Text at the bottom left
                Padding(
                  padding: EdgeInsets.only(
                      left: 2.5
                          .h, // Adjusted left padding to move it a bit to the left
                      bottom: 2.8
                          .h), // Adjusted bottom padding for vertical positioning
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo Image
                        Container(
                          child: SvgPicture.asset(
                            'assets/images/Group.svg',
                            height: 4.7.h,
                          ),
                        ),
                        SizedBox(
                            height:
                                1.6.h), // Reduced spacing between logo and text
                        // Text below the logo
                        Row(
                          children: [
                            Text(
                              'Sign in ',
                              style: TextStyle(
                                color: LightCodeColors().whiteA700,
                                fontSize: 21.sp,
                                height: 0.12
                                    .h, // Adjust line height to reduce space between lines
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'to your account ',
                              style: TextStyle(
                                color: LightCodeColors().whiteA700,
                                fontSize: 20.sp,
                                height: 0.12
                                    .h, // Adjust line height to reduce space between lines
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
            backgroundColor:
                Colors.transparent, // Make the AppBar background transparent
            elevation: 0, // Remove the AppBar shadow
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
                    onPressed: () {},
                    // width: Adaptive.w(29),
                    // height: 2.h,
                    width: 29.3,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.5.h, 0, 2.5.h),
                  child: CustomTextFormField(
                      controller: _phoneController,
                      labelText: "Enter your mobile number",
                      hintText: "Mobile Number",
                      prefixIcon: Icons.phone_iphone_outlined)),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 1.5.h),
                  child: CustomTextFormField(
                      controller: _otpController,
                      labelText: "Enter the code",
                      hintText: "Verification code",
                      prefixIcon: Icons.lock)),
              Row(
                children: [
                  CustomInkWellTextButton(
                    onPressed: () {},
                    text: "  Resend verification code?",
                    fontSize: 13.sp,
                  ),
                  Spacer(),
                  CustomInkWellTextButton(
                    onPressed: () {},
                    text: "Get code",
                    fontSize: 13.sp,
                  ),
                ],
              ),
              SizedBox(
                height: 20.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an Account? "),
                  CustomInkWellTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignupScreen.routeName);
                    },
                    text: "Sign Up",
                    fontSize: 16.sp,
                  )
                ],
              ),
              Spacer(),
              Row(
                children: [
                  // Checkbox
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
                  // Agreement Text
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "I have read and agree to the ",
                        style: TextStyle(
                          color: Colors.black, // Default text color
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp, // Font size using Sizer
                        ),
                        children: [
                          TextSpan(
                            text: "privacy policy and terms",
                            style: TextStyle(
                              color:
                                  Color(0xFF4D81E7), // #4D81E7 for link color
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            // You can add an onTap gesture here for privacy policy and terms
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Handle privacy policy and terms click
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
