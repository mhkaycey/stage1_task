import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stage1_task/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  List<String> skills = ["Flutter", "Dart", "JavaScript", "HTML", "CSS", "etc"];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      // backgroundColor: AppColors.shadow,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Card
            Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: size.height * 0.33,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/profile.jpg',
                          ), // You'll need to add this asset
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Profile Info
                  Positioned(
                    top: size.height * 0.33,

                    left: 0,
                    right: 0,
                    child: Container(
                      height: size.height * 0.5,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        // borderRadius: BorderRadius.only(
                        //   bottomLeft: Radius.circular(20),
                        //   bottomRight: Radius.circular(20),
                        // ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'EGEDE',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: AppColors.surface,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Text(
                            'KELECHUKWU MARK',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: AppColors.surface,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'MOBILE APP DEVELOPER',
                            style: TextStyle(
                              fontSize: 12,
                              // color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Download button
                  Positioned(
                    top: size.height * 0.29,
                    right: 20,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.download,
                          color: Colors.black,
                          size: 24,
                        ),
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Profile downloaded'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // About Section - Removed Positioned wrapper
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    // color: Colors.white,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.info),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Passionate Flutter developer creating beautiful, cross-platform mobile applications. I love turning ideas into reality through clean, efficient code and user-friendly interfaces.',
                    style: TextStyle(
                      fontSize: 16,
                      // color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.code),
                      Text(
                        "Skills",
                        style: TextStyle(
                          fontSize: 20,
                          // color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...skills.map(
                        (skill) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(skill),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    // spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.contact_mail),

                      Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  _buildContactItem(Icons.email, 'kelechimark041@gmail.com'),
                  _buildContactItem(Icons.phone, '+2348038110578'),
                  _buildContactItem(
                    Icons.social_distance,
                    "https://github.com/mhkaycey",
                  ),
                  // _buildContactItem(Icons.location_on, 'New York, NY'),
                  // _buildContactItem(Icons.language, 'www.johndoe.dev'),
                  // _buildContactItem(Icons.work, 'LinkedIn: /in/johndoe'),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  _buildContactItem(IconData icon, String value) {
    // final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        spacing: 15,
        children: [
          Icon(icon, size: 20),
          Expanded(child: Text(value, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
