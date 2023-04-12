import 'package:flutter/cupertino.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class SummaryData extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const SummaryData(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
