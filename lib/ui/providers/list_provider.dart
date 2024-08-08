import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_route/models/todo_dm.dart';
import 'package:todo_route/ui/screens/home/home_screen.dart';

class ListProvider extends ChangeNotifier {
  List<TodoDM> todos = [];

  DateTime selectedDate = DateTime.now();

  void deleteTodo(String id) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);

    collectionReference
        .doc(id)
        .delete()
        .then((value) => print("todo deleted"))
        .catchError((e) => print("error"));

    todos.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateTodo(BuildContext context, String id, String title, String des,
      Timestamp timestamp) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDM.collectionName);
    collectionReference
        .doc(id)
        .update({
          "title": title,
          "description": des,
          "date": timestamp,
        })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"))
        .timeout(
          const Duration(milliseconds: 300),
          onTimeout: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
        );

    todos.map((e) {
      if (e.id == id) {
        e.title = title;
        e.description = des;
        e.date = timestamp.toDate();
      }
    });

    notifyListeners();
  }

  void refreshTodoList() async {
    todos.clear();
    CollectionReference<TodoDM> todosCollection = FirebaseFirestore.instance
        .collection(TodoDM.collectionName)
        .withConverter<TodoDM>(
          fromFirestore: (snapshot, _) {
            Map json = snapshot.data() as Map;
            TodoDM todo = TodoDM.fromJson(json);
            return todo;
          },
          toFirestore: (value, _) => value.toJson(),
        );

    QuerySnapshot<TodoDM> todosSnapShot =
        await todosCollection.orderBy("date").get();

    List<QueryDocumentSnapshot<TodoDM>> docs = todosSnapShot.docs;

    todos = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    todos = todos.where((todo) {
      if (todo.date.day != selectedDate.day ||
          todo.date.month != selectedDate.month ||
          todo.date.year != selectedDate.year) {
        return false;
      } else {
        return true;
      }
    }).toList();
    notifyListeners();
  }
}
