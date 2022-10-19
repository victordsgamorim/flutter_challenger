import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Icon(
          Icons.crisis_alert_outlined,
          size: 40,
        ),
        Text("Connection Error!")
      ],
    );
  }
}
