import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/cart_controller.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  TextEditingController codeInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          appBarNotificationBtn(),
        ],
        isBackBtn: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildGetBuilderCartProducts(),
            _buildCodeInputRow(),
            _buildDeliveryTypeRow(),
            _buildCheckoutRow()
          ],
        ),
      ),
    );
  }

  Container _buildCheckoutRow() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'TOTAL',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                '\$488.00',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(20),
                ),
              )
            ],
          ),
          Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(checkoutViewRoute);
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  side: const BorderSide(
                    width: 2.0,
                    color: kPrimaryColor,
                  ),
                ),
                child: SizedBox(
                  width: getProportionateScreenWidth(100),
                  child: const Text(
                    'Checkout',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _buildDeliveryTypeRow() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          const Text(
            '\$0.00',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          const Text(
            'Delivery Type',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            alignment: Alignment.center,
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(25),
            decoration: BoxDecoration(
                color: Colors.blue[50], borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'Normal',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCodeInputRow() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenHeight(40),
            width: SizeConfig.screenWidth / 2,
            child: TextField(
              onSubmitted: (String? val) {
                val = codeInputTextController.text.toString();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.all(5),
                border: const OutlineInputBorder(),
                hintText: 'Add promo code',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(
                width: 2.0,
                color: kPrimaryColor,
              ),
            ),
            child: const Text(
              'Apply code',
              style: TextStyle(color: kPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  GetBuilder<CartController> _buildGetBuilderCartProducts() {
    return GetBuilder<CartController>(
      init: CartController(),
      assignId: true,
      builder: (controller) {
        return FutureBuilder<List<Product>>(
          future: controller.fetchCartProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: SizeConfig.screenHeight / 2.1,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final Product product = snapshot.data![index];
                    return Dismissible(
                      key: Key(index.toString()),
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        print('item delted ');
                        Get.snackbar("Deleted", "${product.title} deleted",
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(milliseconds: 1000));
                      },
                      child: _buildProductListItem(product),
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            }

            // By default, show a loading spinner.
            return SizedBox(
              height: SizeConfig.screenHeight / 2,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProductListItem(Product product) {
    return Card(
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: getProportionateScreenWidth(120),
                      height: getProportionateScreenWidth(100),
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenWidth(100),
                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: getProportionateScreenWidth(18),
                            ),
                          ),
                          Text(
                            'Blue UK: 5.0',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(14),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(18),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(3)),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadiusDirectional.circular(5)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: getProportionateScreenWidth(12),
                                    ),
                                    Text(
                                      '${product.star}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                            getProportionateScreenWidth(10),
                                        decoration: TextDecoration.lineThrough,
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
                    const SizedBox(width: 5),
                    Container(
                      width: getProportionateScreenWidth(60),
                      height: getProportionateScreenWidth(100),
                      // color: Colors.blue,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: getProportionateScreenWidth(30),
                              height: getProportionateScreenWidth(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: getProportionateScreenWidth(30),
                            height: getProportionateScreenWidth(30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 2,
                                color: kPrimaryColor,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                '1',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: getProportionateScreenWidth(30),
                              height: getProportionateScreenWidth(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
