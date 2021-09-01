import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/cart_controller.dart';
import 'package:bazar/models/product.dart';
import 'package:bazar/views/screens/delivery_status/delivery_status_screen.dart';
import 'package:bazar/views/screens/order_finished/order_finished_screen.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:bazar/views/widgets/title_with_notify_no.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  TextEditingController codeInputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [appBarNotificationBtn()],
        isBackBtn: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildShippingAddressRow(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Payment Method',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildPaymentMethodRow(),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    'Items',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '5',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildGetBuilderCartProducts(),
            _buildOrderRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodRow() {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 10.0,
          bottom: 20.0,
          left: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.payment_outlined,
                  color: kPrimaryColor,
                  size: 30,
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                Text(
                  'Master Card **49',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingAddressRow() {
    return Card(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 10.0,
          bottom: 20.0,
          left: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gazientep',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: getProportionateScreenWidth(18),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'No 123, Sub Street',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Main Street',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'City Name, Prvince, Country',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  height: getProportionateScreenHeight(25),
                  width: getProportionateScreenWidth(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
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
      ),
    );
  }
}

Widget _buildOrderRow() {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.all(10.0),
    // height: SizeConfig.screenHeight / 8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
              onPressed: () => Get.offAll(const OrderFinishedScreen()),
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                side: const BorderSide(
                  width: 2.0,
                  color: kPrimaryColor,
                ),
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(150),
                child: const Text(
                  'Piace Order',
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
              height: SizeConfig.screenHeight / 3.3,
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                physics: const ScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Product product = snapshot.data![index];
                  return _buildProductListItem(product);
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }

          // By default, show a loading spinner.
          return SizedBox(
            height: SizeConfig.screenHeight / 3.5,
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
                      borderRadius: BorderRadius.all(Radius.circular(5)),
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
                              value: loadingProgress.expectedTotalBytes != null
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
                                      fontSize: getProportionateScreenWidth(10),
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
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
