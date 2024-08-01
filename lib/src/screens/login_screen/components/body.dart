import 'package:homes/config/size_config.dart';
import 'package:homes/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
	const Body({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				Stack(
					children: [
						Image.asset(
							'assets/images/login.png',
							height: getProportionateScreenHeight(300),
							width: double.infinity,
							fit: BoxFit.cover,
						),
						Positioned(
							bottom: getProportionateScreenHeight(20),
							left: getProportionateScreenWidth(20),
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: [
									Text(
										'SMART',
										style: Theme.of(context).textTheme.headlineMedium!.copyWith(
											color: Colors.black,
											fontSize: 33,
										),
									),
									Text(
										'HOMES',
										style: Theme.of(context).textTheme.displayLarge!.copyWith(
											color: Colors.black,
											fontSize: 64,
										),
									),
								],
							),
						),
					],
				),
				const Padding(
					padding: EdgeInsets.all(20.0),
					child: Text(
						'Sign-in \nmanage your device & accessory',
						style: TextStyle(fontSize: 18, color: Colors.black54),
					),
				),
				Padding(
					padding: const EdgeInsets.symmetric(horizontal: 20.0),
					child: TextField(
						decoration: InputDecoration(
							contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
							border: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
							),
							hintText: 'Email',
							suffixIcon: const Icon(
								Icons.email,
								color: Colors.black,
							),
							filled: true,
							fillColor: Colors.grey[200],
							focusedBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
							),
							enabledBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
							),
							errorBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
							),
						),
					),
				),
				SizedBox(height: getProportionateScreenHeight(20)),
				Padding(
					padding: const EdgeInsets.symmetric(horizontal: 20.0),
					child: TextField(
						obscureText: true,
						decoration: InputDecoration(
							contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
							border: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
							),
							hintText: 'Password',
							suffixIcon: const Icon(
								Icons.lock,
								color: Colors.black,
							),
							filled: true,
							fillColor: Colors.grey[200],
							focusedBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
							),
							enabledBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
							),
							errorBorder: OutlineInputBorder(
								borderRadius: BorderRadius.circular(70.0),
								borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
							),
						),
					),
				),
				SizedBox(height: getProportionateScreenHeight(20)),
				Padding(
					padding: const EdgeInsets.symmetric(horizontal: 20.0),
					child: GestureDetector(
						onTap: () {
							Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
						},
						child: Container(
							width: double.infinity,
							padding: const EdgeInsets.all(16.0),
							decoration: BoxDecoration(
								color: Colors.blueAccent,
								borderRadius: BorderRadius.circular(70.0),
								boxShadow: [
									BoxShadow(
										color: Colors.black.withOpacity(0.3),
										blurRadius: 8.0,
										offset: const Offset(0, 4),
									),
								],
							),
							child: const Text(
								'Get Started',
								style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
								textAlign: TextAlign.center,
							),
						),
					),
				),
				SizedBox(height: getProportionateScreenHeight(10)),
				Center(
					child: GestureDetector(
						onTap: () {
							// Add action for "Don't have an account yet?" link
						},
						child: const Text(
							'Don\'t have an account yet?',
							style: TextStyle(color: Colors.blueAccent),
						),
					),
				),
			],
		);
	}
}
