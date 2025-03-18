class TaskModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  bool isDone;
  String userId;
  bool isFavourite;
  double latitude;
  double longitude;

  TaskModel({
    this.id = "",
    required this.title,
    required this.description,
    required this.category,
    required this.date,
    required this.userId,
    this.isDone = false,
    this.isFavourite = false,
    required this.latitude,
    required this.longitude,
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
          latitude: json['latitude'] ?? 0.0,
          longitude: json['longitude'] ?? 0.0,
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
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}
