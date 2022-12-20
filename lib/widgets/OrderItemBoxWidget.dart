import 'package:flutter/material.dart';

class OrderItemBoxWidget extends StatelessWidget {
  String firstOrderItemName;
  String firstOrderItemAmount;
  String secondOrderItemName;
  String secondOrderItemAmount;
  // const OrderItemBoxWidget({Key? key}) : super(key: key);
  OrderItemBoxWidget(this.firstOrderItemName, this.firstOrderItemAmount,this.secondOrderItemName, this.secondOrderItemAmount);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              // color: Colors.cyan[50],
              color: Color.fromRGBO(45, 45, 45, 1),
              // border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          width: 200,
          height: 170,
          child: Stack(
            children: [
              const Positioned(
                  top: 10,
                  child: Text(
                    'Orders -> Kitchen',
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                  top: 40,
                  child: Text(
                    firstOrderItemName,
                    // 'Fish and Chips',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                  top: 70,
                  child: Text(
                    // 'Ksh 450',
                    'Ksh '+ firstOrderItemAmount,
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                  bottom: 10,
                  right: 15,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.0)),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      const Text(
                        '0',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.0)),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
              // color: Colors.cyan[50],
              color: Color.fromRGBO(45, 45, 45, 1),
              // border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          width: 200,
          height: 170,
          child: Stack(
            children: [
              const Positioned(
                  top: 10,
                  child: Text(
                    'Orders -> Kitchen',
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                  top: 40,
                  child: Text(
                    secondOrderItemName,
                    // 'Roast beef',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              Positioned(
                  top: 70,
                  child: Text(
                    'Ksh '+ secondOrderItemAmount,
                    // 'Ksh 1450',
                    style: TextStyle(color: Colors.white),
                  )),
              Positioned(
                  bottom: 10,
                  right: 15,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.0)),
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      const Text(
                        '0',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9.0)),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
