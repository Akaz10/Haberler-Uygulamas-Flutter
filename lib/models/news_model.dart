import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.success,
    required this.result,
  });

  bool? success;
  List<Result> result;

  factory News.fromJson(Map<String, dynamic> json) => News(
    success: json["success"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.key,
    this.url,
    this.description,
    this.image,
    this.name,
    this.source,
    this.date,
  });

  String? key;
  String? url;
  String? description;
  String? image;
  String? name;
  String? source;
  DateTime? date;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    key: json["key"],
    url: json["url"],
    description: json["description"],
    image: json["image"],
    name: json["name"],
    source: json["source"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "url": url,
    "description": description,
    "image": image,
    "name": name,
    "source": source,
    "date": date!.toIso8601String(),
  };
}
