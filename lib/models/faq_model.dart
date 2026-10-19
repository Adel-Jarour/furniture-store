class FaqModel {
  final String id;
  final String question;
  final String answer;
  final String category;
  bool isExpanded;

  FaqModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.category,
    this.isExpanded = false,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id']?.toString() ?? '',
      question: json['question']?.toString() ?? '',
      answer: json['answer']?.toString() ?? '',
      category: json['category']?.toString() ?? 'General',
      isExpanded: json['isExpanded'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'category': category,
      'isExpanded': isExpanded,
    };
  }
}
