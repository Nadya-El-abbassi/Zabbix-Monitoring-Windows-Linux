import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:app/screens/About.dart';
import 'package:app/screens/Contact.dart';
import 'package:app/screens/Home.dart';
import 'package:app/screens/Favorites.dart';
class PrincipalScreen extends StatefulWidget {
  const PrincipalScreen({super.key});

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  final List<Widget> screens = [const Home(), const About(), const Contact(), const FavoritesPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.info, size: 30),
          const Icon(Icons.contact_mail, size: 30),
          const Icon(Icons.favorite, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),

      body: screens[_page],

    );
  }
}
