import 'package:flutter/material.dart';

void showMyNotification({
  error = 'Notification!',
  text = 'No notification!',
  required context,
}) {
  final snackBar = SnackBar(
    backgroundColor: const Color.fromARGB(255, 164, 191, 231),
    elevation: 3,
    content: RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: error + "\n",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: text,
              style: const TextStyle(
                fontSize: 18,
              ))
        ],
      ),
    ),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {},
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
