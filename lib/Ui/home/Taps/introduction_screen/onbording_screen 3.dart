import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%202.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%204.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const String routeName = 'OnboardingScreen3';
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage(
             AppAssets.onboardingScreen3,
          ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
       Column(
          mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Container(
            width: width * 1,
            height: height * 0.35,
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
                Text('Explore All Genres',
                  style: AppStyles.semi24White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.001,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Text('Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                  style: AppStyles.semi20White,
                    textAlign: TextAlign.center,
                  ),
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
                    child: Text('Next',
                  style: AppStyles.semi20Black,) , 
                  onPressed: () {
                     Navigator.of(context).pushNamed(OnboardingScreen4.routeName);
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
                     Navigator.of(context).pushNamed(OnboardingScreen2.routeName);
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