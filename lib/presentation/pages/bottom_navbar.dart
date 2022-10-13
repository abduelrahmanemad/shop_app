import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shop_app/presentation/pages/cart_page.dart';
import 'package:shop_app/presentation/pages/favorites_page.dart';
import 'package:shop_app/presentation/pages/home_page.dart';
import 'package:shop_app/presentation/pages/profile_page.dart';
import 'package:shop_app/presentation/pages/shop_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final _controller = PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const ShopPage(),
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage()
    ];
  }

  PersistentBottomNavBarItem persistentBottomNavBarItem(Icon icon,String title,) => PersistentBottomNavBarItem(
    icon: icon,
    title: title,
    activeColorPrimary: CupertinoColors.destructiveRed,
    inactiveColorPrimary: CupertinoColors.systemGrey,
  );

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      persistentBottomNavBarItem(const Icon(CupertinoIcons.home), "Home"),
      persistentBottomNavBarItem(const Icon(CupertinoIcons.bag), "Shop"),
      persistentBottomNavBarItem(const Icon(CupertinoIcons.cart), "Cart"),
      persistentBottomNavBarItem(const Icon(Icons.favorite_border), "Favorites"),
      persistentBottomNavBarItem(const Icon(CupertinoIcons.profile_circled), "Profile"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarStyle: NavBarStyle.style11,
      )
    );
  }
}
