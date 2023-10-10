import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_route/models/todo_dm.dart';

class ListProvider extends ChangeNotifier {

  List<TodoDM> todos = [] ;
  DateTime selectedDate = DateTime.now();

  void refreshTodoList() async{
    todos.clear();
    CollectionReference<TodoDM> todosCollection =  FirebaseFirestore.instance.collection(TodoDM.collectionName).
    withConverter<TodoDM>(
      fromFirestore: (snapshot, options) {
        Map json = snapshot.data() as Map ;
        TodoDM todo = TodoDM.fromJson(json);
        return todo;
      } ,
      toFirestore: (value, options) {
        return value.toJson();
      },
    );
    QuerySnapshot<TodoDM> todosSnapShot = await todosCollection.
    orderBy("date").get();

    List<QueryDocumentSnapshot<TodoDM>> docs = todosSnapShot.docs ;

    todos = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    todos =todos.where((todo) {
      if(todo.date.day != selectedDate.day ||todo.date.month != selectedDate.month ||
          todo.date.year != selectedDate.year){
        return false;
      }
      else {
          return true ;
      }
    }).toList();
    notifyListeners();
  }
}