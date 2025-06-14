import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%203.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

class OnboardingScreen2 extends StatelessWidget {
  static const String routeName = 'OnboardingScreen2';
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage(
            AppAssets.onboardingScreen2,
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
            height: height * 0.3,
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
                Text('Discover Movies',
                  style: AppStyles.semi24White,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height * 0.01,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Text('Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.',
                  style: AppStyles.semi20White,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: height * 0.02,),
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
                     Navigator.of(context).pushNamed(OnboardingScreen3.routeName);
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