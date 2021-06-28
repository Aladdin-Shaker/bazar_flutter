import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/category_controller.dart';
import 'package:bazar/controllers/product_controller.dart';
import 'package:bazar/models/category.dart';
import 'package:bazar/models/category_type.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:bazar/views/widgets/custom_cart_title.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CategoriesScreen extends StatelessWidget {
  final GlobalKey<FormState> _categoriesKey =
      GlobalKey<FormState>(debugLabel: '_categoriesScreenkey');

  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _categoriesKey,
      appBar: customAppbar(
        title: const Text(
          'Categories',
        ),
        actions: [appBarNotificationBtn()],
        isBackBtn: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                // color: Colors.red,
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(10),
                  bottom: getProportionateScreenHeight(10),
                ),
                child: customCartTitle(
                  title: 'All Categories',
                  titleSize: 28,
                  press: null,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: SizeConfig.screenHeight / 1.3,
                          child: _buildVerticalAllCategories(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10)),
                  Flexible(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[50],
                          ),
                          child: _buildCategoryTab(),
                        ),
                        Container(
                          height: SizeConfig.screenHeight / 1.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 15,
                                offset: const Offset(10, 5),
                              ),
                            ],
                            color: Colors.grey[50],
                          ),
                          child: _buildExpandedPanel(),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedPanel() {
    return GetX<ProductController>(
        init: ProductController(),
        dispose: (state) => ProductController(),
        builder: (controller) {
          return ListView.builder(
            shrinkWrap: true,
            primary: true,
            itemCount: controller.allExpansionProducts.length,
            itemBuilder: (context, index) {
              final CategoryType prd = controller.allExpansionProducts[index];
              return Column(
                children: [
                  ExpansionPanelProductType(prd: prd, controller: controller),
                ],
              );
            },
          );
        });
  }
}

class ExpansionPanelProductType extends StatelessWidget {
  final GlobalKey expansionTileKey = GlobalKey(debugLabel: '_expansionTileKey');

  ExpansionPanelProductType({
    Key? key,
    required this.prd,
    required this.controller,
  }) : super(key: key);

  final CategoryType prd;
  final ProductController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ExpansionTile(
        key: expansionTileKey,
        collapsedIconColor: kGrayColor,
        trailing: const Icon(Icons.arrow_circle_down_rounded),
        onExpansionChanged: (value) {
          if (value) {
            // Checking expansion status
            final keyContext = expansionTileKey.currentContext;
            if (keyContext != null) {
              Future.delayed(const Duration(milliseconds: 300)).then(
                (value) {
                  Scrollable.ensureVisible(
                    keyContext,
                    curve: Curves.easeIn,
                    duration: const Duration(milliseconds: 300),
                  );
                },
              );
            }
          }
        },
        title: Text(prd.type.title),
        children: [
          GridView.builder(
            shrinkWrap: true,
            primary: true,
            addRepaintBoundaries: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            addAutomaticKeepAlives: false,
            itemCount: prd.product.length,
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      prd.product[index].imageUrl,
                      fit: BoxFit.fitWidth,
                      width: getProportionateScreenWidth(65),
                    ),
                  ),
                  Text(
                    prd.product[index].title,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                    ),
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[50],
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCategoryTab() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      ElevatedButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[50],
          elevation: 0,
        ),
        child: Text(
          'MENS',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: kGrayColor,
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[50],
          elevation: 0,
        ),
        child: Text(
          'WOMENS',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(15),
            color: Colors.black,
          ),
        ),
      ),
    ],
  );
}

Widget _buildVerticalAllCategories() {
  return GetX<CategoryController>(
    dispose: (state) => CategoryController,
    init: CategoryController(),
    builder: (controller) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.allCategories.length,
        itemBuilder: (context, index) {
          final Categories cat = controller.allCategories[index];
          return Container(
            margin: EdgeInsets.all(getProportionateScreenWidth(5)),
            height: getProportionateScreenWidth(80),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  cat.icon,
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
    },
  );
}

// body: SingleChildScrollView(
//   child: Padding(
//     padding: EdgeInsets.all(10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         customCartTitle(
//           title: 'All Categories',
//           titleSize: 30,
//           press: null,
//         ),
//         // SizedBox(width: getProportionateScreenHeight(40)),
//         Container(
//           margin: EdgeInsets.only(
//             top: getProportionateScreenHeight(10),
//             bottom: getProportionateScreenHeight(10),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildVerticalAllCategories(),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildCategoryTab(),
//                   Expanded(child: _buildExpandedPanel()),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
