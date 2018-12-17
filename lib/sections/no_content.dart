import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  const NoContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
           Text('No Sections Available'),
        ],
      ),
    );
  }

}
