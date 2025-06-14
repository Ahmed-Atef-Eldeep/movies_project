import 'package:flutter/material.dart';
import 'package:movies_project/Providers/language_provider.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/Register.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/forgot_password.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreen';
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
   
   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
     var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: 
      Padding(
        padding:  EdgeInsets.only(top:height*0.1,left:width*0.04,right: width*0.04),
        child: Column(
          children: [
            Image.asset(AppAssets.LoginScreen),
            SizedBox(height: height * 0.05),
            TextFormField(
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
            SizedBox(height: height * 0.03),
            TextFormField(
              controller: passwordController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.Passwordicon),
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text){},
            )
            ,Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
                }, 
                child:Text(AppLocalizations.of(context)!.forgot_password,
                style: AppStyles.semi15Primary,
                ) ),
              ],
            ),
            SizedBox(height: height * 0.03),
            ElevatedButton(
              onPressed: () {},
              child: Text(AppLocalizations.of(context)!.login ,
              style: AppStyles.semi20Black,),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(width, height * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              )

            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.dont_have_account,
                style: AppStyles.semi16White,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RegisterScreen.routeName);
                  },
                  child: Text(AppLocalizations.of(context)!.create_account,
                     style: AppStyles.semi16Primary,
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 1,
                    endIndent: width * 0.05,
                    indent: width * 0.05,
                  ),
                ),
                Text(AppLocalizations.of(context)!.or,
                  style: AppStyles.semi16White,),
                Expanded(
                  child: Divider(
                    color: AppColors.primaryColor,
                    thickness: 1,
                    indent: width * 0.05,
                     endIndent: width * 0.05,
                  ),
                ),

            ],),
            SizedBox(height: height * 0.04),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.Icongoogle),
                  SizedBox(width: width * 0.02),
                  Text(AppLocalizations.of(context)!.login_with_google ,
                  style: AppStyles.semi16Black,),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                minimumSize: Size(width, height * 0.07),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            ),
            SizedBox(height: height * 0.03),
            Container(
              height: height*0.07,
              width: width*0.333,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      languageProvider.changeLanguage('ar');

                    }, 
                    icon: Image.asset(AppAssets.EGlanguage,width: 40,),
                  color: AppColors.primaryColor,),
                  IconButton(
                    onPressed: (){
                      languageProvider.changeLanguage('en');
                    }, 
                  icon: Image.asset(AppAssets.LRlanguage,width: 40,),
                  color: AppColors.primaryColor,),


                ],
              ),
            )

          ],
        ),
      )
      ,
    );
  }
}


// AppLocalizations.of(context)!.