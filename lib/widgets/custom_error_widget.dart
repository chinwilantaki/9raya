import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorWidget({Key? key, required this.errorDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      color: const Color(0xFF424242),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Something went wrong!\n${errorDetails.exceptionAsString()}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
