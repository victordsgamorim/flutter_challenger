import 'package:flutter/material.dart';

snackBar(BuildContext context, String message) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  });
}
