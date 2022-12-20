import 'package:flutter/material.dart';

class OrderStatusRowWidget extends StatelessWidget {
  // const OrderStatusRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 270,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: const Text('T4'),
                ),
              ),
              const Positioned(
                left: 40,
                child: Text(
                  'Leslie K.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 18,
                child: Text(
                  '6 items -> Kitchen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 3,
          height: 50,
          child: VerticalDivider(thickness: 2, color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 270,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(45, 45, 45, 1),
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: const Text(
                    'T2',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                child: Text(
                  'Jacob J.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 150,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: const Text(
                    'In Process',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 18,
                child: Text(
                  '4 items -> Kitchen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 3,
          height: 50,
          child: VerticalDivider(thickness: 2, color: Colors.white),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 270,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(45, 45, 45, 1),
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: const Text(
                    'T3',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                child: Text(
                  'Cameron W.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                left: 150,
                child: Container(
                  alignment: Alignment.center,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: const Text(
                    'In Process',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 40,
                top: 18,
                child: Text(
                  '4 items -> Kitchen',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
