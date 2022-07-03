import '/models/report.dart';

class ReportDate {
  Report report;
  DateTime? date;
  ReportDate({
    required this.report,
    this.date,
  }) {
    date ??= DateTime.now();
  }
}
