import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/notifications_controller.dart';
import 'package:bazar/models/notification.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:bazar/views/widgets/custom_cart_title.dart';
import 'package:bazar/views/widgets/title_with_notify_no.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsScreen extends GetWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        title: const SizedBox.shrink(),
        actions: [],
        isBackBtn: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            child: customCartTitle(
              title: 'Notifications',
              titleSize: 28,
              press: null,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(15)),
          const TitleWithNotifyNo(title: 'New', count: 3),
          buildGetBuilderNewNotifications(),
          SizedBox(height: getProportionateScreenHeight(15)),
          const TitleWithNotifyNo(title: 'Eariler', count: 8),
          buildGetBuilderEarlierNotifications(),
        ],
      ),
    );
  }

  GetBuilder<NotificationsController> buildGetBuilderEarlierNotifications() {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        return Expanded(
          child: SingleChildScrollView(
            child: FutureBuilder<List<NotifyModel>>(
              future: controller.fetchEarlierNotifications.call(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final NotifyModel notify = snapshot.data![index];
                      print(
                          'snapshot.data!.length => ${snapshot.data!.length}');
                      return Card(
                        color: notify.isRead ? Colors.white : Colors.blue[50],
                        elevation: 0.3,
                        child: ListTile(
                          subtitle: Text(
                            notify.content,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              color: kSecondaryColor,
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.network(
                              notify.imageUrl,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                                .toInt()
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          isThreeLine: true,
                          trailing: Column(
                            children: [
                              Text(
                                notify.date,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(10)),
                              if (notify.isRead)
                                const SizedBox.shrink()
                              else
                                Container(
                                  alignment: Alignment.bottomRight,
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
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
            ),
          ),
        );
      },
    );
  }

  GetBuilder<NotificationsController> buildGetBuilderNewNotifications() {
    return GetBuilder<NotificationsController>(
      init: NotificationsController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: FutureBuilder<List<NotifyModel>>(
            future: controller.fetchNewNotifications.call(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final NotifyModel notify = snapshot.data![index];
                    return Card(
                      color: notify.isRead ? Colors.white : Colors.blue[50],
                      elevation: 0.3,
                      child: ListTile(
                        subtitle: Text(
                          notify.content,
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            color: kSecondaryColor,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                            notify.imageUrl,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                              .toInt()
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        isThreeLine: true,
                        trailing: Column(
                          children: [
                            Text(
                              notify.date,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            if (notify.isRead)
                              const SizedBox.shrink()
                            else
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 8,
                                width: 8,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
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
          ),
        );
      },
    );
  }
}
