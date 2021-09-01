import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue[50],
          child: Column(
            children: [
              _buildProfileRow(),
              Container(
                color: Colors.blue[50],
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: 100,
                        color: kPrimaryColor,
                      ),
                    ),
                    _buildSettingsCard(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildSettingsCard2(),
              const SizedBox(height: 20),
              _buildLastSection(),
              const SizedBox(height: 20),
              const Center(child: Text('v01-003')),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildLastSection() {
    return GestureDetector(
      onTap: () => debugPrint('logout clicked !'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout_outlined,
            size: getProportionateScreenWidth(25),
          ),
          const SizedBox(width: 5),
          Text(
            'LOG OUT',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Center _buildSettingsCard2() {
    return Center(
      child: Container(
        height: SizeConfig.screenHeight / 2.9,
        width: SizeConfig.screenWidth / 1.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _buildAccountSettingsRow(Icons.favorite_border_outlined, 'Favorite',
                () {
              Get.toNamed(favoriteViewRoute);
              // print('asdasd');
            }),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.lock_outlined,
              'Privacy Policy',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.question_answer_outlined,
              'Frequently Asked Question',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.perm_device_information_outlined,
              'Legal Information',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.star_border_outlined,
              'Rate Our App',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Center _buildSettingsCard() {
    return Center(
      child: Container(
        height: SizeConfig.screenHeight / 2.9,
        width: SizeConfig.screenWidth / 1.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            _buildAccountSettingsRow(
              Icons.location_on_outlined,
              'Shipping Address',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.payment_outlined,
              'Payment Method',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.list_alt_outlined,
              'Order History',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.delivery_dining_outlined,
              'Delivery Status',
              () {},
            ),
            const Divider(),
            _buildAccountSettingsRow(
              Icons.language_outlined,
              'Language',
              () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountSettingsRow(
      IconData icon, String title, void Function()? press) {
    return InkWell(
      onTap: press,
      child: Row(
        children: [
          Icon(
            icon,
            color: kPrimaryColor,
            size: getProportionateScreenWidth(30),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(15),
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileRow() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        bottom: 40.0,
        left: 20.0,
      ),
      decoration: const BoxDecoration(color: kPrimaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.white,
                    child: Image.network(
                      'http://www.newsshare.in/wp-content/uploads/2017/04/Miniclip-8-Ball-Pool-Avatar-11.png',
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!.toInt()
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Aladdin Shaker',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  SizedBox(
                    width: 200,
                    child: Text(
                      '3lladdin9haker@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Container(
                height: getProportionateScreenHeight(25),
                width: getProportionateScreenWidth(25),
                decoration: BoxDecoration(
                  color: Colors.blueAccent[100],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mode_edit_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 2,
      size.height - 100,
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
