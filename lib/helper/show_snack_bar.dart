import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,String message , {required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
          message,
        ),
      backgroundColor: color,
    ),
  );
}