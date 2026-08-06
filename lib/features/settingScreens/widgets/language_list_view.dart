import 'package:doc_doc/core/cache/cache_helper.dart';
import 'package:doc_doc/core/di/server_locator.dart';
import 'package:doc_doc/core/theming/app_lang.dart';
import 'package:flutter/material.dart';

class LanguageListView extends StatefulWidget {
  final Function(Language)? onLanguageSelected;
  final String? inputLang;
   LanguageListView({
    super.key,
    this.onLanguageSelected,this.inputLang
  });

  @override
  State<LanguageListView> createState() => _LanguageListViewState();
}

class _LanguageListViewState extends State<LanguageListView> {
  // List of languages
  final List<Language> allLanguages = [
    Language(code: "en", name: "English"),
    Language(code: "ar", name: "Arabic"),
    Language(code: "fr", name: "French"),
  ];

  List<Language> filteredLanguages = [];
  late String selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    final savedCode  = getIt<CacheHelper>().getData(key: AppLang.lang);
    selectedLanguageCode = savedCode ?? "en";
    filteredLanguages = allLanguages;

if (widget.inputLang != null && widget.inputLang!.isNotEmpty) {
      filterLanguages(widget.inputLang!);
    }
  }

@override
  void didUpdateWidget(covariant LanguageListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.inputLang != widget.inputLang) {
      filterLanguages(widget.inputLang ?? '');
    }
  }


void filterLanguages(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLanguages = allLanguages;
      } else {
        filteredLanguages = allLanguages
            .where(
              (lang) => lang.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: filteredLanguages.isEmpty
          ? const Center(child: Text('No languages found'))
          : ListView.builder(
              itemCount: filteredLanguages.length,
              itemBuilder: (context, index) {
                final language = filteredLanguages[index];


                return RadioListTile<String>(
                  title: Text(language.name),
                  subtitle: Text(language.code),
                  value: language.code,
                  groupValue: selectedLanguageCode,
                  onChanged: (String? newCode) async {
                    if (newCode != null) {
                      // 3. تحديث الواجهة فوراً عند الضغط
                      setState(() {
                        selectedLanguageCode = newCode;
                      });

                      await getIt<CacheHelper>().setData(
                        key: AppLang.lang,
                        value: newCode,
                      );

                      if (widget.onLanguageSelected != null) {
                        widget.onLanguageSelected!(language);
                      }}
                  },
                );
              },
            ),
    );
  }
}