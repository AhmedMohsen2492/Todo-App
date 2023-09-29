import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:todo_route/ui/screens/bottom%20sheets/add_bottom_sheet.dart';
import 'package:todo_route/ui/screens/home/tabs/list/list_tab.dart';
import 'package:todo_route/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:todo_route/ui/utils/app_colors.dart';
import 'package:todo_route/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: currentIndex==0 ? ListTab() : SettingsTab(),
      bottomNavigationBar: buildBottomNavigation(),
      floatingActionButton: buildFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget buildAppBar() => AppBar(
    title: Text(
      "To Do List",
      style: AppTheme.appBarTextStyle,
    ),
  );

  Widget buildBottomNavigation() => BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 8,
    clipBehavior:Clip.hardEdge ,
    child: BottomNavigationBar(
      currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value ;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: "",
          ),
        ]
    ),
  );

  Widget buildFab() => FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: AddBottomSheet(),
          ),
      );
    },
    child: Icon(
      Icons.add,
    ),
  );

}
