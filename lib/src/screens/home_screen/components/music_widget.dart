import 'package:homes/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicWidget extends StatelessWidget {
  const MusicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(12),
        vertical: getProportionateScreenHeight(8),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        gradient: const LinearGradient(
          colors: [Colors.white, Colors.grey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(60),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/svg/music.svg',
                color: Colors.black,
                width: 24,
                height: 24,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kuchh is tarah',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Atif Aslam',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/svg/prev.svg',
                color: Colors.black,
                width: getProportionateScreenWidth(20),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                'assets/icons/svg/play.svg',
                color: Colors.black,
                width: getProportionateScreenWidth(24),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset(
                'assets/icons/svg/next.svg',
                color: Colors.black,
                width: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
