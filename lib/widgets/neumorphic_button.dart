// import 'package:flutter/material.dart';

// class NeumorphicButton extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onPressed;

//   const NeumorphicButton({super.key, required this.child, this.onPressed});

//   @override
//   NeumorphicButtonState createState() => NeumorphicButtonState();
// }

// class NeumorphicButtonState extends State<NeumorphicButton> {
//   bool isPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) => setState(() => isPressed = true),
//       onTapUp: (_) {
//         setState(() => isPressed = false);
//         widget.onPressed?.call();
//       },
//       onTapCancel: () => setState(() => isPressed = false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 150),
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.grey[300],
//           borderRadius: BorderRadius.circular(12),
//           boxShadow:
//               isPressed
//                   ? [
//                     BoxShadow(
//                       color: Colors.blue[500]!,
//                       offset: Offset(2, 2),
//                       blurRadius: 4,
//                       //inset: true,
//                     ),
//                   ]
//                   : [
//                     BoxShadow(
//                       color: Colors.blue,
//                       offset: Offset(-2, -2),
//                       blurRadius: 4,
//                     ),
//                     BoxShadow(
//                       color: Colors.blue[400]!,
//                       offset: Offset(2, 2),
//                       blurRadius: 4,
//                     ),
//                   ],
//         ),
//         child: widget.child,
//       ),
//     );
//   }
// }
