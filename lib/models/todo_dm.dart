import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDM {
  static const String collectionName = "todos" ;

  late String id ;
  late String title ;
  late String description ;
  late bool isDone ;
  late DateTime date ;

  TodoDM(this.id, this.title, this.description, this.isDone, this.date);

  TodoDM.fromJson(Map json){
    id = json["id"];
    title = json["title"];
    description = json["description"];
    isDone = json["isDone"];
    Timestamp time  = json["date"] ;
    date = time.toDate();
  }

  Map<String,Object?> toJson(){
    return {
      "id" : id ,
      "title" : title ,
      "description" : description,
      "date" : date,
      "isDone" : isDone ,
    };
  }
}

class TodoArgument{
  String id ;
  String title ;
  String description ;

  TodoArgument(this.id, this.title, this.description );
}
