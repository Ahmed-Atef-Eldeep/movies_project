import 'package:flutter/material.dart';
import 'package:movies_project/Ui/home/Taps/introduction_screen/onbording_screen%202.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';

class OnboardingScreen1 extends StatelessWidget {
  static const String routeName = 'OnboardingScreen1';
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(image: AssetImage(
             AppAssets.onboardingScreen1,
          ),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
       Padding(
         padding: const EdgeInsets.only(bottom: 35.0,left: 15.0,right: 15.0),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Find Your Next Favorite Movie Here',
              style: AppStyles.semi30White,
              textAlign: TextAlign.center,
            ),
            
            Text('Get access to a huge library of movies to suit all tastes. You will surely like it.',
            style: AppStyles.semi20White,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: height * 0.02,),
            Container(
              width: width * 0.92,
              height: height * 0.06,
              child: 
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), 
                      )
                ),

                child: Text('Explore Now',
              style: AppStyles.semi20Black,) , 
              onPressed: () {
                Navigator.of(context).pushNamed(OnboardingScreen2.routeName);
              }, ),
            )
          ],
         ),
       )
        ],
      ),

    );
  }
}