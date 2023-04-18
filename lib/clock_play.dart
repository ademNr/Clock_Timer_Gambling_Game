import 'dart:async';
import 'dart:math';
import 'package:gambling_game/Points_selection.dart';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:gambling_game/timer_page.dart';
import 'package:get/get.dart';

class ClockPlay extends StatefulWidget {
  const ClockPlay({Key? key}) : super(key: key);

  @override
  State<ClockPlay> createState() => _ClockPlayState();
}

class _ClockPlayState extends State<ClockPlay> {

  AudioPlayer player = AudioPlayer();
  int _secondsRemaining = 30;
  late Timer _timer;
  var random = Random();

  var data = Get.arguments ;
   double  _points = 0.0 ;
  double counter = 1 ;


  void startTimer(int randomNb) {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        player.setAsset("lib/assets/30_Second_Ticking_Countdown_Timer_With_Alarm.mp3");
        player.play();

        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {

            player.stop() ;
          _timer.cancel();
          // el fonction bch tna9ess points lel user
          //..// e5dem nayak

        }
      });
      if (_secondsRemaining == randomNb) {
        // El fonction eli bch tna9ass points lel user;
        // ... //

          player.stop() ;
        _timer.cancel();
        Get.snackbar("timeOver", "you Lost ${data} RC");
        Get.to(()=> PointsSelection(), duration: Duration(seconds: 3), transition: Transition.downToUp);
      }else{
        _points = (data.toDouble() + data.toDouble()  * (counter.toDouble()/500.0)).toDouble();
        counter++ ;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    
    int randomNumber = random.nextInt(29) + 1;
    print(randomNumber);
    startTimer(randomNumber);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15202B),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClockView(),
              SizedBox(height: 50,),

             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(" RC ",style: TextStyle(fontSize: 25, color: Color(0xffFFF72C), fontWeight: FontWeight.bold),),
                 SizedBox(width: 20,),
                 Text(
                   '$_points',
                   style: TextStyle(fontSize: 100, color: Colors.white),
                 ),
               ],
             ),
              SizedBox(height: 30,),
              Container(
                height: 70,
                width: 300,
                child: TextButton(
                  onPressed: (){
                    if(player.playing){
                      player.stop() ;
                    }
                    _timer.cancel();

                    if(_secondsRemaining != 30){
                      //func eli bch tzid lel user points
                      //..//
                      Get.snackbar("you won", "you won ${_points} RC");
                      Get.to(()=> PointsSelection(), duration: Duration(seconds: 3), transition: Transition.downToUp);
                    }
                  },

                  child: Text(
                    'Stop Timer  |  Win ${_points}',
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

            ],
          ),
        ),
      ),

    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
