import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:flutter/material.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({Key? key}) : super(key: key);
  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;

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
    return Column(
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
        SizedBox(
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
                  _buildBurchaseButons(),
                ],
              ),
              Column(
                children: <Widget>[
                  _buildDetailsContent(),
                  _buildBurchaseButons(),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                    ),
                  )
                ],
              ),
            ],
          ),
        )
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

  Widget _buildBurchaseButons() {
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
          onPressed: () {},
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
}
