import 'dart:math';
import 'package:flutter/material.dart';

class Cardbir extends StatefulWidget {
  const Cardbir({super.key});

  @override
  State<Cardbir> createState() => _CardbirState();
}

class _CardbirState extends State<Cardbir> {
  final List<String> imagePaths = [
    'assets/travel1.jpg',
    'assets/travel2.jpg',
    'assets/travel3.jpg',
    'assets/travel4.jpg',
    'assets/travel5.jpg',
    'assets/travel6.jpg',
    'assets/travel7.jpg',
    'assets/travel8.jpg',
    'assets/travel9.jpg',
    'assets/travel10.jpg',
    'assets/travel11.jpg',
    'assets/travel12.jpg',
    'assets/travel13.jpg',
    'assets/travel14.jpg',
    'assets/travel15.jpg',
    'assets/travel16.jpg',
    'assets/travel17.jpg',
    'assets/travel18.jpg',
    'assets/travel19.jpg',
    'assets/travel20.jpg',
    'assets/travel21.jpg',
    'assets/travel22.jpg',
    'assets/travel23.jpg',
    'assets/travel24.jpg',
    'assets/travel25.jpg',
  ];
  final List<String> randomImagePuanList = [
    '4.1',
    '7.2',
    '5.5',
    '6.8',
    '3.9',
    '8.7',
    '4.6',
    '9.1',
    '2.8',
    '7.4',
    '6.2',
    '5.0',
    '8.3',
    '4.9',
    '9.5',
    '3.6',
    '7.8',
    '6.0',
    '8.1',
    '2.7'
  ];
  final List<String> beautifulPlaces = [
    "Machu Picchu",
    "Great Barrier Reef",
    "Santorini",
    "Bora Bora",
    "Banff",
    "Grand Canyon",
    "Blue Lagoon",
    "Petra",
    "Venice",
    "Maldives",
    "Great Wall",
    "Bali",
    "Victoria Falls",
    "Mount Fuji",
    "Patagonia",
    "Kyoto",
    "Galápagos",
    "South Island",
    "Dubai",
    "Maui",
    "Taj Mahal",
    "Swiss Alps",
    "Istanbul",
    "Cinque Terre",
    "Antelope Canyon",
    "Serengeti",
    "Plitvice Lakes",
    "Giza Pyramids",
    "Phi Phi Islands",
    "Amsterdam",
  ];

  late String randomImagePath;
  late String randomImagePuanPath;
  late String randomImageBeautifulPlaces;

  @override
  void initState() {
    super.initState();
    randomImagePath = imagePaths[getRandomNumber(imagePaths.length)];
    randomImagePuanPath =
        randomImagePuanList[getRandomNumber(randomImagePuanList.length)];
    randomImageBeautifulPlaces =
        beautifulPlaces[getRandomNumber(beautifulPlaces.length)];
  }

  int getRandomNumber(int max) {
    final random = Random();
    return random.nextInt(max); // 0 ile max-1 arasında rastgele sayı
  }

  bool beginildimi = false;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenheight * 0.30, // Sabit yükseklik
      width: 180, // Sabit genişlik
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(randomImagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              const SizedBox(width: 5),
              Container(
                decoration: widgetBackBulaniklik(),
                child: Column(
                  children: [countrey(), starANDfavorite(context)],
                ),
              ),
              const Spacer(),
              begeniicon()
            ],
          )
        ],
      ),
    );
  }

  Text countrey() {
    return Text(
      randomImageBeautifulPlaces,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
    );
  }

  BoxDecoration widgetBackBulaniklik() {
    return BoxDecoration(
      color: Colors.transparent.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3), // Gölgenin rengi ve opaklığı
          spreadRadius: 2, // Gölgenin yayılma alanı
          blurRadius: 5, // Gölgenin bulanıklığı
          offset: const Offset(0, 3), // Gölgenin konumu (x, y ekseni)
        ),
      ],
    );
  }

  Row starANDfavorite(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star_outlined, color: Colors.yellow[500], size: 17),
        const SizedBox(width: 5),
        Text(
          randomImagePuanPath,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  IconButton begeniicon() {
    return IconButton(
        onPressed: () {
          setState(() {
            beginildimi = !beginildimi;
          });
        },
        icon: beginildimi
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 17,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 17,
              ));
  }
}
