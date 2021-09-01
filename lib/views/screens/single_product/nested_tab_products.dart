import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/search_controller.dart';
import 'package:bazar/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({
    Key? key,
  }) : super(key: key);
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;
  TextEditingController ratingInputTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nestedTabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabBar(
            controller: _nestedTabController,
            indicatorColor: kPrimaryColor,
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.black54,
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                text: "Product",
              ),
              Tab(
                text: "Details",
              ),
              Tab(
                text: "Reviews",
              ),
            ],
          ),
          GetBuilder<SearchController>(
            builder: (controller) {
              final Product product = controller.selectedProduct;
              return SizedBox(
                height: getProportionateScreenHeight(250),
                child: TabBarView(
                  controller: _nestedTabController,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        _buildSelectColor(),
                        const SizedBox(height: 10),
                        _buildSelectSize(),
                        const SizedBox(height: 10),
                        const Divider(thickness: 2.0),
                        const SizedBox(height: 12),
                        _buildBurchaseButons(product),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        _buildDetailsContent(),
                        _buildBurchaseButons(product),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            primary: true,
                            physics: const ScrollPhysics(),
                            children: <Widget>[
                              buildListTileReview(),
                              const Divider(),
                              buildListTileReview(),
                              const Divider(),
                              buildListTileReview(),
                              const Divider(),
                              buildListTileReview(),
                            ],
                          ),
                        ),
                        Container(
                          height: getProportionateScreenHeight(50),
                          alignment: Alignment.center,
                          width: SizeConfig.screenWidth,
                          decoration: const BoxDecoration(color: Colors.white),
                          child: _buildBottomSheetRating(),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildBottomSheetRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                height: SizeConfig.screenHeight / 1.6,
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
                    const SizedBox(height: 10),
                    Text(
                      'What is your rating ?',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      unratedColor: kGrayColor,
                      glowColor: kSecondaryColor,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: kPrimaryColor,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: kGrayColor,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please share your opinion \n        about the product',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        textBaseline: TextBaseline.ideographic,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: ratingInputTextController,
                      onSaved: (String? val) {
                        val = ratingInputTextController.text.toString();
                      },
                      minLines: 9,
                      maxLines: 10,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: kPrimaryColor,
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2.0,
                            color: kPrimaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                      child: const Text('Send Review'),
                    ),
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
          style: TextButton.styleFrom(
            minimumSize: Size(SizeConfig.screenWidth / 1.5, 50),
            backgroundColor: kPrimaryColor,
          ),
          child: RichText(
            text: const TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.edit_outlined,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: ' Write Review',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ListTile buildListTileReview() {
    return ListTile(
      minLeadingWidth: 30,
      enableFeedback: true,
      dense: true,
      title: const Text(
        'James William',
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Column(
        children: [
          const Text('Good Shoes I liked and comfort to use'),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.star,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(20),
              ),
              Icon(
                Icons.star,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(20),
              ),
              Icon(
                Icons.star,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(20),
              ),
              Icon(
                Icons.star,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(20),
              ),
              Icon(
                Icons.star,
                color: kPrimaryColor,
                size: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ],
      ),
      leading: const CircleAvatar(
        backgroundColor: Colors.red,
        child: Text(
          'JW',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      contentPadding: const EdgeInsets.all(10),
      isThreeLine: true,
      trailing: const Text('21, Apr, 2021'),
    );
  }

  Widget _buildDetailsContent() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Brand',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Name Boots',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              '0923487923687',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        const Divider(thickness: 1.0),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Condition',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              'Material',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Brand, New ,With Box',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'Faux Sued, Velvet',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1.0),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Category',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
            Text(
              'Fitting',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Men Shoes',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'True to size',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(thickness: 1.0),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildBurchaseButons(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ElevatedButton(
          style: TextButton.styleFrom(
            minimumSize: Size(SizeConfig.screenWidth / 2.2, 50),
            backgroundColor: Colors.white,
          ),
          onPressed: () {},
          child: const Text(
            'Add To Cart',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ElevatedButton(
          style: TextButton.styleFrom(
            minimumSize: Size(SizeConfig.screenWidth / 2.2, 50),
            backgroundColor: kPrimaryColor,
          ),
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                height: SizeConfig.screenHeight / 1.4,
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
                    const SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              width: getProportionateScreenWidth(120),
                              height: getProportionateScreenWidth(100),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.fill,
                                  image: NetworkImage(product.imageUrl),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '\$${product.price}',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Blue UK: 5.0',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(14),
                              ),
                            ),
                            Text(
                              '${product.title} (Men)',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: getProportionateScreenWidth(18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(color: kGrayColor),
                    const SizedBox(height: 12),
                    _buildSelectColor(),
                    const SizedBox(height: 12),
                    const Divider(color: kGrayColor),
                    const SizedBox(height: 12),
                    _buildSelectSize(),
                    const SizedBox(height: 12),
                    const Divider(color: kGrayColor),
                    const SizedBox(height: 12),
                    _buildSelectQuantity(),
                    const SizedBox(height: 12),
                    const Divider(color: kGrayColor),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                          getProportionateScreenWidth(300),
                          getProportionateScreenHeight(50),
                        ),
                        shadowColor: Colors.black,
                        onPrimary: Colors.white,
                        primary: kPrimaryColor,
                      ),
                      child: const Text('Continue'),
                    ),
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
          child: const Text(
            'Buy Now',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSelectSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Select Size'),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14,
                child: Text(
                  '4.5',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: kPrimaryColor,
                radius: 16,
                child: Text(
                  '5.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Text(
                  '6.5',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Text(
                  '7.0',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 16,
                child: Text(
                  '8.0',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        )
      ],
    );
  }

  Widget _buildSelectColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Select Color'),
        const SizedBox(height: 10),
        Row(
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundColor: kPrimaryColor,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14,
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 14,
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 14,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildSelectQuantity() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Quantity'),
            SizedBox(height: 12),
            Text(
              'only 4 items left',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Row(
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
                        '-',
                        style: TextStyle(fontSize: 25),
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
                        '+',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
