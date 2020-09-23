import 'package:app/models/history.dart';
import 'package:flutter/material.dart';
import 'package:app/components/section.dart';
import 'package:app/components/history_card.dart';
import 'package:app/models/history.dart';

final histories = [
  History('24 Sep 2020', false),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
  History('02 Sep 2020', true, '09 Sep 2020'),
];

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      backgroundColor: Colors.grey[100],
      body: Builder(
        builder: (context) => SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                Section(
                  title: 'History',
                  child: null,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: histories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 4.0,
                        ),
                        child: HistoryCard(
                          history: histories[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
