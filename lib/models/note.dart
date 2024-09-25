class Note {
  String title;
  String content;

  Note({required this.title, required this.content});

  // JSON SERIALIZTION
  Map<String, dynamic> toJson() {
    return {'title': title, 'content': content};
  }

  // JSON DESERIALIZTION
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(title: json['title'], content: json['content']);
  }
}
