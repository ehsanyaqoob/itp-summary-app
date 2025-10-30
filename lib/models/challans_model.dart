
class ChallanModel {
  final int eTicket;         // Total challans (for the selected filter)
  final double fineAmount;   // Total amount (for the selected filter)
  final double paidAmount;   // Paid amount
  final double unpaidAmount; // Unpaid amount
  final int paidTickets;     // Number of paid tickets
  final int unpaidTickets;   // Number of unpaid tickets

  ChallanModel({
    required this.eTicket,
    required this.fineAmount,
    required this.paidAmount,
    required this.unpaidAmount,
    required this.paidTickets,
    required this.unpaidTickets,
  });

  /// ✅ Helper Functions to safely parse dynamic values
  static int parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }

  static double parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  /// ✅ Factory constructor with filter handling
  factory ChallanModel.fromJson(Map<String, dynamic> json, String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return ChallanModel(
          eTicket: parseInt(json['todayRecords']),
          fineAmount: parseDouble(json['totalAmountOfToday']),
          paidAmount: parseDouble(json['totalPaidToday']),
          unpaidAmount: parseDouble(json['totalUnpaidToday']),
          paidTickets: parseInt(json['todayPaidTicket']),
          unpaidTickets: parseInt(json['todayUnPaidTicket']),
        );

      case 'weekly':
        return ChallanModel(
          eTicket: parseInt(json['weeklyTotalRecord']),
          fineAmount: parseDouble(json['totalAmountOfToWeek']),
          paidAmount: parseDouble(json['paidThisWeek']),
          unpaidAmount: parseDouble(json['UnpaidThisWeek']),
          paidTickets: parseInt(json['weekPaidTicket']),
          unpaidTickets: parseInt(json['weekUnPaidTicket']),
        );

      case 'monthly':
        return ChallanModel(
          eTicket: parseInt(json['monthlyTotalRecord']),
          fineAmount: parseDouble(json['totalAmountOfToMonth']),
          paidAmount: parseDouble(json['paidThisMonth']),
          unpaidAmount: parseDouble(json['UnpaidThisMonth']),
          paidTickets: parseInt(json['monthPaidTicket']),
          unpaidTickets: parseInt(json['monthUnPaidTicket']),
        );

      case 'yearly':
        return ChallanModel(
          eTicket: parseInt(json['yearlyTotalRecord']),
          fineAmount: parseDouble(json['totalAmountOfToYear']),
          paidAmount: parseDouble(json['paidThisYear']),
          unpaidAmount: parseDouble(json['UnpaidThisYear']),
          paidTickets: parseInt(json['yearPaidTicket']),
          unpaidTickets: parseInt(json['yearUnPaidTicket']),
        );

      case 'overall': // ✅ Adding support for overall stats
        return ChallanModel(
          eTicket: parseInt(json['totalRecords']),
          fineAmount: parseDouble(json['totalAmountOverall']),
          paidAmount: parseDouble(json['totalPaidAmount']),
          unpaidAmount: parseDouble(json['totalUnpaidAmount']),
          paidTickets: parseInt(json['totalPaidTicket']),
          unpaidTickets: parseInt(json['totalUnPaidTicket']),
        );

      default:
        return ChallanModel(
          eTicket: 0,
          fineAmount: 0.0,
          paidAmount: 0.0,
          unpaidAmount: 0.0,
          paidTickets: 0,
          unpaidTickets: 0,
        );
    }
  }
}
