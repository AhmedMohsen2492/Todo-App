import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/models/todo_dm.dart';
import 'package:todo_route/ui/common/my_text_form_field.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import 'package:todo_route/ui/utils/app_colors.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

class EditScreen extends StatefulWidget {
  static String routeName = "editScreen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late ListProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    TodoArgument argument = ModalRoute.of(context)?.settings.arguments as TodoArgument;

    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                      color: AppColors.primary,
                    )),
                Expanded(
                    flex: 94,
                    child: Container(
                      color: AppColors.accent,
                    )
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 20),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Edit Task",
                      style: AppTheme.settingsTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.titleController,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: provider.desController,
                    ),
                    SizedBox(height: 30,),
                    Text(
                      "Select Date",
                      style: AppTheme.bottomSheetDateTitleTextStyle,
                    ),
                    SizedBox(height: 30,),
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
                    SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: ()
                        {
                          provider.updateTodo(context,
                              argument.id,
                              provider.titleController.text,
                              provider.desController.text ,
                              Timestamp.fromDate(provider.selectedDate));
                        },
                        child: Text(
                            "Save Changes",
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ) ;
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

  PreferredSizeWidget buildAppBar() => AppBar(
    title: Text(
      "To Do List",
      style: AppTheme.appBarTextStyle,
    ),
  );
}
