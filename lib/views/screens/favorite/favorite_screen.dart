import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/favorite_controller.dart';
import 'package:bazar/controllers/search_controller.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: Text(
          'Favorite',
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(30),
          ),
        ),
        actions: [],
        isBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          child: Column(
            children: <Widget>[
              _buildSearchProductResult(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchProductResult() {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller) {
        return FutureBuilder<List<Product>>(
          future: controller.fetchFavoriteProducts(),
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
                    // final Product parameters = product;
                    return Card(
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
                                          Icons.delete_outline_rounded,
                                          color: Colors.white,
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
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              BorderRadiusDirectional.circular(
                                                  5)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size:
                                                getProportionateScreenWidth(12),
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
