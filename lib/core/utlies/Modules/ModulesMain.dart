import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/featuers/home/Presentation/View/homeView1.dart';
import 'package:ican/featuers/mainLayout/Presentation/View/LayoutView.dart';
import 'package:ican/featuers/setting/Presentation/view/view.dart';

List<Widget> modulesMainScreens() {
  return [
    const LayoutView(),
    const SettingView(),
    const FavoritesScreen(),
    const ProfileScreen2(),
  ];
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Center(child: Text("Home Screen")),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: const Center(child: Text("Search Screen")),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: const Center(child: Text("Favorites Screen")),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Profile Screen")),
    );
  }
}

class ProfileScreen2 extends StatelessWidget {
  const ProfileScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Profile Screen")),
    );
  }
}
