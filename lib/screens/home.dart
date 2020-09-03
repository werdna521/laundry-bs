import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app/components/queue_card.dart';
import 'package:app/components/section.dart';
import 'package:app/components/counter_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0.0),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                      SizedBox(height: 24.0),
                      QueueCard(),
                      SizedBox(height: 24.0),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Section(
                      title: 'Queue',
                      child: Container(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 108.0,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 0 || index == 10)
                                return SizedBox(
                                  width: 24.0,
                                );

                              if (index % 2 == 0)
                                return SizedBox(
                                  width: 16.0,
                                );

                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: CounterCard(
                                  counterNumber: (index / 2).ceil(),
                                  counterQueueNumber:
                                      Random().nextInt(100).toString(),
                                ),
                              );
                            },
                            itemCount: 11,
                          ),
                        ),
                      ),
                    ),
                    Section(
                      title: 'History',
                      buttonText: 'SEE MORE',
                      onPress: () {},
                      child: Container(
                        child: Column(
                          children: [
                            Text('Hello'),
                            Text('World'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
