import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%205.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/login_Screen.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

class OnboardingScreen6 extends StatelessWidget {
  static const String routeName = 'OnboardingScreen6';
  const OnboardingScreen6({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage(
            AppAssets.onboardingScreen6,
          ),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
       Column(
          mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Container(
            width: width ,
            height: height * 0.23,
            decoration: BoxDecoration(
              color: AppColors.BlackColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Start Watching Now',
                  style: AppStyles.semi24White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.002,),
                Container(
                  width: width * 0.92,
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                       shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), 
                      )
                    ),
                    child: Text('Finish',
                  style: AppStyles.semi20Black,) , 
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  }, ),
                ),
                SizedBox(height: height * 0.001,),
                Container(
                  width: width * 0.92,
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.BlackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: AppColors.primaryColor)
                      )
                    ),
                    child: Text('Back',
                  style: AppStyles.semi20Primary,) , 
                  onPressed: () {
                     Navigator.of(context).pushNamed(OnboardingScreen5.routeName);
                  }, ),
                )
              ],
             ),
           ),
         ],
       )
        ],
      ),

    );
  }
}