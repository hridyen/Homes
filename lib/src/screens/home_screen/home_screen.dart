import 'package:homes/config/size_config.dart';
import 'package:homes/provider/base_view.dart';
import 'package:homes/src/screens/edit_profile/edit_profile.dart';
import 'package:homes/src/screens/favourites_screen/favourites_screen.dart';
import 'package:homes/src/widgets/custom_bottom_nav_bar.dart';
import 'package:homes/view/home_screen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/body.dart';
import 'package:homes/src/screens/menu_page/menu_screen.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
      onModelReady: (model) => model.generateRandomNumber(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: getProportionateScreenHeight(60),
              elevation: 0,
              backgroundColor: Colors.blueAccent, // Smart home app color
              iconTheme: const IconThemeData(color: Colors.white),
              title: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(4),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Hi, Hridyen',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white, // White background for better contrast
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              splashRadius: 20,
                              iconSize: 20,
                              icon: const Icon(
                                FontAwesomeIcons.solidUser,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5)),
                        Container(
                          width: 35,
                          height: 35,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: IconButton(
                              splashRadius: 20,
                              iconSize: 20,
                              icon: const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Favourites(model: model)));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.7),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Text(
                        'Living Room',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Dining',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Kitchen',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(
                  getProportionateScreenHeight(35),
                ),
              ),
            ),
            drawer: SizedBox(
              width: getProportionateScreenWidth(270),
              child: const Menu(),
            ),
            body: TabBarView(
              children: <Widget>[
                Body(model: model),
                Center(
                  child: Text(
                    'To be Built Soon',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const Center(
                  child: Text('Under Construction'),
                ),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(model: model),
          ),
        );
      },
    );
  }
}
