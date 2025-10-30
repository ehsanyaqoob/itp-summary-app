class AnalysisResponse {
  final bool status;
  final String message;
  final AnalysisData data;

  AnalysisResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AnalysisResponse.fromJson(Map<String, dynamic> json) {
    return AnalysisResponse(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: AnalysisData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class AnalysisData {
  final TodayAnalysis today;
  final WeekAnalysis week;
  final MonthAnalysis month;
  final YearAnalysis year;

  AnalysisData({
    required this.today,
    required this.week,
    required this.month,
    required this.year,
  });

  factory AnalysisData.fromJson(Map<String, dynamic> json) {
    return AnalysisData(
      today: TodayAnalysis.fromJson(json),
      week: WeekAnalysis.fromJson(json),
      month: MonthAnalysis.fromJson(json),
      year: YearAnalysis.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ...today.toJson(),
      ...week.toJson(),
      ...month.toJson(),
      ...year.toJson(),
    };
  }
}

class TodayAnalysis {
  final int records;
  final String totalPaid;
  final String totalUnpaid;
  final int totalAmount;
  final int paidTickets;
  final int unpaidTickets;

  TodayAnalysis({
    required this.records,
    required this.totalPaid,
    required this.totalUnpaid,
    required this.totalAmount,
    required this.paidTickets,
    required this.unpaidTickets,
  });

  factory TodayAnalysis.fromJson(Map<String, dynamic> json) {
    return TodayAnalysis(
      records: json['todayRecords'] as int,
      totalPaid: json['totalPaidToday'] as String,
      totalUnpaid: json['totalUnpaidToday'] as String,
      totalAmount: json['totalAmountOfToday'] as int,
      paidTickets: json['todayPaidTicket'] as int,
      unpaidTickets: json['todayUnPaidTicket'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todayRecords': records,
      'totalPaidToday': totalPaid,
      'totalUnpaidToday': totalUnpaid,
      'totalAmountOfToday': totalAmount,
      'todayPaidTicket': paidTickets,
      'todayUnPaidTicket': unpaidTickets,
    };
  }
}

class WeekAnalysis {
  final int records;
  final String paid;
  final String unpaid;
  final int totalAmount;
  final int paidTickets;
  final int unpaidTickets;

  WeekAnalysis({
    required this.records,
    required this.paid,
    required this.unpaid,
    required this.totalAmount,
    required this.paidTickets,
    required this.unpaidTickets,
  });

  factory WeekAnalysis.fromJson(Map<String, dynamic> json) {
    return WeekAnalysis(
      records: json['weeklyTotalRecord'] as int,
      paid: json['paidThisWeek'] as String,
      unpaid: json['UnpaidThisWeek'] as String,
      totalAmount: json['totalAmountOfToWeek'] as int,
      paidTickets: json['weekPaidTicket'] as int,
      unpaidTickets: json['weekUnPaidTicket'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weeklyTotalRecord': records,
      'paidThisWeek': paid,
      'UnpaidThisWeek': unpaid,
      'totalAmountOfToWeek': totalAmount,
      'weekPaidTicket': paidTickets,
      'weekUnPaidTicket': unpaidTickets,
    };
  }
}

class MonthAnalysis {
  final int records;
  final String paid;
  final String unpaid;
  final int totalAmount;
  final int paidTickets;
  final int unpaidTickets;

  MonthAnalysis({
    required this.records,
    required this.paid,
    required this.unpaid,
    required this.totalAmount,
    required this.paidTickets,
    required this.unpaidTickets,
  });

  factory MonthAnalysis.fromJson(Map<String, dynamic> json) {
    return MonthAnalysis(
      records: json['monthlyTotalRecord'] as int,
      paid: json['paidThisMonth'] as String,
      unpaid: json['UnpaidThisMonth'] as String,
      totalAmount: json['totalAmountOfToMonth'] as int,
      paidTickets: json['monthPaidTicket'] as int,
      unpaidTickets: json['monthUnPaidTicket'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monthlyTotalRecord': records,
      'paidThisMonth': paid,
      'UnpaidThisMonth': unpaid,
      'totalAmountOfToMonth': totalAmount,
      'monthPaidTicket': paidTickets,
      'monthUnPaidTicket': unpaidTickets,
    };
  }
}

class YearAnalysis {
  final int records;
  final String paid;
  final String unpaid;
  final int totalAmount;
  final int paidTickets;
  final int unpaidTickets;

  YearAnalysis({
    required this.records,
    required this.paid,
    required this.unpaid,
    required this.totalAmount,
    required this.paidTickets,
    required this.unpaidTickets,
  });

  factory YearAnalysis.fromJson(Map<String, dynamic> json) {
    return YearAnalysis(
      records: json['yearlyTotalRecord'] as int,
      paid: json['paidThisYear'] as String,
      unpaid: json['UnpaidThisYear'] as String,
      totalAmount: json['totalAmountOfToYear'] as int,
      paidTickets: json['yearPaidTicket'] as int,
      unpaidTickets: json['yearUnPaidTicket'] as int,
    );
  }
  

  Map<String, dynamic> toJson() {
    return {
      'yearlyTotalRecord': records,
      'paidThisYear': paid,
      'UnpaidThisYear': unpaid,
      'totalAmountOfToYear': totalAmount,
      'yearPaidTicket': paidTickets,
      'yearUnPaidTicket': unpaidTickets,
    };
  }
}