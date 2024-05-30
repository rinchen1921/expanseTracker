// ignore_for_file: file_names

class SummaryModel {
  final int openingBalance;
  final int targetedBudget;
  final int totalIncome;
  final int totalExpenses;

  SummaryModel({
    required this.openingBalance,
    required this.targetedBudget,
    required this.totalIncome,
    required this.totalExpenses,
  });

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
      openingBalance: json['data']['openingBalance'] ?? 0,
      targetedBudget: json['data']['targetedBudget'] ?? 0,
      totalIncome: json['data']['totalIncome'] ?? 0,
      totalExpenses: json['data']['expenses'] ?? 0,
    );
  }
}
