import 'package:flutter/material.dart';
import 'package:test_project/widgets/UserNameWidget.dart';

class MenuWidget extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);
  final int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: const Text(
        'Flutter POS',
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: Expanded(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UserNameWidget('Leslie K.', 'L'),
            UserNameWidget('Cameron W.', 'C'),
            UserNameWidget('Jacob J.', 'J'),
            const SizedBox(height: 20),
            const Text(
              '@2022 FLutter POS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // minWidth: 150,
      // minExtendedWidth: 200,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        // setState(() {
        // _selectedIndex = index;
        // });
      },
      labelType: NavigationRailLabelType.all,
      useIndicator: true,
      backgroundColor: const Color.fromRGBO(17, 19, 21, 1),
      indicatorColor: Colors.white30,
      unselectedLabelTextStyle: const TextStyle(color: Colors.white),
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
      unselectedIconTheme: const IconThemeData(color: Colors.white),
      selectedIconTheme: const IconThemeData(color: Colors.white),
      destinations: _buildDestinations(),
      
    );
  }

  List<NavigationRailDestination> _buildDestinations() {
    return [
      NavigationRailDestination(
        icon: Icon(Icons.note_alt),
        selectedIcon: Icon(Icons.note_alt_outlined),
        label: Text('Reservation'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.table_bar),
        selectedIcon: Icon(Icons.book),
        label: Text('Table Services'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.menu),
        selectedIcon: Icon(Icons.star),
        label: Text('Menu'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.delivery_dining),
        selectedIcon: Icon(Icons.star),
        label: Text('Delivery'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.account_balance),
        selectedIcon: Icon(Icons.star),
        label: Text('Accounting'),
      ),
    ];
  }
}
