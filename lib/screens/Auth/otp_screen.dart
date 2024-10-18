import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keldate/screens/Home/home_screen.dart';

import 'package:keldate/widgets/Commons.dart';
import 'package:sizer/sizer.dart'; // For restricting input type

class OtpScreen extends StatefulWidget {
  static const String routeName = '/otp';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // Controller for each OTP input field
  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7FB), // Background color
      appBar: AppBar(
        foregroundColor: Color(0xffF4F7FB),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF4F7FB), // Adjust as per your theme
        actions: [
          CustomButton(
            text: 'Valider',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
                (Route<dynamic> route) =>
                    false, // This removes all previous routes
              );
            },
            width: 29.3,
          ),
          SizedBox(
            width: (1866 / 393).w,
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(
            (4300 / 393).w, (9500 / 853).h, (4300 / 393).w, 0),
        child: Column(
          children: [
            // Add the image above the OTP verification text

            Image.asset(
              'assets/images/OTP.png', // Replace with your image path
              width: (14300 / 393).w,
              height: (14900 / 852).h,
              fit: BoxFit.contain, // Adjust this as per your requirement
            ),
            SizedBox(
                height: (4700 / 852).h), // Space between the image and the text

            // Instruction text
            Text(
              ' OTP verification',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: (1200 / 852).h),
            Text(
              'Enter OTP sent to XXXXXXX768',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                fontFamily: "Montserrat",
              ),
            ),
            SizedBox(height: (3600 / 852).h),

            // Row for OTP input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(6, (index) {
                return _otpBox(index);
              }),
            ),
            SizedBox(height: 40),

            // Submit Button
          ],
        ),
      ),
    );
  }

  // Widget for each OTP input box
  Widget _otpBox(int index) {
    return Container(
      width: 4.69.h, // Width of each OTP box
      height: 4.69.h, // Height of each OTP box
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        controller: _otpControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: Colors.transparent, // Only 1 digit per box
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black),
        decoration: InputDecoration(
          counterText: '', // Hide the character count under the box
          border: InputBorder.none, // Remove the default textfield border
        ),
        onChanged: (value) {
          // Automatically move to the next field when a digit is entered
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            // When backspace is pressed in an empty field, move to the previous field
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }

  // Method to handle OTP submission
  void _submitOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    // Process the OTP (e.g., validate, send to server)
    print('Entered OTP: $otp');
  }

  @override
  void dispose() {
    _otpControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }
}
