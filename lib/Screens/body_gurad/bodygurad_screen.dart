import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyGurad extends StatelessWidget {
  const BodyGurad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text("NO bodyguards available "),)),
    );
  }
}
