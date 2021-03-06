class Meal {
  final String id, title, category, thumbnail, tags, totalTime, rating;

  final List<dynamic> preparationSteps;
  final dynamic description, video;

  Meal({
    required this.id,
    required this.title,
    required this.category,
    required this.thumbnail,
    required this.tags,
    required this.video,
    required this.description,
    required this.rating,
    required this.totalTime,
    required this.preparationSteps,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['content']['details']['recipeId'].toString(),
      title: json['display']['displayName'].toString(),
      category: json['tracking-id'].toString(),
      thumbnail:
          json['content']['details']['images'][0]['hostedLargeUrl'].toString(),
      tags: json['tracking-id'].toString(),
      video: json['content']['videos'],
      description: json['content']['description'],
      preparationSteps: json['content']['preparationSteps'] ?? [],
      rating: json['content']['details']['rating'].toString(),
      totalTime: json['content']['details']['totalTime'].toString(),
    );
  }

  static List<Meal> mealsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Meal.fromJson(data);
    }).toList();
  }
}
