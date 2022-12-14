import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/shared/components/my_spacer.dart';
import 'package:todo_app/shared/provider/language_provider.dart';
import 'package:todo_app/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (provider.language == 'Arabic' || provider.language == 'العربية')
              ? selectedWidget(AppLocalizations.of(context)!.arabic, context)
              : selectedWidget(AppLocalizations.of(context)!.english, context),
          const MySpacer(
            height: 20,
          ),
          (provider.language == 'Arabic' || provider.language == 'العربية')
              ? unSelectedWidget(AppLocalizations.of(context)!.english, context)
              : unSelectedWidget(AppLocalizations.of(context)!.arabic, context),
        ],
      ),
    );
  }
}

Widget selectedWidget(String lang, context) {
  var provider = Provider.of<LanguageProvider>(context);
  return InkWell(
    onTap: () {
      provider.toggleLanguage((lang == 'Arabic' || lang == 'العربية')
          ? lang = 'Arabic'
          : lang = 'English');
    },
    child: Container(
      padding: const EdgeInsetsDirectional.all(
        8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(
          2,
        ),
        color: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lang,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 18,
                ),
          ),
          Icon(
            Icons.check,
            color: blueColor,
          ),
        ],
      ),
    ),
  );
}

Widget unSelectedWidget(String lang, context) {
  var provider = Provider.of<LanguageProvider>(context);

  return InkWell(
    onTap: () {
      provider.toggleLanguage((lang == 'Arabic' || lang == 'العربية')
          ? lang = 'Arabic'
          : lang = 'English');
    },
    child: Container(
      padding: const EdgeInsetsDirectional.all(
        8,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(
          2,
        ),
        color: Colors.grey.shade600,
      ),
      width: double.infinity,
      child: Text(
        lang,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontSize: 18, color: darkColor),
      ),
    ),
  );
}
