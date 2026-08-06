import 'package:doc_doc/core/helpers/extention.dart';
import 'package:doc_doc/core/widgets/app_appBar.dart';
import 'package:doc_doc/core/widgets/app_form_text_field.dart';
import 'package:doc_doc/features/settingScreens/widgets/language_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSetting extends StatefulWidget {
  const LanguageSetting({super.key});

  @override
  State<LanguageSetting> createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  bool radioval = true;

  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppbar(context, title: "Language"),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Expanded(
                  child: AppFormTextField(
                    myContrller: searchController,
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),

            LanguageListView(inputLang: searchController.text,),
          ],
        ),
      ),
    );
  }
}
