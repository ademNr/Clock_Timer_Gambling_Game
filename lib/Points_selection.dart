
import 'package:flutter/material.dart';
import 'package:gambling_game/clock_play.dart';
import 'package:gambling_game/timer_page.dart';
import 'package:get/get.dart';
class PointsSelection extends StatefulWidget {
  const PointsSelection({Key? key}) : super(key: key);

  @override
  State<PointsSelection> createState() => _PointsSelectionState();
}

class _PointsSelectionState extends State<PointsSelection> {

  double _currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: const Color(0xff15202B),
        body: SafeArea(
          child: Container(

            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),

                  Text(
                    " Beat the Timer !",
                    style: TextStyle(
                      color: Color(0xffFFF72C),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: "Inter",
                    ),
                  ),
                  SizedBox(height: 20,),


                  Text(
                    "${"And Maximize wins"}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 251),
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: "Inter",
                    ),),


                  SizedBox(height: 60,),
                  Text(
                    "Select your points ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 251),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Inter",
                    ),),
                  SizedBox(height: 10,),
                  Slider(
                    thumbColor: Color(0xffFFF72C),
                    inactiveColor: Color(0xff15202B),
                    activeColor: Color(0xffFFF72C),
                    value: _currentSliderValue,
                    max: 200,
                    divisions: 10,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },

                  ),
                  SizedBox(height: 20,),
                  Text(
                    "${_currentSliderValue} RC",
                    style: TextStyle(
                      color: Color(0xffFFF72C),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: "Inter",
                    ),
                  ),

                  SizedBox(height: 30,),

                  ClockView(),
                  SizedBox(height: 30,),
                  Container(
                    height: 70,
                    width: 300,
                    child: TextButton(
                      onPressed: (){
                        Get.to(()=>ClockPlay(), arguments: _currentSliderValue, transition: Transition.leftToRight);
                      },

                      child: Text(
                        'Roll',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: "Inter",
                          fontSize: 18,
                          color: Color(0xff15202B),
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xffFFF72C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ); 
  }
}
