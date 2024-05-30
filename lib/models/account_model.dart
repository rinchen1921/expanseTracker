// account_model.dart

class AccountModel {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String img;
  final double openingBalance;

  AccountModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.img,
    required this.openingBalance,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      title: json['title'],
      img: json['img'],
      openingBalance: json['openingBalance'].toDouble(),
    );
  }
}
