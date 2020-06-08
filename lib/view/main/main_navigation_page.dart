import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/values/app_colors.dart';

class MainPageDestination {
  final int index;
  final String title;
  final Widget body;
  final IconData icon;

  MainPageDestination(this.index, this.title, this.body, this.icon);
}

List<MainPageDestination> mainPageDestination = [
  MainPageDestination(0, "Discover", Center(child: Text("Discover")), Icons.dashboard),
  MainPageDestination(1, "Library", Center(child: Text("Library")), Icons.library_books),
  MainPageDestination(2, "Search", Center(child: Text("Search")), Icons.search),
  MainPageDestination(3, "Account", Center(child: Text("Account")), Icons.account_box),
];

class MainNavigationPage extends StatefulWidget {
  static MaterialPageRoute pageRoute() => MaterialPageRoute(
      builder: (BuildContext context) => MainNavigationPage());

  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mainPageDestination[_currentIndex].body,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: AppColors.silverDark,
        currentIndex: _currentIndex,
        items: mainPageDestination
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                title: Text(item.title),
              ),
            )
            .toList(),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        });
  }
}
