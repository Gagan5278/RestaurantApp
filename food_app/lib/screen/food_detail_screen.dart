import 'package:flutter/material.dart';
import '../model/food_model.dart';
import '../widget/stepper.dart';

class FoodDetailScreen extends StatefulWidget {
  final FoodModel selectedFood;
  FoodDetailScreen({this.selectedFood});

  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  double foodprice = 0.0;

  void updatePriceWith(int count) {
    setState(() {
      foodprice = double.parse(this.widget.selectedFood.price) * count;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Details'),
        elevation: 0.0,
        backgroundColor: Colors.red,
        actions: [],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            FoodPrice(
                size: size,
                foodPrice: foodprice == 0.0
                    ? double.parse(this.widget.selectedFood.price)
                    : foodprice),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Positioned(
                      left: size.width * 0.20,
                      top: -size.width * 0.10,
                      child: Hero(
                        tag: this.widget.selectedFood.id,
                        child: Image.asset(
                          this.widget.selectedFood.imageName,
                          height: size.width * 0.60,
                          width: size.width * 0.60,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.width * 0.55),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                this.widget.selectedFood.name,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 30),
                              ),
                              Container(
                                width: 4,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10),
                                    bottom: Radius.circular(10),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: StepperUI(
                                  updatePrice: this.updatePriceWith,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 160,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (cntx, index) {
                                return FoodInfoCard(
                                  index: index,
                                  selectedFood: widget.selectedFood,
                                );
                              },
                              itemCount: widget.selectedFood.foodDetails.length,
                            ),
                          ),
                          OrderNowBox(size: size)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderNowBox extends StatelessWidget {
  const OrderNowBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Order Now',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text('Would you like to order of these item?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Not Now',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Approve',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        _showMyDialog();
      },
      child: Container(
        height: size.height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Order Now',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodInfoCard extends StatelessWidget {
  const FoodInfoCard({
    Key key,
    @required this.selectedFood,
    @required this.index,
  }) : super(key: key);

  final FoodModel selectedFood;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: Colors.black54),
            color: Colors.red,
            borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              this.selectedFood.foodDetails[index].name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              this.selectedFood.foodDetails[index].quantity,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              this.selectedFood.foodDetails[index].symbole,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodPrice extends StatelessWidget {
  const FoodPrice({
    Key key,
    @required this.size,
    @required this.foodPrice,
  }) : super(key: key);

  final Size size;
  final double foodPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Text(
        '\$' + foodPrice.toStringAsFixed(2),
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}
