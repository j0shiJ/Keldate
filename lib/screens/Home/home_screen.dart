import 'package:flutter/material.dart';
import 'package:keldate/widgets/Commons.dart';
import 'package:keldate/widgets/CustomBottomNavBar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25.7.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF4F7FB),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), // Curved bottom left corner
              bottomRight: Radius.circular(30), // Curved bottom right corner
            ),
          ),
          title: Padding(
            padding: EdgeInsets.all((1200 / 393).w),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.start, // Aligns button to the left
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff006EBC), // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    fixedSize: Size((6000 / 393).w,
                        (3100 / 852).h), // Width: 66, Height: 31
                    padding: EdgeInsets
                        .zero, // Remove extra padding around the button
                  ),
                  child: Text(
                    'lose ^', // Button text
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Text color
                      fontSize: 16.sp, // Text size (adjust as needed)
                    ),
                  ),
                ),
                SizedBox(
                  width: (800 / 393).w,
                ),
                Row(
                  // Space between icon and switch
                  children: [
                    Container(
                      color: Colors.white,
                      height: (3100 / 852).h,
                      child: const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xffD9D9D9),
                      ),
                    ),
                    Container(
                      height: (3100 / 852).h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5))),
                      child: Transform.scale(
                        scaleY: 0.8,
                        scaleX: 0.8,
                        child: Switch(
                          value: _isSwitchOn, // Initial state (true/false)
                          onChanged: (value) {
                            // Add toggle logic here
                            setState(() {
                              _isSwitchOn = value; // Update switch state
                            });
                          },
                          activeColor:
                              const Color(0xff006EBC), // Toggle switch color
                          inactiveThumbColor:
                              Colors.white, // Inactive color for switch
                          activeTrackColor: const Color(
                              0xffD9D9D9), // Track color when active
                          inactiveTrackColor:
                              Color(0xffD9D9D9), // Track color when inactive
                          trackOutlineColor: MaterialStateProperty.resolveWith(
                            (final Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return null;
                              }

                              return Colors.transparent;
                            },
                          ),
                        ),
                      ),
                    ),

                    // Add Toggle Switch
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [],
      ),
      bottomNavigationBar: ScrollableBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
