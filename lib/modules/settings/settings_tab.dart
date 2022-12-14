import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/modules/settings/language_bottom_sheet.dart';
import 'package:todo_app/modules/settings/mode_bottom_sheet.dart';
import 'package:todo_app/shared/provider/language_provider.dart';
import 'package:todo_app/shared/provider/theme_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var providerLanguage = Provider.of<LanguageProvider>(context);
    return Container(
      margin: const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            margin: const EdgeInsetsDirectional.all(10),
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(10)),
              color: whiteColor,
            ),
            child: InkWell(
              onTap: () {
                showLanguageBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (providerLanguage.language == 'Arabic' ||
                            providerLanguage.language == 'العربية')
                        ? AppLocalizations.of(context)!.arabic
                        : AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: blueColor,
                  ),
                ],
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            margin: const EdgeInsetsDirectional.all(10),
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadiusDirectional.all(Radius.circular(10)),
              color: whiteColor,
            ),
            child: InkWell(
              onTap: () {
                showModeBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDark()
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                    color: blueColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            Container(color: darkColor, child: const ModeBottomSheet()));
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) =>
            Container(color: darkColor, child: LanguageBottomSheet()));
  }
}
