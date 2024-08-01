import 'package:homes/config/size_config.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key? key,
    required this.title,
    required this.icon1,
    required this.isON,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String icon1;
  final bool isON;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(110),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(12),
          vertical: getProportionateScreenHeight(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: onTap,
                  child: Container(
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenHeight(40),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        icon1,
                        width: getProportionateScreenWidth(24),
                        height: getProportionateScreenHeight(24),
                      ),
                    ),
                  ),
                ),
                Switch.adaptive(
                  inactiveThumbColor: const Color(0xFFE4E4E4),
                  inactiveTrackColor: const Color(0xFFE4E4E4),
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green.withOpacity(0.5),
                  value: isON,
                  onChanged: (value) {},
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
