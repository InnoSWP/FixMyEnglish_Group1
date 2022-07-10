import '/models/report.dart';

/// A class to combine [Report] and date it was created.
class ReportDate {
  ReportDate({
    required this.report,
    this.date,
  }) {
    date ??= DateTime.now();
  }

  /// [Report] made by user
  Report report;

  /// Date of when [report] made, by default its date when constructor was called.
  DateTime? date;
}
