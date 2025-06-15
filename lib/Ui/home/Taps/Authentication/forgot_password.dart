import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String routeName = 'ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      appBar: AppBar(
        title: Text('Forgot Password',
        style:AppStyles.semi16Primary
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: AppColors.primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.BlackColor,
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.forgotpassword),
            SizedBox(height: height * 0.04),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
              child: TextFormField(
                    controller: emailController,
                    style: AppStyles.semi16White,
                    decoration: InputDecoration(
                      prefixIcon: Image.asset(AppAssets.Emailicon),
                      hintText: AppLocalizations.of(context)!.email,
                      hintStyle: AppStyles.semi16White,
                      filled: true,
                      fillColor: AppColors.BlackBgColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (text){},
                  ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.verify_email ,
                  style: AppStyles.semi20Black,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(width, height * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  )
                ),
            ),
        
          ],
        ),
      ) ,
      );
  }
}