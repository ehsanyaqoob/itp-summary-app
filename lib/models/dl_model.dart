// dl_model.dart
class DrivingLicenceModel {
  final int todayRecords;
  final double totalPaidToday;
  final double totalUnpaidToday;
  final int totalAmountOfToday;
  final int todayPaidTicket;
  final int todayUnPaidTicket;
  
  final int weeklyTotalRecord;
  final double paidThisWeek;
  final double unpaidThisWeek;
  final int totalAmountOfToWeek;
  final int weekPaidTicket;
  final int weekUnPaidTicket;
  
  final int monthlyTotalRecord;
  final double paidThisMonth;
  final double unpaidThisMonth;
  final int totalAmountOfToMonth;
  final int monthPaidTicket;
  final int monthUnPaidTicket;
  
  final int yearlyTotalRecord;
  final double paidThisYear;
  final double unpaidThisYear;
  final int totalAmountOfToYear;
  final int yearPaidTicket;
  final int yearUnPaidTicket;
  
  final int approveLearner;
  final int inprocessLearner;
  final int pendingLearner;
  final int rejectedLearner;
  final int maleLearner;
  final int femaleLearner;

  DrivingLicenceModel({
    required this.todayRecords,
    required this.totalPaidToday,
    required this.totalUnpaidToday,
    required this.totalAmountOfToday,
    required this.todayPaidTicket,
    required this.todayUnPaidTicket,
    required this.weeklyTotalRecord,
    required this.paidThisWeek,
    required this.unpaidThisWeek,
    required this.totalAmountOfToWeek,
    required this.weekPaidTicket,
    required this.weekUnPaidTicket,
    required this.monthlyTotalRecord,
    required this.paidThisMonth,
    required this.unpaidThisMonth,
    required this.totalAmountOfToMonth,
    required this.monthPaidTicket,
    required this.monthUnPaidTicket,
    required this.yearlyTotalRecord,
    required this.paidThisYear,
    required this.unpaidThisYear,
    required this.totalAmountOfToYear,
    required this.yearPaidTicket,
    required this.yearUnPaidTicket,
    required this.approveLearner,
    required this.inprocessLearner,
    required this.pendingLearner,
    required this.rejectedLearner,
    required this.maleLearner,
    required this.femaleLearner,
  });

  factory DrivingLicenceModel.fromJson(Map<String, dynamic> json, String filter) {
    return DrivingLicenceModel(
      todayRecords: int.tryParse(json['todayRecords']?.toString() ?? '0') ?? 0,
      totalPaidToday: double.tryParse(json['totalPaidToday']?.toString() ?? '0.0') ?? 0.0,
      totalUnpaidToday: double.tryParse(json['totalUnpaidToday']?.toString() ?? '0.0') ?? 0.0,
      totalAmountOfToday: json['totalAmountOfToday'] ?? 0,
      todayPaidTicket: int.tryParse(json['todayPaidTicket']?.toString() ?? '0') ?? 0,
      todayUnPaidTicket: int.tryParse(json['todayUnPaidTicket']?.toString() ?? '0') ?? 0,
      
      weeklyTotalRecord: int.tryParse(json['weeklyTotalRecord']?.toString() ?? '0') ?? 0,
      paidThisWeek: double.tryParse(json['paidThisWeek']?.toString() ?? '0.0') ?? 0.0,
      unpaidThisWeek: double.tryParse(json['UnpaidThisWeek']?.toString() ?? '0.0') ?? 0.0,
      totalAmountOfToWeek: json['totalAmountOfToWeek'] ?? 0,
      weekPaidTicket: int.tryParse(json['weekPaidTicket']?.toString() ?? '0') ?? 0,
      weekUnPaidTicket: int.tryParse(json['weekUnPaidTicket']?.toString() ?? '0') ?? 0,
      
      monthlyTotalRecord: int.tryParse(json['monthlyTotalRecord']?.toString() ?? '0') ?? 0,
      paidThisMonth: double.tryParse(json['paidThisMonth']?.toString() ?? '0.0') ?? 0.0,
      unpaidThisMonth: double.tryParse(json['UnpaidThisMonth']?.toString() ?? '0.0') ?? 0.0,
      totalAmountOfToMonth: json['totalAmountOfToMonth'] ?? 0,
      monthPaidTicket: int.tryParse(json['monthPaidTicket']?.toString() ?? '0') ?? 0,
      monthUnPaidTicket: int.tryParse(json['monthUnPaidTicket']?.toString() ?? '0') ?? 0,
      
      yearlyTotalRecord: int.tryParse(json['yearlyTotalRecord']?.toString() ?? '0') ?? 0,
      paidThisYear: double.tryParse(json['paidThisYear']?.toString() ?? '0.0') ?? 0.0,
      unpaidThisYear: double.tryParse(json['UnpaidThisYear']?.toString() ?? '0.0') ?? 0.0,
      totalAmountOfToYear: json['totalAmountOfToYear'] ?? 0,
      yearPaidTicket: int.tryParse(json['yearPaidTicket']?.toString() ?? '0') ?? 0,
      yearUnPaidTicket: int.tryParse(json['yearUnPaidTicket']?.toString() ?? '0') ?? 0,
      
      approveLearner: json['approveLearner'] ?? 0,
      inprocessLearner: json['inprocessLearner'] ?? 0,
      pendingLearner: json['pendingLearner'] ?? 0,
      rejectedLearner: json['rejectedLearner'] ?? 0,
      maleLearner: json['maleLearner'] ?? 0,
      femaleLearner: json['femaleLearner'] ?? 0,
    );
  }

  // Helper methods to get data based on filter
  int getTotalRecords(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return todayRecords;
      case 'weekly':
        return weeklyTotalRecord;
      case 'monthly':
        return monthlyTotalRecord;
      case 'yearly':
        return yearlyTotalRecord;
      default:
        return todayRecords;
    }
  }

  int getPaidTickets(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return todayPaidTicket;
      case 'weekly':
        return weekPaidTicket;
      case 'monthly':
        return monthPaidTicket;
      case 'yearly':
        return yearPaidTicket;
      default:
        return todayPaidTicket;
    }
  }

  int getUnpaidTickets(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return todayUnPaidTicket;
      case 'weekly':
        return weekUnPaidTicket;
      case 'monthly':
        return monthUnPaidTicket;
      case 'yearly':
        return yearUnPaidTicket;
      default:
        return todayUnPaidTicket;
    }
  }

  double getPaidAmount(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return totalPaidToday;
      case 'weekly':
        return paidThisWeek;
      case 'monthly':
        return paidThisMonth;
      case 'yearly':
        return paidThisYear;
      default:
        return totalPaidToday;
    }
  }

  double getUnpaidAmount(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return totalUnpaidToday;
      case 'weekly':
        return unpaidThisWeek;
      case 'monthly':
        return unpaidThisMonth;
      case 'yearly':
        return unpaidThisYear;
      default:
        return totalUnpaidToday;
    }
  }

  double getTotalAmount(String filter) {
    switch (filter.toLowerCase()) {
      case 'daily':
        return totalAmountOfToday.toDouble();
      case 'weekly':
        return totalAmountOfToWeek.toDouble();
      case 'monthly':
        return totalAmountOfToMonth.toDouble();
      case 'yearly':
        return totalAmountOfToYear.toDouble();
      default:
        return totalAmountOfToday.toDouble();
    }
  }
}