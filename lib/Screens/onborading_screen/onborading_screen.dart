import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:veregoodapps/homeScreen.dart';

import '../../controler/text_controller.dart';
import '../../helpers/shared_preferences_helper.dart';

import '../../networking/service/fetch.dart' as http;
import '../../networking/service/urls.dart' as urls;
import '../../constant/color.dart';
import '../../constant/string.dart';
import '../../model/slider.dart';
import '../../widget/slide_dot.dart';
import '../../widget/slide_items/slide_items.dart';


class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });

  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
       _currentPage=index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(body:  Container(
    child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView.builder(

                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: sliderArrayList.length,
                itemBuilder: (ctx, i){

                  return SlideItem(i);

                }
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Get.offAll(()=>HomeScreen(0));

                  },
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.0, bottom: 15.0,top: 80,),
                      child: Text(
                        Strings.SKIP,

                        style: TextStyle(
                          fontFamily: Strings.OPEN_SANS,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20.0,left: 15),
                    child: Row(
                      children: <Widget>[
                        for (int i = 0; i < sliderArrayList.length; i++)
                          if (i == _currentPage)
                            SlideDots(true)
                          else
                            SlideDots(false)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    if(_currentPage==0||_currentPage==1){
                      setState(() {
                        _currentPage++;
                      });
                      _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 500), curve: Curves.ease);
                    }
                    else
                      {
                        Get.offAll(()=>HomeScreen(0));
                      }
                    },

                  child:    Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.0, bottom: 15.0,right: 15.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: appbar,
                        child: Text(
                          _currentPage==2? "Start":Strings.NEXT,
                          style: TextStyle(
                            fontFamily: Strings.OPEN_SANS,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        )),
  ));


}

