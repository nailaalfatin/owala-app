// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.deepPurpleAccent,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              )
            ),
            SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              )
            ),
          ],
        ),
      ),
    );
  }
}