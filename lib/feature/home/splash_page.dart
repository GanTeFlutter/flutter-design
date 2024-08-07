import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_design/feature/home/bottom_navigation_bar.dart';
import 'package:travel_app_design/feature/home/home_page.dart';
import 'package:travel_app_design/feature/widget/custom_elevated_button.dart';
import 'package:travel_app_design/product/constant/colors.dart';
import 'package:travel_app_design/product/constant/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageRouteBuilder _createSlideTransitionRoute(Widget page) {
    debugPrint("kod calisti _createSlideTransitionRoute");
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            'assets/app_backround.png',
            fit: BoxFit.fill,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    topText(),
                    const Spacer(),
                    richText(),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return const HomePage();
                        //   },
                        // ));
                        Navigator.push(
                          context,
                          _createSlideTransitionRoute(
                              const BottomNavigationBarScreen()),
                        );
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Align richText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text.rich(TextSpan(
        text: ApplicationStrings.planyour,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          color: ApplicationColors.beyaz,
        ),
        children: [
          TextSpan(
            text: ApplicationStrings.luxurious,
            style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: ApplicationColors.beyaz,
                fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: ApplicationStrings.vacation,
            style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: ApplicationColors.beyaz,
                fontWeight: FontWeight.w500),
          ),
        ],
      )),
    );
  }

  Text topText() {
    return Text(
      ApplicationStrings.areyouready,
      style: GoogleFonts.dancingScript(
        fontSize: 60,
        color: ApplicationColors.beyaz,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  TextSpan textSpanButtom() {
    return TextSpan(
      text: ApplicationStrings.planyour,
      style: GoogleFonts.montserrat(
        fontSize: 25,
        color: ApplicationColors.beyaz,
      ),
      children: [
        TextSpan(
          text: ApplicationStrings.luxurious,
          style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: ApplicationColors.beyaz,
              fontWeight: FontWeight.w600),
        ),
        TextSpan(
          text: ApplicationStrings.vacation,
          style: GoogleFonts.poppins(
              fontSize: fontSize,
              color: ApplicationColors.beyaz,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  double get fontSize => 30;
}
