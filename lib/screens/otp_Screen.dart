import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For restricting input type

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
      backgroundColor: Colors.grey[100], // Background color
      appBar: AppBar(
        title: Text('Enter OTP'),
        backgroundColor: Colors.blue, // Adjust as per your theme
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Instruction text
              Text(
                'Please enter the 6-digit OTP',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Row for OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return _otpBox(index);
                }),
              ),
              SizedBox(height: 40),

              // Submit Button
              ElevatedButton(
                onPressed: _submitOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Button color as per your theme
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for each OTP input box
  Widget _otpBox(int index) {
    return Container(
      width: 45, // Width of each OTP box
      height: 55, // Height of each OTP box
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
        controller: _otpControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1, // Only 1 digit per box
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          counterText: '', // Hide the character count under the box
          border: InputBorder.none, // Remove the default textfield border
        ),
        onChanged: (value) {
          // Automatically move to the next field when a digit is entered
          if (value.isNotEmpty && index < 5) {
            FocusScope.of(context).nextFocus();
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
