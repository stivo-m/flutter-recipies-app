class Meal {
  final String id,
      title,
      category,
      thumbnail,
      tags,
      video,
      description,
      totalTime,
      rating;

  final List<dynamic> preparationSteps;

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
      id: json['content']['details']['recipeId'] as String,
      title: json['display']['displayName'] as String,
      category: json['tracking-id'] as String,
      thumbnail:
          json['content']['details']['images'][0]['hostedLargeUrl'] as String,
      tags: json['tracking-id'] as String,
      video: json['content']['videos']['snapshotUrl']['android'] as String,
      description: json['content']['description']['text'] as String,
      preparationSteps: json['content']['preparationSteps'],
      rating: json['content']['details']['rating'].toString(),
      totalTime: json['content']['details']['totalTime'] as String,
    );
  }

  static List<Meal> mealsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Meal.fromJson(data);
    }).toList();
  }
}
