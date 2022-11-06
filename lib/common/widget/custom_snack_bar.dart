import 'package:flutter/material.dart';

class CustomSnackBar {
  final BuildContext context;

  CustomSnackBar.of(this.context);

  Future<void> show(String message) async {
    try {
      await ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
                content: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.lightBlue),
          )
          .closed;
    } catch (e) {
      print('Error - showSnackBar: $e');
    }
  }
}
