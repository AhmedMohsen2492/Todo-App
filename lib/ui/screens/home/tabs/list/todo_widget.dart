import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_route/ui/utils/app_colors.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({Key? key}) : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(15)
      ),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 25,),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .3,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: Color(0xFFEC4B4B),
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: 'delete',
              borderRadius: BorderRadius.circular(15),
              autoClose: true,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16,),
          height: MediaQuery.of(context).size.height * 0.13,
          child: Row(
            children: [
              VerticalDivider(),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Play basket ball",
                      style: AppTheme.taskTitleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "description",
                      style: AppTheme.taskDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
