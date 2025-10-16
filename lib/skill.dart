import 'package:flutter/material.dart';
import 'package:stage1_task/colors.dart';

class SkillSection extends StatelessWidget {
  SkillSection({super.key});

  final List<String> skills = [
    "Flutter",
    "Dart",
    "JavaScript",
    "HTML",
    "CSS",
    "etc",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:
            theme.colorScheme.brightness == Brightness.dark
                ? AppColors.background
                : Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
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
                style: theme.textTheme.titleLarge?.copyWith(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    );
  }
}
