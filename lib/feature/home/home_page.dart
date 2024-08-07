import 'package:flutter/material.dart';
import 'package:travel_app_design/feature/widget/card.dart';
import 'package:travel_app_design/feature/widget/card_yatay.dart';
import 'package:travel_app_design/product/constant/colors.dart';
import 'package:travel_app_design/product/constant/strings.dart';

import '../widget/custom_textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint('Seçilen index: $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customSizedBoxHeight(0.04),
              //başlık ve konum
              header(context),
              customSizedBoxHeight(ekranClasicPadding),
              //ikinci başlık
              headerikiText(context),
              customSizedBoxHeight(ekranClasicPadding),
              //arama kutusu
              CustomTextfield(controller: controller),
              customSizedBoxHeight(ekranClasicPadding),
              //ikonlar
              tabBar(),
              customSizedBoxHeight(ekranClasicPadding),
              //tabBar altındaki yazılar
              centerTextSeeAll(context),
              customSizedBoxHeight(ekranClasicPadding),
              // üst kart
              listViewTOP(),
              mainKatagoriText(context, text: 'Recommended'),
              // alt kart
              listviewButtom(),
              const SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox listviewButtom() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.23,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return const CardYatay();
        },
      ),
    );
  }

  SizedBox listViewTOP() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Cardbir(),
          );
        },
      ),
    );
  }

  Row centerTextSeeAll(BuildContext context) {
    return Row(
      children: [
        mainKatagoriText(context, text: 'Popular'),
        const Spacer(),
        GestureDetector(
          onTap: () {
            debugPrint('GESTURE DETECTOR-----');
          },
          child: const Row(
            children: [
              Text(
                'See all',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
        )
      ],
    );
  }

  TabBar tabBar() {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent,
      // Seçili tabın etrafında custom container hareketi için indicator kullanılıyor
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(40), // Yuvarlak köşeler

        border: Border.all(
          color: Colors.grey, // Dış sınır rengi
          width: 2,
        ),
      ),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      controller: _tabController,
      onTap: (value) {
        debugPrint('Tapped $value');
        debugPrint('Tapped ${_tabController.index}');
      },
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      labelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      labelPadding: const EdgeInsets.only(right: 20),
      indicatorPadding: EdgeInsets.zero,
      tabs: [
        tabsTextContainer(ApplicationStrings.location),
        tabsTextContainer(ApplicationStrings.hotels),
        tabsTextContainer(ApplicationStrings.food),
        tabsTextContainer(ApplicationStrings.adventure),
        tabsTextContainer(ApplicationStrings.culture),
        tabsTextContainer(ApplicationStrings.shopping),
      ],
      indicatorColor: Colors.transparent,
    );
  }

  double get ekranClasicPadding => 0.015;

  Text headerikiText(BuildContext context) {
    return Text(
      ApplicationStrings.aspen,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontWeight: FontWeight.w400),
    );
  }

  SizedBox customSizedBoxHeight(double height) =>
      SizedBox(height: height * MediaQuery.of(context).size.height);

  Row header(BuildContext context) {
    return Row(
      children: [
        Text(
          ApplicationStrings.explore,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: ApplicationColors.grey2),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh_outlined,
                    color: ApplicationColors.blue,
                    size: 16,
                  )),
              const Icon(
                size: 13,
                Icons.location_on_outlined,
                color: ApplicationColors.blue,
              ),
              Text(
                ApplicationStrings.aspenusa,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: ApplicationColors.grey),
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: ApplicationColors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }

  Text mainKatagoriText(BuildContext context, {String? text}) {
    return Text(
      text ?? ApplicationStrings.nulcheekMainCategories,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: ApplicationColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    );
  }

  SizedBox tabsTextContainer(String text) {
    return SizedBox(
      width: 90,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(child: Text(text)),
      ),
    );
  }
}
