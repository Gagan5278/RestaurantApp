import 'package:flutter/material.dart';
import '../model/food_model.dart';
import '../screen/food_detail_screen.dart';

class FoodItemList extends StatelessWidget {
  final Function addItem;
  const FoodItemList({Key key, @required this.addItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 40),
      itemBuilder: (cntx, index) {
        final foodModel = FoodModel.allItems[index];
        return GestureDetector(
          onTap: () {
            return Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return FoodDetailScreen(
                selectedFood: foodModel,
              );
            }));
          },
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 100,
                margin: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                        tag: foodModel.id,
                        child: Image.asset(foodModel.imageName)),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            foodModel.name,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '\$' + foodModel.price,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(25.0)),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            return this.addItem();
                          }),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
              )
            ],
          ),
        );
      },
      itemCount: FoodModel.allItems.length,
    );
  }
}
