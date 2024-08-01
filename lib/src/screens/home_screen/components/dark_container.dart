import 'package:homes/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DarkContainer extends StatelessWidget {
  final String iconAsset;
  final VoidCallback onTap;
  final String device;
  final String deviceCount;
  final bool itsOn;
  final VoidCallback switchButton;
  final bool isFav;
  final VoidCallback switchFav;

  const DarkContainer({
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
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(160),
        height: getProportionateScreenHeight(160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: itsOn
              ? const Color(0xFF333333) // Dark color for active state
              : const Color(0xFFF4F4F4), // Light color for inactive state
          boxShadow: [
            BoxShadow(
              color: itsOn ? Colors.amber.withOpacity(0.4) : Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(12),
            vertical: getProportionateScreenHeight(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: itsOn
                          ? const Color(0xFF555555)
                          : const Color(0xFFCFCFCF),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: itsOn ? Colors.amber.withOpacity(0.5) : Colors.black.withOpacity(0.2),
                          blurRadius: 20,
                          spreadRadius: 2,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        iconAsset,
                        color: itsOn ? Colors.amber : const Color(0xFF888888),
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: switchFav,
                    child: Icon(
                      Icons.favorite,
                      color: isFav ? Colors.red: const Color(0xFF888888),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: itsOn ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    deviceCount,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: const Color(0xFF9E9E9E),
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itsOn ? 'On' : 'Off',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: itsOn ? Colors.white : Colors.black,
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
                        color: itsOn ? Colors.green : const Color(0xFFDCDCDC),
                        border: Border.all(
                          color: itsOn ? Colors.green : Colors.transparent,
                          width: itsOn ? 2 : 0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: itsOn ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
