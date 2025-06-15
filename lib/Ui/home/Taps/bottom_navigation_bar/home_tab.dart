import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
class HomeTab extends StatelessWidget {
  static const String routeName = 'homeTab';
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
    backgroundColor: AppColors.BlackColor,
      body:
       SingleChildScrollView(
        scrollDirection: Axis.vertical,
         child: Column(
           children: [
             Stack(
              children: [
                Image.asset(AppAssets.BackHome, fit: BoxFit.cover,),
                Image.asset(AppAssets.BackBgHome, fit: BoxFit.cover,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.02),
                    Image.asset(AppAssets.AvailableNow, fit: BoxFit.cover, width: width * 0.62,),
                    
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        SizedBox(width: width * 0.02),
                        Image.asset(AppAssets.imagefilme1, fit: BoxFit.cover, height: height * 0.27,),
                        SizedBox(width: width * 0.05),
                        Image.asset(AppAssets.imagefilme2, fit: BoxFit.cover, height: height * 0.37,),
                        SizedBox(width: width * 0.05),
                        Image.asset(AppAssets.imagefilme3, fit: BoxFit.cover, height: height * 0.27,),
                      ],),
                    ),
                    Image.asset(AppAssets.WatchNow, fit: BoxFit.cover, width: width * 0.82,),
                  ],
                )
              ],
                   ),
                   
                   Padding(
                     padding:  EdgeInsets.only(left: width * 0.02, right: width * 0.01),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalizations.of(context)!.action,
                        style: AppStyles.semi20White,),
                        TextButton(
                          onPressed: (){}, 
                          child: Row(
                            
                            children: [
                              Text(AppLocalizations.of(context)!.seemore, style: AppStyles.semi16Primary,),
                              Icon(Icons.arrow_forward_outlined, color: AppColors.primaryColor, size: 16,),
                            ],
                          ))
                      ],
                     ),
                   ),
                    SizedBox(height: height * 0.01),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.03),
                          Image.asset(AppAssets.imageaction1),
                          SizedBox(width: width * 0.03),
                          Image.asset(AppAssets.imageaction2),
                          SizedBox(width: width * 0.03),
                          Image.asset(AppAssets.imageaction3),
                        ],),
                    )
           ],
         ),
       ),
     

    );
  }
}
