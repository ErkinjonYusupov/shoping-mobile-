class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json['userId'] ?? -1,
      id: json['id'] ?? -1,
      title: json['title'] ?? 'error',
      body: json['body'] ?? 'error');
}
List<Post>postFromMap(List list)=>List<Post>.from(list.map((item) => Post.fromJson(item)));