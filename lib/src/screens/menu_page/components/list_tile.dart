import 'package:flutter/material.dart';
import 'package:homes/config/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuListItems extends StatelessWidget {
  final String iconPath;
  final String itemName;
  final VoidCallback function;

  const MenuListItems({
    Key? key,
    required this.iconPath,
    required this.itemName,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0), // Adjusted padding
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24, // Smaller icon size
              height: 24, // Smaller icon size
            ),
            SizedBox(
              width: getProportionateScreenWidth(20), // Adjusted spacing
            ),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 22, // Slightly smaller font size
                fontWeight: FontWeight.w400, // Slightly lighter font weight
              ),
            ),
          ],
        ),
      ),
    );
  }
}
