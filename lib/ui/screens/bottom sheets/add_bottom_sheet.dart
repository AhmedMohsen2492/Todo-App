import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/models/todo_dm.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import '../../common/my_text_form_field.dart';
import '../../utils/app_theme.dart';

class AddBottomSheet extends StatefulWidget {

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  late ListProvider provider ;
  late TextEditingController titleController;
  late TextEditingController desController ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    titleController = TextEditingController();
    desController = TextEditingController();

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
              "${provider.selectedDate.day}/${provider.selectedDate.month}/${provider.selectedDate.year}",
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
    CollectionReference todoCollectionReference =
    FirebaseFirestore.instance.collection(TodoDM.collectionName);

    DocumentReference newEmptyDoc = todoCollectionReference.doc();
    newEmptyDoc.set({
      "id" : newEmptyDoc.id,
      "title" : titleController.text,
      "description" : desController.text,
      "date" : provider.selectedDate,
      "isDone" : false,
    }).timeout(Duration(milliseconds: 300),
      onTimeout: () {
        Navigator.pop(context);
        provider.refreshTodoList();
      });
  }

  void showMyDatePicker() async{
    provider.selectedDate = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ) ?? provider.selectedDate ;
    setState(() {});
  }
}
