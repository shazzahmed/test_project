import 'package:flutter/material.dart';

class ItemBoxWidget extends StatelessWidget {
  // const ItemBoxWidget({Key? key}) : super(key: key);

  Color firstColor;
  Icon firstIcon;
  String firstItemName;
  String firstItemCount;
  Color secondColor;
  Icon secondIcon;
  String secondItemName;
  String secondItemCount;
  ItemBoxWidget(this.firstColor, this.firstIcon, this.firstItemName,this.firstItemCount,
      this.secondColor, this.secondIcon, this.secondItemName,this.secondItemCount);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              // color: Colors.cyan[50],
              color: firstColor,
              // const Color.fromRGBO(207, 221, 219, 1),
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          width: 200,
          height: 170,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: firstIcon,
                // Icon(Icons.free_breakfast),
              ),
              Positioned(
                bottom: 37,
                child: Text(
                  firstItemName,
                  // 'Breakfast',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Positioned(
                bottom: 18,
                child: Text(
                  firstItemCount,
                  // '13 items'
                  ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              // color: Colors.cyan[50],
              color: secondColor,
              // const Color.fromRGBO(250, 194, 217, 1),
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(15.0))),
          width: 200,
          height: 170,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: secondIcon,
                // Icon(Icons.food_bank),
              ),
              Positioned(
                bottom: 37,
                child: Text(
                  secondItemName,
                  // 'Main Course',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Positioned(
                bottom: 18,
                child: Text(
                  secondItemCount
                  // '7 items'
                  ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
