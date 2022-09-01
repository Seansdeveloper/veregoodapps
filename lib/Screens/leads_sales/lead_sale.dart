
import 'package:flutter/material.dart';

class Refer extends StatefulWidget {
  const Refer({Key? key}) : super(key: key);

  @override
  _ReferState createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Leads / Sales",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 16),),
        leading: IconButton(
          onPressed: (){
            setState(() {
              Navigator.pop(context);
            });
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        // actions: [
        //   IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.black,))
        // ],
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey[350],
              height: 1.0,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  Image.asset("assets/refer.jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("If you like what we do, please refer us to your friends, family and customers to help us.",style: TextStyle(color: Colors.grey),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Form(


                      child: TextFormField(
                        validator: (dynamic value){
                          if (value.isEmpty) {
                            return 'Customer Name';
                          }
                          else{
                            setState(() {

                            });

                          }
                        },
                        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.person,color: Colors.redAccent,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // suffixIcon: Icon(Icons.email),
                            hintText: "Enter Customer's Name",
                            labelText: "Customer Name",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7C7C7C),letterSpacing: 0.2)

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Form(


                      child: TextFormField(
                        validator: (dynamic value){
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          else{
                            setState(() {

                            });

                          }
                        },
                        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.email,color: Colors.redAccent,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // suffixIcon: Icon(Icons.email),
                            hintText: "Enter Customer's email",
                            labelText: "Customer Email ",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7C7C7C),letterSpacing: 0.2)

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Form(


                      child: TextFormField(
                        validator: (dynamic value){
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          else{
                            setState(() {

                            });

                          }
                        },
                        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.phone,color: Colors.redAccent,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // suffixIcon: Icon(Icons.email),
                            hintText: "Enter your Phone Number",
                            labelText: "Phone Number ",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7C7C7C),letterSpacing: 0.2)

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Form(


                      child: TextFormField(
                        validator: (dynamic value){
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          else{
                            setState(() {

                            });

                          }
                        },
                        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.note,color: Colors.redAccent,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // suffixIcon: Icon(Icons.email),
                            hintText: "Enter your  Name",
                            labelText: "Your Name ",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7C7C7C),letterSpacing: 0.2)

                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                    child: Form(


                      child: TextFormField(
                        validator: (dynamic value){
                          if (value.isEmpty) {
                            return 'This Field is required';
                          }
                          else{
                            setState(() {

                            });

                          }
                        },
                        style: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w600),
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.account_balance_sharp,color: Colors.redAccent,),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            // suffixIcon: Icon(Icons.email),
                            hintText: "Enter your Company",
                            labelText: "Your Company",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF7C7C7C),letterSpacing: 0.2)

                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                ],)
              ],
            ),
          ),
          Align(alignment: Alignment.bottomCenter,child: Container(padding: EdgeInsets.all(18),child:  CustomButton(),),)
        ],
      ),
    );
  }
  Widget CustomButton(){
    return InkWell(
      onTap: (){



      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xFFFED1A3C),
            borderRadius: BorderRadius.all(Radius.circular(15.0))
        ),
        height:60,

        width: MediaQuery.of(context).size.width,
        child: const Center(
          child: Text("Submit",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),),
        ),
      ),
    );
  }
}
