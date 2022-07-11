

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant/string.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: ListView.builder(

          itemCount: 4,
          itemBuilder: (context,i){
        return cardPage(Strings.ourservice[i],"Lorem Ipsum is simply dummy text of the printing.");

      }),
    );
  }




  Widget cardPage(String ServiceName,String SubService){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightBlue,
                radius: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(ServiceName,style: TextStyle(fontSize: 18),),
                      Text(SubService,style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
        Divider(
          thickness: 2.5,
        ),
      ],
    );

  }

}
