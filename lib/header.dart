import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stage1_task/colors.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final bool isDarkMode;
  const HeaderSection({
    super.key,
    required this.onToggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
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

          Positioned(
            top: size.height * 0.32,

            left: 0,
            right: 0,
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color:
                  theme.colorScheme.brightness == Brightness.dark
                      ? AppColors.background
                      : AppColors.whiteColor,

              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EGEDE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      'KELECHUKWU MARK',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'MOBILE APP DEVELOPER',
                      style: TextStyle(
                        fontSize: 12,

                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.29,
            right: 20,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color:
                    theme.colorScheme.brightness == Brightness.dark
                        ? AppColors.whiteColor
                        : AppColors.background,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.download,
                  color:
                      theme.colorScheme.brightness == Brightness.dark
                          ? AppColors.background
                          : AppColors.whiteColor,
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
          Positioned(
            top: 10,
            right: 0,
            child: SafeArea(
              child: IconButton(
                onPressed: onToggleTheme,
                icon: Icon(
                  color: AppColors.background,
                  isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
