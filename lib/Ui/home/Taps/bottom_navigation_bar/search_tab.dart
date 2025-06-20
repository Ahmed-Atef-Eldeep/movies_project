import 'package:flutter/material.dart';
import 'package:movies_project/Utils/App%20Assets.dart';
import 'package:movies_project/Utils/App%20Colors.dart';
import 'package:movies_project/Utils/App%20Styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTab extends StatelessWidget {
  static const String routeName = 'searchTab';
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.BlackColor,
      body: Padding(
        padding: EdgeInsets.only(
            top: height * 0.05, left: width * 0.02, right: width * 0.02),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              style: AppStyles.semi16White,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppAssets.searchtab),
                hintText: AppLocalizations.of(context)!.search,
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
              height: height * 0.3,
            ),
            Image.asset(AppAssets.imageempty)
          ],
        ),
      ),
    );
  }
}
