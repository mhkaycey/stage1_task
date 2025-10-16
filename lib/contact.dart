import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stage1_task/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10).copyWith(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:
            theme.colorScheme.brightness == Brightness.dark
                ? AppColors.background
                : AppColors.whiteColor,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(Icons.contact_mail),
              Text(
                'Contact Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildContactItem(
                icon: FontAwesomeIcons.envelope,
                onTap: () => _sendEmail(context),
                label: 'Email',
              ),
              _buildContactItem(
                icon: FontAwesomeIcons.twitter,
                label: 'X',
                onTap: () => _launchUrl(uri: "https://x.com/mhkaycey"),
              ),
              _buildContactItem(
                icon: FontAwesomeIcons.github,
                label: "GitHub",
                onTap: () => _launchUrl(uri: "https://github.com/mhkaycey"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendEmail(BuildContext context) {
    try {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        enableDrag: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.25,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.all(16),
                child: ContactForm(scrollController: scrollController),
                // ContactForm(scrollController: scrollController),
              );
            },
          );
        },
      );
    } catch (e) {
      log('Error showing modal: $e');
      // Fallback to direct email launch
      _launchUrl(uri: "mailto:your-email@example.com", isEmail: true);
    }
  }

  Widget _buildContactItem({IconData? icon, String? label, Function()? onTap}) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label!),
    );
  }

  Future<void> _launchUrl({String? uri, bool isEmail = false}) async {
    log("Clicked on $uri $isEmail");

    try {
      String? encodeQueryParameters(Map<String, String> params) {
        return params.entries
            .map(
              (MapEntry<String, String> e) =>
                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
            )
            .join('&');
      }

      final Uri url =
          isEmail
              ? Uri(
                scheme: 'mailto',
                path: uri,
                query: encodeQueryParameters({
                  'subject': 'Welcome to Stage one Task',
                }),
              )
              : Uri.parse(uri!);

      if (!await launchUrl(url)) {
        log('Could not launch $url');
        // Show error message to user
        // if (uri != null) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('Could not launch $uri')),
        //   );
        // }
      }
    } catch (e) {
      log('Error launching URL: $e');
    }
  }
}

class ContactForm extends StatefulWidget {
  final ScrollController? scrollController;

  const ContactForm({super.key, this.scrollController});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle for draggable sheet
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text(
              'Contact Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            SizedBox(height: 15),

            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _sendEmail(context: context),
                    child: Text('Send Email'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _sendEmail({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String subject = _subjectController.text;
      final String message = _messageController.text;

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'your-email@example.com', // Replace with your email
        query: Uri.encodeQueryComponent(
          'subject=$subject&body=From: $email\n\n$message',
        ),
      );

      launchUrl(emailUri)
          .then((success) {
            if (success) {
              if (context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Email app opened successfully')),
                );
              }
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not open email app')),
                );
              }
            }
          })
          .catchError((error) {
            log('Error launching email: $error');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error opening email app')),
              );
            }
          });
    }
  }
}
