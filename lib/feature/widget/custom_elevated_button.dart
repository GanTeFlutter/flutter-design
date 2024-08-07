import 'package:flutter/material.dart';
import 'package:travel_app_design/product/constant/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // Butonun yüksekliği
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ApplicationColors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onPressed,
        child: Center(
          child: Text(
            'Explore Now',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ApplicationColors.beyaz, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
