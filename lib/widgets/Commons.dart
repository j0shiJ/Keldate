import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart'; // Make sure Sizer is properly installed and imported

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Nullable to make it optional
  final double? height; // Nullable to make it optional
  final Color buttonColor;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width, // Width can be provided or default based on the screen size
    this.height, // Height can be provided or default based on the screen size
    this.buttonColor = const Color(0xff006EBC), // Default button color
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero, // To ensure no internal padding issues
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              3.h), // Use Sizer to set responsive border radius
        ),
        backgroundColor:
            Colors.transparent, // The container will handle the button color
        shadowColor: Colors.transparent, // Remove the button shadow
      ),
      child: Container(
        width: width != null
            ? width!.w
            : 80.w, // Set width based on screen size if not provided
        height: height != null
            ? height!.h
            : 5.5.h, // Set height based on screen size if not provided
        decoration: BoxDecoration(
          color: buttonColor, // Button color from parameter
          borderRadius: BorderRadius.circular(
              1.h), // Use Sizer for consistent border radius
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Text color from parameter
              fontSize: 16.sp, // Responsive text size using Sizer
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

//form field
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData prefixIcon; // Icon as a parameter
  final TextInputType keyboardType;
  final double? width; // Optional width parameter

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon, // Icon passed in constructor
    this.keyboardType = TextInputType.text, // Default keyboard type is text
    this.width, // Optional width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Hide the keyboard on tap
      },
      child: SizedBox(
        width: width ??
            double
                .infinity, // Use width if specified, else default to full width
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // White background for the TextFormField
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.grey), // Inactive label color
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
              borderSide: const BorderSide(
                  color:
                      Colors.transparent), // Transparent border when inactive
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: Colors.transparent), // Transparent when inactive
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: Colors.blue, width: 2.0), // Blue border when active
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(prefixIcon),
            ),
          ),
          style: TextStyle(color: Colors.grey), // Grey text color
          keyboardType: keyboardType, // Dynamic keyboard type
        ),
      ),
    );
  }
}

//text button
class CustomInkWellTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;

  const CustomInkWellTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF3276E8), // Hex color #3276E8
          fontFamily: 'Poppins', // Poppins font family
          fontWeight: FontWeight.w400, // Font weight 400
        ),
      ),
    );
  }
}
