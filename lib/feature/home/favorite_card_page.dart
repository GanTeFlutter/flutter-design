import 'package:flutter/material.dart';
import 'package:travel_app_design/feature/widget/card.dart';
import 'package:travel_app_design/product/constant/colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<String> items = List.generate(6, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: headerText(context),
      ),
      body: Column(
        children: [
          Expanded(child: gridView()),
        ],
      ),
    );
  }

  GridView gridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Her satırda 3 kart
        crossAxisSpacing: 8.0, // Kartlar arasındaki yatay boşluk
        mainAxisSpacing: 8.0, // Kartlar arasındaki dikey boşluk
        childAspectRatio: 2 / 3, // Kartların genişlik-yükseklik oranı
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return const Cardbir();
      },
      padding: const EdgeInsets.all(8.0),
    );
  }

  Text headerText(BuildContext context) {
    return Text('Favorite Cities',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: ApplicationColors.blue));
  }
}
