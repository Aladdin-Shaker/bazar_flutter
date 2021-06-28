import 'dart:ui';
import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/home_controller.dart';
import 'package:bazar/models/category.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:bazar/views/widgets/custom_cart_title.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _homeKey =
      GlobalKey<FormState>(debugLabel: '_homeScreenkey');
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _homeKey,
      backgroundColor: kTextLigntColor,
      appBar: customAppbar(
        title: const Text(
          'Home',
          style: TextStyle(color: kPrimaryColor),
        ),
        isBackBtn: false,
        actions: [appBarNotificationBtn()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customCartTitle(
                    title: "New Arrival", titleSize: 20, press: null),
                SizedBox(height: getProportionateScreenHeight(20)),
                _buildNewArrivalList(),
                SizedBox(height: getProportionateScreenHeight(20)),
                customCartTitle(
                    title: "Exclusive Products",
                    titleSize: 20,
                    press: () => {}),
                SizedBox(height: getProportionateScreenHeight(10)),
                _buildListProductsCard(),
                SizedBox(height: getProportionateScreenHeight(10)),
                customCartTitle(
                    title: "Categories",
                    titleSize: 20,
                    press: () => Get.toNamed(categoriesViewRoute)),
                SizedBox(height: getProportionateScreenHeight(10)),
                _buildListCategories()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListProductsCard() {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.all(5),
          height: getProportionateScreenHeight(220),
          child: FutureBuilder<List<Product?>>(
            future: HomeController.futureProducts.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final Product? product = snapshot.data?[index];
                    return Card(
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: getProportionateScreenWidth(160),
                              // height: getProportionateScreenHeight(220),
                              child: Stack(
                                children: [
                                  Image.network(
                                    product!.imageUrl,
                                    width: getProportionateScreenWidth(160),
                                    height: getProportionateScreenHeight(220),
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  if (product.isFavorite)
                                    Positioned(
                                      right: 1,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: kPrimaryColor,
                                          size: getProportionateScreenWidth(25),
                                        ),
                                      ),
                                    )
                                  else
                                    Positioned(
                                      right: 1,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite,
                                          color: kPrimaryColor,
                                          size: getProportionateScreenWidth(25),
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$${product.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: getProportionateScreenWidth(16),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Text(
                                  '\$${product.oldPrice}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: getProportionateScreenWidth(14),
                                    decoration: TextDecoration.lineThrough,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(8)),
                            child: Row(
                              children: [
                                Text(
                                  product.title,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Light',
                                    fontWeight: FontWeight.w700,
                                    fontSize: getProportionateScreenWidth(15),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(3)),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(5)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: getProportionateScreenWidth(14),
                                      ),
                                      Text(
                                        '${product.star}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize:
                                              getProportionateScreenWidth(10),
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => debugPrint('tapped !'),
                                child: Container(
                                  width: getProportionateScreenWidth(160),
                                  height: getProportionateScreenWidth(30),
                                  decoration: const BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5))),
                                  child: const Center(
                                    child: Text(
                                      'Add To Cart',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              }

              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }

  Widget _buildNewArrivalList() {
    return Column(
      children: [
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return FutureBuilder<List<Product?>>(
              future: HomeController.newArrivalProducts.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: getProportionateScreenHeight(140),
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final Product? arrival = snapshot.data![index];
                        return Container(
                          width: getProportionateScreenWidth(220),
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(10)),
                          margin:
                              EdgeInsets.all(getProportionateScreenWidth(5)),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                arrival!.imageUrl,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    ),
                                  );
                                },
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                arrival.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: getProportionateScreenHeight(22),
                                ),
                              ),
                              Positioned(
                                top: getProportionateScreenHeight(60),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () => {},
                                  child: const Text(
                                    'See More',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }

                return const Center(child: CircularProgressIndicator());
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildListCategories() {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(100),
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return FutureBuilder<List<Categories?>>(
              future: HomeController.futureCategories.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final Categories? cat = snapshot.data![index];
                      return Container(
                        margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                        width: getProportionateScreenWidth(90),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              cat!.icon,
                              color: kPrimaryColor,
                              size: getProportionateScreenWidth(30),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Text(
                              cat.title,
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontFamily: 'Poppins-Thin',
                                fontSize: getProportionateScreenWidth(15),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }

                return const Center(child: CircularProgressIndicator());
              },
            );
          }),
    );
  }
}
