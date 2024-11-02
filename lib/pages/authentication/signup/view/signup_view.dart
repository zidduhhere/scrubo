import 'package:flutter/material.dart';
import 'package:scrubo/utils/constants/image_strings.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            TImages.logo,
            scale: .5,
          ),
        ],
      ),
    );
  }
}
