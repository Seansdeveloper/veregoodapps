




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListField extends StatelessWidget {

  final String Name;



  ListField(this.Name);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.bookmarks),
                    SizedBox(width: 10,),
                    Text(Name)
                  ],
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        Divider(
          thickness: 2.5,
        ),
      ],
    );
  }
}

