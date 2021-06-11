import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/category_controller.dart';
import 'package:bazar/models/category.dart';
import 'package:bazar/views/widgets/app_notification_btn.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:bazar/views/widgets/custom_cart_title.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        actions: [appBarNotificationBtn()],
        isBackBtn: true,
        isSearch: true,
        context: context,
      ),
      extendBody: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customCartTitle(
                title: 'All Categories',
                titleSize: 30,
                press: null,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: SizeConfig.screenWidth / 3.5,
                        child: _buildVerticalAllCategories(),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                child: Text('Mens'),
                              ),
                              GestureDetector(
                                child: Text('Women'),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalAllCategories() {
    return Flexible(
      child: GetBuilder<CategoryController>(
          init: CategoryController(),
          builder: (controller) {
            return FutureBuilder<List<Categories?>>(
              future: CategoryController.allCategories.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final Categories? cat = snapshot.data![index];
                      return Container(
                        margin: EdgeInsets.all(getProportionateScreenWidth(5)),
                        height: getProportionateScreenWidth(80),
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
