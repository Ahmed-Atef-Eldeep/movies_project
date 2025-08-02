import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Providers/language_provider.dart';
import '../../../../Utils/App Styles.dart';

class UpdateProfileTab extends StatefulWidget {
  static const String routeName = 'update profile';

  @override
  State<UpdateProfileTab> createState() => _UpdateProfileTabState();
}

class _UpdateProfileTabState extends State<UpdateProfileTab> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String profileImage = AppAssets.Vector1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.BlackColor,
      appBar: AppBar(
        backgroundColor: AppColors.BlackColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          InkWell(
                            child: Image.asset(profileImage,
                  width: width * 0.4, fit: BoxFit.contain),
                            onTap: () {
                              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  backgroundColor: AppColors.BlackBgColor,
                  builder: (context) {
                    List<String> avatarList = [
                      AppAssets.Vector1,
                      AppAssets.Vector2,
                      AppAssets.Vector3,
                      AppAssets.Vector4,
                      AppAssets.Vector5,
                      AppAssets.Vector6,
                      AppAssets.Vector7,
                      AppAssets.Vector8,
                  
                    ];
                  
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: height * 0.45,
                      child: Column(
                        children: [
                  
                          const SizedBox(height: 16),
                          GridView.builder(
                            itemCount: avatarList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    profileImage = avatarList[index];
                                  });
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color:  Color(0xFFF6BD00)
                                          ,
                                      width: 2,
                                    ),
                                    color: profileImage == avatarList[index]
                                        ?  Color(0x8EF6BD00)
                                        : Colors.transparent ,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(avatarList[index]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                              );
                            },
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          TextFormField(
                            controller: nameController,
                            style: AppStyles.semi16White,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                  Icons.person,
                  color: AppColors.WhiteColor,
                              ),
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
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextFormField(
                            controller: phoneController,
                            style: AppStyles.semi16White,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                  Icons.phone,
                  color: AppColors.WhiteColor,
                              ),
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
                          SizedBox(
                            height: height * 0.02,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                  "Reset Password",
                  style: AppStyles.semi20White,
                              )),
                          SizedBox(
                            height: height * 0.2,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                  AppLocalizations.of(context)!.delete_account,
                  style: AppStyles.semi20Black,
                              ),
                              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.RedColor,
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                              )),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: Text(
                  AppLocalizations.of(context)!.update_data,
                  style: AppStyles.semi20Black,
                              ),
                              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                              )),
                          SizedBox(
                            height: height * 0.02,
                          ),
                        ],
                  ),
                ),
        ),
      ),
    );
  }
}
