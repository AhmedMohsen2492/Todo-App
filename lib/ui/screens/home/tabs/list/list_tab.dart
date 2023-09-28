import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_route/ui/screens/home/tabs/list/todo_widget.dart';
import 'package:todo_route/ui/utils/app_colors.dart';

class ListTab extends StatefulWidget {
  const ListTab({Key? key}) : super(key: key);

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 18,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                      flex: 35,
                      child: Container(color: AppColors.primary,)
                  ),
                  Expanded(
                    flex: 65,
                      child: Container(color: AppColors.accent,)
                  ),
                ],
              ),
              CalendarTimeline(
                onDateSelected: (date) => print(date),
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                leftMargin: 20,
                monthColor: AppColors.black,
                dayColor: AppColors.black,
                activeDayColor: AppColors.primary,
                activeBackgroundDayColor: Colors.white,
                dotsColor: AppColors.transparent,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 82,
          child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) => TodoWidget(),
          ),
        ),
      ],
    );
  }
}
