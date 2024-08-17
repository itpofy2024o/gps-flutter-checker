import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMsg;
  const ErrorScreen({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    final String msg = errorMsg;
    return Center(child: Text(msg));
  }
}
