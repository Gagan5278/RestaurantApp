import 'food_details.dart';

class FoodModel {
  final int id;
  final String name;
  final String imageName;
  final String price;
  final List<String> ingrediants;
  final List<FoodDetails> foodDetails;

  FoodModel(this.id, this.name, this.imageName, this.price, this.ingrediants,
      this.foodDetails);

  static List<FoodModel> allItems = [
    FoodModel(
      0,
      'Lentils and rice',
      'assets/images/food0.png',
      '1.30',
      ['plain', 'winter squash', 'onions'],
      [
        FoodDetails('Weight', '130', 'G'),
        FoodDetails('Protien', 'A 2', 'Vita'),
        FoodDetails(
          'Calories',
          '212',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '30',
          'Fat',
        )
      ],
    ),
    FoodModel(
      1,
      'Lemonade',
      'assets/images/food1.png',
      '1.00',
      ['lemon juice', 'sugar', 'water', 'mint leaves'],
      [
        FoodDetails('Weight', '100', 'G'),
        FoodDetails('Protien', 'B 12', 'Vita'),
        FoodDetails(
          'Calories',
          '612',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '300',
          'Fat',
        )
      ],
    ),
    FoodModel(
      2,
      'Vegetable Curry',
      'assets/images/food2.png',
      '1.40',
      ['Vegetables', 'Oil', 'Water', 'Salt', 'Species'],
      [
        FoodDetails('Weight', '430', 'G'),
        FoodDetails('Protien', 'B 2', 'Vita'),
        FoodDetails(
          'Calories',
          '322',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '630',
          'Fat',
        )
      ],
    ),
    FoodModel(
      3,
      'Chicken salad',
      'assets/images/food3.png',
      '1.85',
      ['chicken', 'potatoes', 'salad'],
      [
        FoodDetails('Weight', '130', 'G'),
        FoodDetails('Protien', 'A 12 B 2', 'Vita'),
        FoodDetails(
          'Calories',
          '212',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '380',
          'Fat',
        )
      ],
    ),
    FoodModel(
      4,
      'Chicken stir fry',
      'assets/images/food4.png',
      '1.10',
      ['spinach', 'celery', 'broccoli', 'onions', 'carrots'],
      [
        FoodDetails('Weight', '130', 'G'),
        FoodDetails('Protien', 'B 12 A 6', 'Vita'),
        FoodDetails(
          'Calories',
          '512',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '30',
          'Fat',
        )
      ],
    ),
    FoodModel(
      5,
      'Baked stuffed potato',
      'assets/images/food5.png',
      '1.20',
      ['potato with broccoli', 'ff sour cream', 'parmesan'],
      [
        FoodDetails('Weight', '130', 'G'),
        FoodDetails('Protien', 'C 12 A 12', 'Vita'),
        FoodDetails(
          'Calories',
          '229',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '220',
          'Fat',
        )
      ],
    ),
    FoodModel(
      6,
      'Potato Pizza ',
      'assets/images/food6.png',
      '1.45',
      ['potatoes with plum tomatoes', 'spinach', 'onions', 'parmesan cheese'],
      [
        FoodDetails('Weight', '130', 'G'),
        FoodDetails('Protien', 'A 12', 'Vita'),
        FoodDetails(
          'Calories',
          '212',
          'Cal',
        ),
        FoodDetails(
          'Fat',
          '380',
          'Fat',
        )
      ],
    ),
  ];
}
