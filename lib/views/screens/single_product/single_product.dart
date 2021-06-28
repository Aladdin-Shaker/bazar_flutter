import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/product_controller.dart';
import 'package:bazar/views/screens/single_product/nested_tab_products.dart';
import 'package:bazar/views/widgets/appbar_cart_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleProductScreen extends GetWidget<ProductController> {
  SingleProductScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments;
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppbar(
        title: const SizedBox.shrink(),
        actions: [appBarCartBtn()],
        isBackBtn: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            _buildProductSlider(product),
            const SizedBox(height: 20),
            _buildProductInfo(product),
          ],
        ),
      ),
    );
  }

  Widget _buildProductInfo(product) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
            Row(
              children: [
                Row(
                  children: _buildStarRating(product.star.round() as int),
                ),
                SizedBox(width: getProportionateScreenWidth(5)),
                Text(
                  '${product.star}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(16),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${product.title} (Men)',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: getProportionateScreenWidth(18),
              ),
            ),
            Row(
              children: const [
                Text(
                  '20 Sold',
                  style: TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
                Text(' | '),
                Text(
                  'in stock',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 2.0),
        const NestedTabBar(),
      ],
    );
  }

  List<Widget> _buildStarRating(int rating) {
    final List<Widget> stars = [];

    for (var i = 0; i < rating; i++) {
      stars.add(const Icon(
        Icons.star,
        color: kPrimaryColor,
      ));
    }

    if (stars.length < 5) {
      stars.add(
        const Icon(
          Icons.star,
          color: kGrayColor,
        ),
      );
    }
    return stars;
  }

  Widget _buildProductSlider(product) {
    final List<String> data = [
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Fa2.datacaciques.com%2F17%2F01%2F18%2F2099q9579cv015c0%2Fe31c62f1a809c516.jpg&f=1&nofb=1",
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fs3-ap-southeast-1.amazonaws.com%2Fa2.datacaciques.com%2F17%2F01%2F18%2F2099q9579cv015c0%2Fe31c62f1a809c516.jpg&f=1&nofb=1",
    ];
    return SizedBox(
      height: 240.0,
      child: PageView.builder(
        onPageChanged: (value) {
          debugPrint('singleProduct onPageChanged value => $value');
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Hero(
                tag: index,
                transitionOnUserGestures: true,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        '${product.imageUrl}',
                      ),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: kPrimaryColor,
                      size: getProportionateScreenWidth(25),
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: kPrimaryColor,
                      size: getProportionateScreenWidth(25),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  data.length,
                  (i) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == i ? kPrimaryColor : Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
