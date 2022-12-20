import 'package:flutter/material.dart';
import 'package:test_project/widgets/ItemBoxWidget.dart';
import 'package:test_project/widgets/MenuWidget.dart';
import 'package:test_project/widgets/OrderItemBoxWidget.dart';
import 'package:test_project/widgets/OrderStatusRowWidget.dart';
import 'package:test_project/widgets/SearchWidget.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      const SizedBox(
        width: 10,
      ),
      MenuWidget(),
      const VerticalDivider(thickness: 1, width: 1),
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            Row(
              children: [
                ItemBoxWidget(
                    Color.fromRGBO(207, 221, 219, 1),
                    Icon(Icons.free_breakfast),
                    'Breakfast',
                    '13 items',
                    Color.fromRGBO(250, 194, 217, 1),
                    Icon(Icons.food_bank),
                    'Main Course',
                    '7 items'),
                ItemBoxWidget(
                    Color.fromRGBO(228, 205, 238, 1),
                    Icon(Icons.food_bank_outlined),
                    'Pasta',
                    '10 items',
                    Color.fromRGBO(230, 218, 222, 1),
                    Icon(Icons.cake),
                    'Desserts',
                    '9 items'),
                ItemBoxWidget(
                    Color.fromRGBO(194, 219, 233, 1),
                    Icon(Icons.soup_kitchen),
                    'Soups',
                    '8 items',
                    Color.fromRGBO(240, 200, 207, 1),
                    Icon(Icons.free_breakfast_sharp),
                    'Drinks',
                    '11 items'),
                ItemBoxWidget(
                    Color.fromRGBO(201, 202, 238, 1),
                    Icon(Icons.bubble_chart),
                    'Sushi',
                    '15 items',
                    Color.fromRGBO(195, 233, 222, 1),
                    Icon(Icons.wine_bar),
                    'Drinks',
                    '12 items'),
              ],
            ),
            const SizedBox(
              width: 840,
              child: Divider(
                thickness: 2,
                height: 20,
                color: Colors.white,
              ),
            ),
            Row(
              children: [
                OrderItemBoxWidget(
                    'Fish and Chips', '450', 'Roast beef', '1450'),
                OrderItemBoxWidget(
                    'Roast chicken', '1250', 'Buffalo wings', '2450'),
                OrderItemBoxWidget('Fillet steak', '1050', 'Lobster', '1750'),
                OrderItemBoxWidget('Beef steak', '1500', 'Red cavier', '2000'),
              ],
            ),
            const SizedBox(
              width: 840,
              child: Divider(
                thickness: 2,
                height: 20,
                color: Colors.white,
              ),
            ),
            OrderStatusRowWidget(),
          ],
        ),
      ),
      const SizedBox(width: 20),
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 270,
              height: 96,
              child: Stack(
                children: const [
                  Positioned(
                    top: 10,
                    child: Text(
                      'Table 5',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Text(
                      'Leslie K.',
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 30,
                    child: Icon(
                      Icons.note_alt,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 270,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              child: Stack(
                children: const [
                  Positioned(
                      left: 10,
                      top: 15,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text('1'),
                      )
                      // child: Container(child: const Text('1')),
                      ),
                  Positioned(
                    top: 15,
                    left: 40,
                    child: Text(
                      'Roast chicken x2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Text(
                      'Ksh 4500',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 270,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              child: Stack(
                children: const [
                  Positioned(
                      left: 10,
                      top: 15,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text('2'),
                      )
                      // child: Container(child: const Text('1')),
                      ),
                  Positioned(
                    top: 15,
                    left: 40,
                    child: Text(
                      'Red Cavier x3',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Text(
                      'Ksh 3500',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 270,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              child: Stack(
                children: const [
                  Positioned(
                      left: 10,
                      top: 15,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text('3'),
                      )
                      // child: Container(child: const Text('1')),
                      ),
                  Positioned(
                    top: 15,
                    left: 40,
                    child: Text(
                      'German Sausage x2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Text(
                      'Ksh 1500',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 270,
              height: 50,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              child: Stack(
                children: const [
                  Positioned(
                      left: 10,
                      top: 15,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.white,
                        child: Text('4'),
                      )
                      // child: Container(child: const Text('1')),
                      ),
                  Positioned(
                    top: 15,
                    left: 40,
                    child: Text(
                      'Irish Cream Coffee x2',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 15,
                    child: Text(
                      'Ksh 900',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 270,
              height: 520,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(45, 45, 45, 1),
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 15,
                    child: Row(
                      children: const [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 90),
                        Text(
                          'Ksh 10400',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 15,
                    child: Row(
                      children: const [
                        Text(
                          'Tax 10%',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 90),
                        Text(
                          'Ksh 1040',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 70,
                    left: 15,
                    child: Text(
                      '--------------------------------------------',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 15,
                    child: Row(
                      children: const [
                        Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(width: 70),
                        Text(
                          'Ksh 1040',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 20,
                    child: Row(
                      children: const [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            // fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 330,
                    left: 20,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(9.0))),
                              child: const Icon(Icons.monetization_on,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Cash',
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                // fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(9.0))),
                              child: const Icon(Icons.credit_card,
                                  color: Colors.white),
                            ),
                            const Text(
                              'Debit Card',
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                // fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(9.0))),
                              child: const Icon(Icons.qr_code,
                                  color: Colors.white),
                            ),
                            const Text(
                              'E-Wallet',
                              style: TextStyle(
                                color: Colors.white,
                                // fontWeight: FontWeight.bold,
                                // fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 420,
                    left: 45,
                    child: Container(
                      alignment: Alignment.center,
                      width: 180,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      child: const Text(
                        'Place Order',
                        style: TextStyle(
                          // color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
