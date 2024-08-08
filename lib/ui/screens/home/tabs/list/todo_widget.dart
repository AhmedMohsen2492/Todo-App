import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/models/todo_dm.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import 'package:todo_route/ui/screens/edit/edit_screen.dart';
import 'package:todo_route/ui/utils/app_colors.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

class TodoWidget extends StatefulWidget {
  TodoDM model;

  TodoWidget({super.key, required this.model});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    ListProvider provider = Provider.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, EditScreen.routeName,
            arguments: TodoArgument(
              widget.model.id,
              widget.model.title,
              widget.model.description,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Slidable(
          closeOnScroll: true,
          startActionPane: ActionPane(
            extentRatio: .3,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (_) {
                  provider.deleteTodo(widget.model.id);
                },
                backgroundColor: const Color(0xFFEC4B4B),
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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            height: MediaQuery.of(context).size.height * 0.13,
            child: Row(
              children: [
                VerticalDivider(
                  color:
                      widget.model.isDone ? AppColors.green : AppColors.primary,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.model.title,
                        style: AppTheme.taskTitleTextStyle.copyWith(
                          color: widget.model.isDone
                              ? AppColors.green
                              : AppColors.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.model.description,
                        style: AppTheme.taskDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),
                widget.model.isDone
                    ? InkWell(
                        child: TextButton(
                            onPressed: () {
                              changeState();
                            },
                            child: const Text(
                              "Done!",
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            )),
                      )
                    : InkWell(
                        onTap: () {
                          changeState();
                        },
                        child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: AppColors.white,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  changeState() {
    widget.model.isDone = !widget.model.isDone;
    setState(() {});
  }
}
