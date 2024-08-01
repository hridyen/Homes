import 'package:homes/config/size_config.dart';
import 'package:homes/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

class WeatherContainer extends StatelessWidget {
  const WeatherContainer({Key? key, required this.model}) : super(key: key);

  final HomeScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            gradient: LinearGradient(
              colors: [Colors.white, Colors.grey.shade200],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '24°C',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Thunderstorm',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      '28 July 2024',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      'Zirakpur, Punjab',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/weather/0.png',
                  height: getProportionateScreenHeight(100),
                  width: getProportionateScreenWidth(120),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: getProportionateScreenWidth(10),
          top: getProportionateScreenHeight(10),
          child: Container(
            height: getProportionateScreenHeight(30),
            width: getProportionateScreenWidth(30),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.cloud,
              color: Colors.black,
              size: getProportionateScreenHeight(20),
            ),
          ),
        ),
      ],
    );
  }
}
