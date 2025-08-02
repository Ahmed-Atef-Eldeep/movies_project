import 'package:flutter/material.dart';
import 'package:movies_project/APIs/api_manager.dart';
import 'package:movies_project/Providers/language_provider.dart';
import 'package:movies_project/Ui/home/HomeScreen.dart';
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
  TextEditingController confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
 
  bool isPasswordHidden = true;
  int? selectedAvatarId;
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
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedAvatarId = 1;
                      });
                    },
                    child: Image.asset(
                      AppAssets.Vector1,
                      width: width * 0.2,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedAvatarId = 2;
                      });
                    },
                    child: Image.asset(
                      AppAssets.Vector2,
                      width: width * 0.5,
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  InkWell(
                    onTap: (){
                      setState(() {
                        selectedAvatarId = 3;
                      });
                    },
                    child: Image.asset(
                      AppAssets.Vector3,
                      width: width * 0.2,
                    ),
                  ),
                ],
              ),
            ),

            Text('Avatar', style: AppStyles.semi16White),
            SizedBox(height: height * 0.015),
            
            Form(
              key: formkey,
              child: Column(
                children: [
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
              validator: (text) {
                if (text == null || text.trim().isEmpty) {
                  return 'please enter your name';
                }
                if (text.length < 2) {
                  return 'name must be at least 2 characters';
                }
                return null;
              },
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
                    validator: (text) {
                       if (text == null || text.trim().isEmpty) {
                          return 'please enter your email';
                        } final bool emailValid = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'please enter a valid email';
                        }
                        return null;
                    },
                  ),
                   SizedBox(height: height * 0.015),
            TextFormField(
              
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              controller: passwordController,
               obscureText: isPasswordHidden,
              obscuringCharacter: '*',
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
              validator: (text) {
                 if (text == null || text.trim().isEmpty) {
                    return 'please enter your password';
                  }
                  if (text.length < 8) {
                    return 'password must be at least 8 characters';
                  }
                  return null;
              },
            ),
            SizedBox(height: height * 0.015),
            TextFormField(
              
              cursorColor: AppColors.primaryColor,
              cursorErrorColor: AppColors.RedColor,
              obscureText: isPasswordHidden,
                obscuringCharacter: '*',
              controller: confirmPasswordController,
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
              validator: (text) {
                 if (text == null || text.trim().isEmpty) {
                    return 'please enter your password';
                  }
                  if (text.length < 8) {
                    return 'password must be at least 8 characters';
                  }
                  return null;
              },
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
              validator: (text) {
                
              if (text == null || text.trim().isEmpty) {
                return 'please enter your phone number';
              }
            
              final phoneRegExp = RegExp(
                r'^\+?[0-9]{10,15}$',
              );
              if (!phoneRegExp.hasMatch(text)) {
                return 'please enter a valid phone number';
              }
              return null;
              },
            ),
                ],
              ),
            ),
           
            SizedBox(height: height * 0.01),
            ElevatedButton(
              onPressed: () async {
                if (!formkey.currentState!.validate()) {
                  return;
                }
  String email = emailController.text;
  String password = passwordController.text;
  String confirmPassword = confirmPasswordController.text;
  String name = nameController.text;
  String phone = phoneController.text;

  if (password != confirmPassword) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Passwords do not match")),
    );
    return;
  }

  if (selectedAvatarId == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please select an avatar")),
    );
    return;
  }

  print("Email: $email");
  print("Password: $password");
  print("Name: $name");
  print("Phone: $phone");
  print("Selected Avatar ID: $selectedAvatarId");

  final registerResponse = await ApiManager.register(
    email: email,
    password: password,
    confirmPassword: confirmPassword,
    name: name,
    phone: phone,
    avatarId: selectedAvatarId,
  );

  if (registerResponse != null) {
    print("Register successful!");
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  } else {
    print("Register failed!");
  }

  setState(() {});
},
//                onPressed: () async {
//   String email = emailController.text;
//   String password = passwordController.text;
//   String confirmPassword = confirmPasswordController.text;
//   String name = nameController.text;
//   String phone = phoneController.text;

//   // تأكد من تطابق الباسورد
//   if (password != confirmPassword) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Passwords do not match")),
//     );
//     return;
//   }

//   print("Email: $email");
//   print("Password: $password");
//   print("Name: $name");
//   print("Phone: $phone");

//   final registerResponse = await ApiManager.register(
//     email: email,
//     password: password,
//     confirmPassword: confirmPassword,
//     name: name,
//     phone: phone,
//     avatarId: selectedAvatarId.toString(),
//   );

//   if (registerResponse != null) {
//     print("Register successful!");

//     // روح للشاشة الرئيسية أو login بعد النجاح
//     Navigator.of(context).pushNamed(HomeScreen.routeName);
//   } else {
//     print("Register failed!");
//     // ممكن تعرض رسالة خطأ للمستخدم هنا كمان
//   }

//   setState(() {});
// },
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
