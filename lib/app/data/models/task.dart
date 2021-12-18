import 'package:equatable/equatable.dart';

class Task extends Equatable{
  
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;

  const Task(
      {required this.title,
      required this.icon,
      required this.color,
      this.todos});




//this method to return instance from task because constructor is const
  Task copyWith({
    String? title,
    int? icon,
    String? color,
    List<dynamic>? todos,
  }) =>
      Task(
          title: title ?? this.title,
          icon: icon ?? this.icon,
          color: color ?? this.color,
          todos: todos ?? this.todos);

  factory Task.fromJson(Map<String, dynamic> map) => Task(
      title: map["title"],
      icon: map["icon"],
      color: map["color"],
      todos: map["todos"]);

  Map<String, dynamic> toJson() =>
      {"title": title, "icon": icon, "color": color, "todos": todos};

  @override
  //compare tasks 
  List<Object?> get props => [title,icon,color];



}
