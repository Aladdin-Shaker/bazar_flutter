import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/search_controller.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: Container(
          color: Colors.blueAccent[50],
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(40),
          transformAlignment: Alignment.center,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              filled: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.close,
                    size: getProportionateScreenWidth(15),
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onChanged: (value) {},
            // maxLength: 50,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                Container(
                  padding: const EdgeInsets.all(5),
                  height: SizeConfig.screenHeight / 1.2,
                  width: SizeConfig.screenWidth,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Divider(
                          color: kGrayColor,
                          thickness: 5,
                          indent: getProportionateScreenWidth(150),
                          endIndent: getProportionateScreenWidth(150),
                          height: 25,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Filter',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          focusColor: kPrimaryColor,
                          child: Text(
                            'Clear',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: getProportionateScreenWidth(15),
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Category',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('Mens Apperal'),
                        trailing: Checkbox(
                          value: true,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Brans',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('All brands'),
                        trailing: Checkbox(
                          value: true,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Size',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('Larg'),
                        trailing: Checkbox(
                          value: false,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Price Range',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('\$0-\$200'),
                        trailing: Checkbox(
                          value: true,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Condition',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('Brand New'),
                        trailing: Checkbox(
                          value: true,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ListTile(
                        title: Text(
                          'Material',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: getProportionateScreenWidth(16),
                          ),
                        ),
                        dense: true,
                        subtitle: const Text('Leather'),
                        trailing: Checkbox(
                          value: false,
                          fillColor:
                              MaterialStateProperty.all<Color>(kGrayColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          onChanged: (bool? newValue) {},
                        ),
                      ),
                      const Divider(
                        color: kGrayColor,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(
                            getProportionateScreenWidth(300),
                            getProportionateScreenHeight(40),
                          ),
                          shadowColor: Colors.black,
                          onPrimary: Colors.white,
                          primary: kPrimaryColor,
                        ),
                        child: const Text('Apply Filter'),
                      )
                    ],
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                enterBottomSheetDuration: const Duration(milliseconds: 400),
                exitBottomSheetDuration: const Duration(microseconds: 200),
                backgroundColor: Colors.white,
                isScrollControlled: true,
                ignoreSafeArea: false,
                enableDrag: true,
                isDismissible: true,
                persistent: true,
                useRootNavigator: true,
              );
            },
            icon: Icon(
              Icons.filter_alt_outlined,
              color: kGrayColor,
              size: getProportionateScreenWidth(35),
            ),
          ),
        ],
        isBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          child: Column(
            children: <Widget>[
              _buildTopFilterRow(),
              SizedBox(height: getProportionateScreenHeight(25)),
              _buildSearchProductResult(),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTopFilterRow() {
    return Container(
      color: Colors.blueGrey[50],
      height: SizeConfig.screenHeight / 16,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Best Match',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              const Text(
                'Recommended',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              const Text(
                'Price Low-High',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
              const Text(
                'Offers',
                style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(15)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchProductResult() {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) {
        return FutureBuilder<List<Product>>(
          future: controller.fetchAllProducts.call(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  addRepaintBoundaries: false,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  addAutomaticKeepAlives: false,
                  itemCount: snapshot.data!.length,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final Product product = snapshot.data![index];
                    final Product parameters = product;
                    return InkWell(
                      splashColor: kPrimaryColor,
                      highlightColor: kPrimaryColor,
                      autofocus: true,
                      onTap: () => Get.toNamed(
                        singleProductViewRoute,
                        arguments: parameters,
                      ),
                      child: Card(
                        semanticContainer: false,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Hero(
                                      tag: index,
                                      transitionOnUserGestures: true,
                                      child: Image.network(
                                        product.imageUrl,
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
                                    ),
                                    if (product.isFavorite)
                                      Positioned(
                                        right: 1,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.white,
                                            size:
                                                getProportionateScreenWidth(25),
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
                                            size:
                                                getProportionateScreenWidth(25),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          fontFamily: 'Poppins-Light',
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              getProportionateScreenWidth(15),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height: getProportionateScreenHeight(10)),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '\$${product.price}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(
                                            getProportionateScreenWidth(3)),
                                        decoration: BoxDecoration(
                                            color: kPrimaryColor,
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(5)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: getProportionateScreenWidth(
                                                  12),
                                            ),
                                            Text(
                                              '${product.star}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        10),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }

            // By default, show a loading spinner.
            return SizedBox(
              height: SizeConfig.screenHeight / 1.7,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
