// current_balance_model.dart

class CurrentBalanceModel {
  final int statusCode;
  final String message;
  final List<dynamic> data;

  CurrentBalanceModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory CurrentBalanceModel.fromJson(Map<String, dynamic> json) {
    return CurrentBalanceModel(
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] ?? [],
    );
  }
}
