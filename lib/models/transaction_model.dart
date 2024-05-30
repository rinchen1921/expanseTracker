// transaction_model.dart

class TransactionModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String note;
  final dynamic document;
  final double amount;
  final String type;

  TransactionModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.note,
    required this.document,
    required this.amount,
    required this.type,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      note: json['note'],
      document: json['document'],
      amount: json['amount'].toDouble(),
      type: json['type'],
    );
  }
}
