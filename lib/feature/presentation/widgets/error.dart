import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notee/core/theme/theme.dart';

class ErrorStateWidget extends StatelessWidget {
  final String message;

  const ErrorStateWidget({Key? key,  required this.message }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildError(context, message);
  }

  Widget _buildError(BuildContext context, String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/error.json',
          width: 250, height: 200, fit: BoxFit.fill,
          repeat: false,
          reverse: false,
          animate: false,
        ),
        const SizedBox(height:8),
        Text(
          message, 
          style: primaryTextStyle,
        ),
      ],
    );
  }
}