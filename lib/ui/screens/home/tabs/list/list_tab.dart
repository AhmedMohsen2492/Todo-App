import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_route/ui/providers/list_provider.dart';
import 'package:todo_route/ui/screens/home/tabs/list/todo_widget.dart';
import 'package:todo_route/ui/utils/app_colors.dart';

class ListTab extends StatefulWidget {

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider provider ;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshTodoList();
    });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.13,
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                        flex: 38,
                        child: Container(
                          color: AppColors.primary,
                        )),
                    Expanded(
                        flex: 62,
                        child: Container(
                          color: AppColors.accent,
                        )),
                  ],
                ),
                CalendarTimeline(
                  onDateSelected: (date){
                    provider.refreshTodoList();
                    provider.selectedDate = date ;
                  },
                  initialDate: provider.selectedDate,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                  leftMargin: 5,
                  monthColor: AppColors.black,
                  dayColor: AppColors.black,
                  activeDayColor: AppColors.primary,
                  activeBackgroundDayColor: Colors.white,
                  dotsColor: AppColors.transparent,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.64,
            child: ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: (context, index) => TodoWidget(model: provider.todos[index]),
            ),
          ),
        ],
      ),
    );
  }


}
