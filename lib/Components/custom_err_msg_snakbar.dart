import 'package:flutter/material.dart';

class ShowSnackbar extends StatelessWidget {
  const ShowSnackbar({super.key, required this.errMsg});
  final String errMsg ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMsg,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
