import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ini buat dipakai untuk mengatur skala layar di Flutter biar UI-nya responsif di 
    // berbagai ukuran perangkat (nyambung sama yang config)
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}