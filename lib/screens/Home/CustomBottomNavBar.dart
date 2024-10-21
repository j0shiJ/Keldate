// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keldate/screens/Home/Events_screen.dart';
import 'package:keldate/widgets/Commons.dart';
import 'package:sizer/sizer.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // List of screens corresponding to each icon in the bottom navigation bar
  bool _isSwitchOn = false;

  final List<Widget> screens = [
    EventsScreen(),
    Center(child: Text('Attendance Screen')),
    Center(child: Text('Agenda Screen')),
    Center(child: Text('Epocket Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
    Center(child: Text('Forms Screen')),
  ];

  // List of bottom navigation bar icons
  final List<String> bottomSheetIcons = [
    'assets/icons/Events.png',
    'assets/icons/Attendance.png',
    'assets/icons/Agenda.png',
    'assets/icons/Epocket.png',
    'assets/icons/Forms.png',
    'assets/icons/Contacts.png',
    'assets/icons/Messages.png',
    'assets/icons/PersonalData.png',
    'assets/icons/RollingHeritage.png',
    'assets/icons/RealEstate.png',
    'assets/icons/Other.png',
    'assets/icons/etc.png',
  ];
  final List<String> iconNames = [
    'Events',
    'Attendance',
    'Agenda',
    'Epocket',
    'Forms',
    'Contacts',
    'Messages',
    'Personal Data',
    'Rolling Heritage',
    'Real Estate',
    'Other',
    'Etc.',
  ];
  // List of icons for the bottom sheet
  // final List<String> bottomSheetIcons = [
  //   'assets/icons/Events.png',
  //   'assets/icons/Attendance.png',
  //   'assets/icons/Agenda.png',
  //   'assets/icons/Epocket.png',
  //   'assets/icons/Forms.png',
  //   'assets/icons/Contacts.png',
  //   'assets/icons/Messages.png',
  //   'assets/icons/PersonalData.png',
  //   'assets/icons/RollingHeritage.png',
  //   'assets/icons/RealEstate.png',
  //   'assets/icons/Other.png',
  //   'assets/icons/etc.png',
  // ];

  // Current selected index for the bottom navigation bar
  int selectedIndex = 0;

  // Function to show the bottom sheet with the grid of icons
  void showIconGrid(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: bottomSheetIcons.length,
            itemBuilder: (context, index) {
              return Image.asset(
                bottomSheetIcons[index],
                height: 50.0,
                width: 50.0,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar that stays on top of all screens
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((7000 / 852).h),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF4F7FB),
          title: Padding(
            padding: EdgeInsets.fromLTRB((1000 / 393).w, 20, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff006EBC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        fixedSize: Size((6600 / 393).w, (3100 / 852).h),
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'lose ^',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (800 / 393).w,
                    ),
                    Row(
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
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Transform.scale(
                            scaleY: 0.8,
                            scaleX: 0.8,
                            child: Switch(
                              value: _isSwitchOn, // Toggle switch state
                              onChanged: (value) {
                                setState(() {
                                  _isSwitchOn = value;
                                });
                              },
                              activeColor: const Color(0xff006EBC),
                              inactiveThumbColor: Colors.white,
                              activeTrackColor: const Color(0xffD9D9D9),
                              inactiveTrackColor: Color(0xffD9D9D9),
                              trackOutlineColor:
                                  MaterialStateProperty.resolveWith(
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
                      ],
                    ),
                    SizedBox(
                      width: (9800 / 393).w,
                    ),
                    Container(
                      height: (3100 / 852).h,
                      width: (3100 / 852).h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors
                            .white, // Correctly placed here in the BoxDecoration
                      ),
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: (1000 / 393).w,
                    ),
                    CircleAvatar(
                      radius: (2000 / 852).h,
                    ),
                  ],
                ),
                SizedBox(
                  height: (3000 / 852).h,
                ),
                // Row(
                //   children: [CustomSearchBar(hintText: "Professional")],
                // )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: screens[selectedIndex], // Show the selected screen
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: (2400 / 393).w, vertical: (3000 / 852).h),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int index = 0; index < bottomSheetIcons.length; index++)
                Container(
                  height: (5000 / 852).h,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index; // Update selected index
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: (2000 / 393).w),
                      child: Container(
                        child: Column(
                          children: [
                            Image.asset(
                              bottomSheetIcons[index],
                              height: (2779 / 393).w,
                              width: (2779 / 393).w,
                              color: selectedIndex == index
                                  ? Colors.blue
                                  : Colors
                                      .black, // Highlight selected icon in blue
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              iconNames[index],
                              style: TextStyle(
                                color: selectedIndex == index
                                    ? Colors.blue
                                    : Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              // Button to open the bottom sheet
              IconButton(
                icon: Icon(Icons.more_horiz, color: Colors.black),
                onPressed: () => showIconGrid(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
