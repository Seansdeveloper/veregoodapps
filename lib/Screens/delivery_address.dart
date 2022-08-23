import 'dart:async';

import 'package:flutter/material.dart';

import '../constant/color.dart';

class AddAddress extends StatefulWidget {
  static const routeName = '/add-address';

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  double _selectedLatitude = 0;
  double _selectedLongitude = 0;

  int _selectedIndex= 0;
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 40,right: 10),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)
        ),
      
        child: Text("Proceed to Buy",style: TextStyle(fontSize: 22),),
      ),
      body: SafeArea(
          child: Column(
        children: [
          _upperHeader(),
          _addressData(context),
          SizedBox(height: 60,)



        ],
      )),
    );
  }


  _upperHeader(){
    return Container(
      height: 140,
      child: Stack(
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: appbar,
            ),
            child: Center(
                child: Text(
                  "Address",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 50,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red),
                    child: Text(
                      "Add New Address",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white,  fontSize: 22),
                    ))),
          ),
        ],
      ),
    );
  }

  _addressData(BuildContext context){
    return  Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return InkWell(
              onTap: ()=>setState(() {
                _selectedIndex =index;
              }),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color:_selectedIndex==index?appbar: Colors.grey,
                  borderRadius: BorderRadius.circular(20)
                ),
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   _selectedIndex==index  ? Icon(Icons.check_circle,color: Colors.green,size: 35,):SizedBox(),
                   Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Saurav singh",style: TextStyle(fontSize: 24),),
                         Text("612/3 air force ",style: TextStyle(fontSize: 16),),
                         Text("Gwalior",style: TextStyle(fontSize: 16),),
                         Text("Madhya Pradesh 474020 ",style: TextStyle(fontSize: 16),)

                       ],
                     ),
                   ),
                 ],
               ),
              ),
            );
          }

      ),
    );
  }




}
