import 'package:flutter/material.dart';
import 'package:stage1_task/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:
            theme.colorScheme.brightness == Brightness.dark
                ? AppColors.background
                : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.background.withValues(alpha: 0.2),
            blurRadius: 10,
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
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'Passionate Flutter developer creating beautiful, cross-platform mobile applications. I love turning ideas into reality through clean, efficient code and user-friendly interfaces.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 16,
              // color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
