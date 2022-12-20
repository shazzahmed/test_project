import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  // const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 30,
          width: 250,
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              filled: true,
              fillColor: Colors.grey.shade300,
              floatingLabelStyle: const TextStyle(color: Colors.black),
              labelText: 'Search',
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
