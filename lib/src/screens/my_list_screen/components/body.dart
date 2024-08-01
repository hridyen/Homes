import 'package:flutter/material.dart';
import 'package:homes/config/size_config.dart';
import 'package:homes/src/screens/my_list_screen/components/list_data.dart';
import 'package:homes/src/screens/my_list_screen/components/horizontal_list.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(15),
              ),
              child: Row(
                children: [
                  const Text(
                    'My List',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 30, // Slightly smaller icon
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            _buildMovieSection('Europe Movie'),
            _buildMovieSection('Romance/Drama'),
            _buildMovieSection('Action/Thriller'),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieSection(String title) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenHeight(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500, // Slightly bolder text
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(130),
              width: getProportionateScreenWidth(270),
              child: MoviesList(movies: ListData().movies),
            ),
          ],
        ),
      ),
    );
  }
}
