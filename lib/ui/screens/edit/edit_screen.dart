import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/models/todo_dm.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import 'package:todo_route/ui/utils/app_colors.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

class EditScreen extends StatefulWidget {
  static String routeName = "editScreen";

  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late ListProvider provider;

  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    TodoArgument argument =
        ModalRoute.of(context)?.settings.arguments as TodoArgument;

    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Edit Task",
                  style: AppTheme.settingsTextStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: argument.title),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: desController,
                  decoration: InputDecoration(hintText: argument.description),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Select Date",
                  style: AppTheme.bottomSheetDateTitleTextStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    showMyDatePicker();
                  },
                  child: Text(
                    "${provider.selectedDate.day}/${provider.selectedDate.month}/${provider.selectedDate.year}",
                    textAlign: TextAlign.center,
                    style: AppTheme.bottomSheetDateTitleTextStyle
                        .copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        desController.text.isEmpty) return;
                    save(argument);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: const Text(
                    "Save Changes",
                    style: TextStyle(fontSize: 18, color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void save(TodoArgument argument) {
    provider.updateTodo(context, argument.id, titleController.text,
        desController.text, Timestamp.fromDate(provider.selectedDate));
  }

  void showMyDatePicker() async {
    provider.selectedDate = await showDatePicker(
          context: context,
          initialDate: provider.selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 365)),
        ) ??
        provider.selectedDate;
    setState(() {});
  }

  PreferredSizeWidget buildAppBar() => AppBar(
        title: const Text(
          "To Do List",
          style: AppTheme.appBarTextStyle,
        ),
      );
}
