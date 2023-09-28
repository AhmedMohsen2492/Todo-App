import 'package:flutter/material.dart';
import '../../common/my_text_form_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 10),
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Add new Task",
            textAlign: TextAlign.center,
            style: AppTheme.bottomSheetTitleTextStyle,
          ),
          MyTextFormField(
            hintText: "Enter task title",
          ),
          MyTextFormField(
            hintText: "Enter task description",
          ),
          Text(
            "Select Date",
            style: AppTheme.bottomSheetDateTitleTextStyle,
          ),
          Text(
            "24/9/2023",
            textAlign: TextAlign.center,
            style: AppTheme.bottomSheetDateTitleTextStyle.copyWith(
              fontSize: 18
            ),
          ),
          ElevatedButton(
              onPressed: (){},
              child: Text(
                "Add",
              )
          ),
        ],
      ),
    );
  }
}
