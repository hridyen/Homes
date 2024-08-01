import 'package:flutter/material.dart';
import 'package:homes/src/screens/favourites_screen/components/favourite_tile.dart';
import 'package:homes/src/screens/smart_ac/smart_ac.dart';
import 'package:homes/src/screens/smart_fan/smart_fan.dart';
import 'package:homes/src/screens/smart_light/smart_light.dart';
import 'package:homes/src/screens/smart_speaker/smart_speaker.dart';
import 'package:homes/view/home_screen_view_model.dart';
import 'package:homes/src/screens/favourites_screen/components/body.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key, required this.model}) : super(key: key);
  final HomeScreenViewModel model;

  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<FavouriteTile> favs = <FavouriteTile>[];

  @override
  void initState() {
    super.initState();
    formList();
  }

  void formList() {
    favs.clear();
    if (widget.model.isLightFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isLightOn,
          switchFav: widget.model.lightFav,
          switchButton: widget.model.lightSwitch,
          onTap: () {
            Navigator.of(context).pushNamed(SmartLight.routeName);
          },
          iconAsset: 'assets/icons/svg/light.svg',
          device: 'Light',
          deviceCount: '4 lamps',
          isFav: widget.model.isLightFav,
        ),
      );
    }
    if (widget.model.isFanFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isFanON,
          switchButton: widget.model.fanSwitch,
          switchFav: widget.model.fanFav,
          onTap: () {
            Navigator.of(context).pushNamed(SmartFan.routeName);
          },
          iconAsset: 'assets/icons/svg/fan.svg',
          device: 'Fan',
          deviceCount: '2 devices',
          isFav: widget.model.isFanFav,
        ),
      );
    }
    if (widget.model.isACFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isACON,
          switchButton: widget.model.acSwitch,
          onTap: () {
            Navigator.of(context).pushNamed(SmartAC.routeName);
          },
          iconAsset: 'assets/icons/svg/ac.svg',
          device: 'AC',
          deviceCount: '4 devices',
          isFav: widget.model.isACFav,
          switchFav: widget.model.acFav,
        ),
      );
    }
    if (widget.model.isSpeakerFav) {
      favs.add(
        FavouriteTile(
          itsOn: widget.model.isSpeakerON,
          switchButton: widget.model.speakerSwitch,
          switchFav: widget.model.speakerFav,
          onTap: () {
            Navigator.of(context).pushNamed(SmartSpeaker.routeName);
          },
          iconAsset: 'assets/icons/svg/speaker.svg',
          device: 'Speaker',
          deviceCount: '1 device',
          isFav: widget.model.isSpeakerFav,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return favs.isEmpty
        ? const Body()
        : Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: ListView.builder(
        itemCount: favs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: favs[index],
            ),
          );
        },
      ),
    );
  }
}
