import 'package:homes/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteTile extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;
  final String device;
  final String deviceCount;
  final bool itsOn;
  final VoidCallback switchButton;
  final bool isFav;
  final VoidCallback switchFav;

  const FavouriteTile({
    Key? key,
    required this.iconAsset,
    required this.onTap,
    required this.device,
    required this.deviceCount,
    required this.itsOn,
    required this.switchButton,
    required this.isFav,
    required this.switchFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0, // No elevation on Material
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        width: getProportionateScreenWidth(200),
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: itsOn ? Color(0xFF333333) : const Color(0xfff5f5f5), // Change container color based on `itsOn`
          boxShadow: [
            BoxShadow(
              color: itsOn ? Colors.amber.withOpacity(0.3) : Colors.black.withOpacity(0.1),
              blurRadius: 10, // Softer shadow with a larger blur radius
              spreadRadius: 2, // Slightly spread out the shadow
              offset: const Offset(0, 4), // Shadow offset
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(10)), // Added top padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: itsOn ? Colors.white : const Color(0xffe0e0e0), // Change icon background color based on `itsOn`
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: itsOn ? Colors.amber.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                          blurRadius: 6, // Softer shadow with a smaller blur radius
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        iconAsset,
                        color: itsOn ? Colors.amber : const Color(0xFF808080),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Expanded(
                    child: Text(
                      device,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: itsOn ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: switchButton,
                    child: Container(
                      width: 48,
                      height: 25.6,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: itsOn ? Colors.green : Colors.grey,
                        border: Border.all(
                          color: itsOn ? Colors.green : Colors.grey,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: itsOn ? Colors.green.withOpacity(0.3) : Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          itsOn ? const Spacer() : const SizedBox(),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              deviceCount,
              style: TextStyle(
                color: itsOn ? Colors.white70 : Color(0xFF9e9e9e),
                fontSize: 13,
                height: 1.6,
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itsOn ? 'On' : 'Off',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: itsOn ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), // Reduced padding for the "Room" text
                  height: 25,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Room",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
