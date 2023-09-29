import 'package:flutter/material.dart';
import 'package:todo_route/ui/utils/app_theme.dart';
import '../../../../utils/app_colors.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<String> LanguagesList = ["English", "اللغة العربية"];
  String language = 'English';
  String mode = 'light';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          color: AppColors.primary,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Language",
                style: AppTheme.settingsTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                items: <String>["English", "اللغة العربية"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  language = newValue!;
                  setState(() {});
                },
                value: language,
                hint: Text("select app language"),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  fillColor: AppColors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Mode",
                style: AppTheme.settingsTextStyle,
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                items: <String>["dark", "light"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  mode = newValue!;
                  setState(() {});
                },
                value: mode,
                hint: Text("select app language"),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  fillColor: AppColors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
