class TaskModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  bool isDone;
  String userId;
  bool isFavourite;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.userId,
    this.isDone = false,
    this.isFavourite = false,
  });

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] ?? "",
          title: json['title'] ?? "",
          description: json['description'] ?? "",
          category: json['category'] ?? "",
          date: json['date'] ?? 0,
          isDone: json['isDone'] ?? false,
          userId: json['userId'] ?? "",
          isFavourite: json['isFavourite'] ?? false,
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "category": category,
      "date": date,
      "userId": userId,
      "isDone": isDone,
      "isFavourite": isFavourite,
    };
  }
}
