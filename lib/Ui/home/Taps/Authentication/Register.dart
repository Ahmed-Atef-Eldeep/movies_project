import 'package:flutter/material.dart';
import 'package:movies_project/Providers/language_provider.dart';
import 'package:movies_project/Ui/home/Taps/Authentication/login_Screen.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      appBar: AppBar(
        title: Text('Register',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: AppColors.BlackColor,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: SingleChildScrollView(
          child: Column(children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    AppAssets.Vector1,
                    width: width * 0.2,
                  ),
                  SizedBox(width: width * 0.02),
                  Image.asset(
                    AppAssets.Vector2,
                    width: width * 0.5,
                  ),
                  SizedBox(width: width * 0.02),
                  Image.asset(
                    AppAssets.Vector3,
                    width: width * 0.2,
                  ),
                ],
              ),
            ),

            Text('Avatar', style: AppStyles.semi16White),
            SizedBox(height: height * 0.015),
            TextFormField(
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              controller: nameController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.RedColor),
                ),
                prefixIcon: Image.asset(AppAssets.Nameicon),
                hintText: AppLocalizations.of(context)!.name,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(height: height * 0.015),
            TextFormField(
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              controller: emailController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.RedColor),
                ),
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
              validator: (text) {},
            ),
            SizedBox(height: height * 0.015),
            TextFormField(
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              controller: passwordController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.RedColor),
                ),
                prefixIcon: Image.asset(AppAssets.Passwordicon),
                suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppColors.WhiteColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    }),
                hintText: AppLocalizations.of(context)!.password,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(height: height * 0.015),
            TextFormField(
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              obscureText: isPasswordHidden,
              controller: passwordController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.RedColor),
                ),
                prefixIcon: Image.asset(AppAssets.Passwordicon),
                suffixIcon: IconButton(
                    icon: Icon(
                        isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.WhiteColor),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    }),
                hintText: AppLocalizations.of(context)!.confirm_password,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(height: height * 0.015),
            TextFormField(
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              controller: phoneController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.RedColor),
                ),
                prefixIcon: Image.asset(AppAssets.phoneicon),
                hintText: AppLocalizations.of(context)!.phone_number,
                hintStyle: AppStyles.semi16White,
                filled: true,
                fillColor: AppColors.BlackBgColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (text) {},
            ),
            SizedBox(height: height * 0.01),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.create_account,
                  style: AppStyles.semi20Black,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.already_have_account,
                  style: AppStyles.semi16White,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: AppStyles.semi16Primary,
                  ),
                )
              ],
            ),
            // SizedBox(height: height * 0.01),
            Container(
              height: height * 0.07,
              width: width * 0.333,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      languageProvider.changeLanguage('ar');
                    },
                    icon: Image.asset(
                      AppAssets.EGlanguage,
                      width: 40,
                    ),
                    color: AppColors.primaryColor,
                  ),
                  IconButton(
                    onPressed: () {
                      languageProvider.changeLanguage('en');
                    },
                    icon: Image.asset(
                      AppAssets.LRlanguage,
                      width: 40,
                    ),
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
