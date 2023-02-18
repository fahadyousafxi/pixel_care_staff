
class AccademicCertModel {
  AccademicCertModel({
    required this.status,
    required this.message,
    required this.data,
  });

  int status;
  String message;
  List<Datum> data;

  factory AccademicCertModel.fromJson(Map<String, dynamic> json) => AccademicCertModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.dateOfCompletion,
    required this.expiryDate,
    required this.docCategory,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.docCategoryName,
  });

  int id;
  String userId;
  DateTime dateOfCompletion;
  DateTime expiryDate;
  String docCategory;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String docCategoryName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    dateOfCompletion: DateTime.parse(json["date_of_completion"]),
    expiryDate: DateTime.parse(json["expiry_date"]),
    docCategory: json["doc_category"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    docCategoryName: json["doc_category_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "date_of_completion": "${dateOfCompletion.year.toString().padLeft(4, '0')}-${dateOfCompletion.month.toString().padLeft(2, '0')}-${dateOfCompletion.day.toString().padLeft(2, '0')}",
    "expiry_date": "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
    "doc_category": docCategory,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "doc_category_name": docCategoryName,
  };
}

