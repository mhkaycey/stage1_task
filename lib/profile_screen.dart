import 'package:flutter/material.dart';
import 'package:stage1_task/about.dart';
import 'package:stage1_task/contact.dart';
import 'package:stage1_task/header.dart';
import 'package:stage1_task/skill.dart';

class ProfileScreen extends StatefulWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  const ProfileScreen({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            HeaderSection(
              isDarkMode: widget.isDarkMode,
              onToggleTheme: widget.onToggleTheme,
            ),
            AboutSection(),
            SkillSection(),
            ContactSection(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
