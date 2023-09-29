import 'package:flutter/material.dart';
import '../../common/my_text_form_field.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_theme.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  DateTime selectedDate = DateTime.now();

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
            controller: titleController,
          ),
          MyTextFormField(
            hintText: "Enter task description",
            controller: desController,
          ),
          Text(
            "Select Date",
            style: AppTheme.bottomSheetDateTitleTextStyle,
          ),
          InkWell(
            onTap: (){
              showMyDatePicker();
            },
            child: Text(
              "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
              textAlign: TextAlign.center,
              style: AppTheme.bottomSheetDateTitleTextStyle.copyWith(
                fontSize: 18
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (){
                addTodoFireStore();
              },
              child: Text(
                "Add",
              )
          ),
        ],
      ),
    );
  }

  void addTodoFireStore() {
    print(titleController);
    print(desController);
    print(selectedDate);
  }

  void showMyDatePicker() async{
    selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? selectedDate ;
    setState(() {});
  }

}
