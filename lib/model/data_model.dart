
class MData {
  final int? count;
  final List<WeatherData>? entries;

  MData({

    this.count,
    this.entries,
  });

  factory MData.fromJson(dynamic json) =>
      MData(
        count: json["count"] ?? 0,
        entries: json["entries"] == null
            ? []
            : List<WeatherData>.from(
            json["entries"]!.map((x) => WeatherData.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "count": count,
        "entries": entries == null
            ? []
            : List<dynamic>.from(entries!.map((x) => x.toJson())),
      };
}

class WeatherData {
  final String? API;
  final String? description;
  final String? Auth;
  final String? Link;
  final String? Category;
  WeatherData({
    this.API,
    this.description,
    this.Auth,
    this.Link,
    this.Category,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      WeatherData(
        API: json["API"] ?? "",
        description: json["Description"] ?? "",
        Auth: json["Auth"] ?? "",
        Link: json["Link"] ?? "",
        Category: json["Category"] ?? "",
      );

  Map<String, dynamic> toJson() =>
      {
        "API": API,
        "Description": description,
        "Auth": Auth,
        "Link": Link,
        "Category": Category,

      };
}

