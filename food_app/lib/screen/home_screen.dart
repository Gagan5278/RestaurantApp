import 'package:flutter/material.dart';
import '../widget/top_title_header.dart';
import '../widget/food_item_list.dart';
import '../widget/badge.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  int badge_count = 0;
  void updateCount() {
    setState(() {
      badge_count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Badge(
              color: Colors.purple,
              child: IconButton(icon: Icon(Icons.fastfood), onPressed: () {}),
              value: badge_count.toString())
        ],
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://iili.io/24r2Sa.md.jpg'), //add your own image URL if fails
                  fit: BoxFit.cover)),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopTitleHeader(
                  title: 'Healthy',
                  subTitle: ' food',
                  color: Colors.red,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                        ),
                      ),
                      child: FoodItemList(
                        addItem: updateCount,
                      ),
                    ),
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
