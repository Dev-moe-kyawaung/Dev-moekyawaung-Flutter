class ProjectModel {
  final String title;
  final String description;
  final List<String> tags;
  final String image;
  final String githubUrl;
  final String liveUrl;
  final String category;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
    required this.githubUrl,
    required this.liveUrl,
    required this.category,
  });
}
