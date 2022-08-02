







import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../generated/assets.dart';



class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: RiveAnimation.asset(Assets.assetsErrorScreen,),
          ),
          Text("NO DATA FOUND",style: TextStyle(fontSize: 22),)
        ],
      ),
    );
  }
}
