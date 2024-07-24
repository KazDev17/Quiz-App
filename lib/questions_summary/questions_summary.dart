//PAGE 5.1

import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map( //summaryData in Results Screen now mapped to SummaryItem
            (data) {
              //here was where the old_questions_summary code was
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
