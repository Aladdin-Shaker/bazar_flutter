import 'package:bazar/controllers/delivery_controller.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

class DeliveryStatusScreen extends GetWidget<DeliveryController> {
  const DeliveryStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DeliveryController controller = Get.put(DeliveryController());

    return Scaffold(
      appBar: customAppbar(
        title: const Text(
          'Delivery Status',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          appBarNotificationBtn(),
        ],
        isBackBtn: false,
      ),
      body: Container(
        child: Column(
          children: [
            _buildStepperRow(controller, context),
          ],
        ),
      ),
    );
  }

  Obx _buildStepperRow(DeliveryController controller, BuildContext context) {
    return Obx(
      () => StatusChange.tileBuilder(
        theme: StatusChangeThemeData(
          direction: Axis.vertical,
          connectorTheme: ConnectorThemeData(space: 1.0, thickness: 1.0),
        ),
        builder: StatusChangeTileBuilder.connected(
          itemWidth: (_) => MediaQuery.of(context).size.width / 10,
          contentWidgetBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'add content here',
                style: TextStyle(
                  color: Colors
                      .blue, // change color with dynamic color --> can find it with example section
                ),
              ),
            );
          },
          nameWidgetBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'your text ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
          indicatorWidgetBuilder: (_, index) {
            if (index <= 2) {
              return DotIndicator(
                size: 35.0,
                border: Border.all(color: Colors.green, width: 1),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            } else {
              return OutlinedDotIndicator(
                size: 30,
                borderWidth: 1.0,
                color: Colors.green,
              );
            }
          },
          lineWidgetBuilder: (index) {
            if (index > 0) {
              if (index == 2) {
                final prevColor = Colors.amber;
                final color = Colors.white;
                var gradientColors;
                gradientColors = [prevColor, Color.lerp(prevColor, color, 0.5)];
                return DecoratedLineConnector(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red],
                    ),
                  ),
                );
              } else {
                return SolidLineConnector(
                  color: Colors.white,
                );
              }
            } else {
              return null;
            }
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
