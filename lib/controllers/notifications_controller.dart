import 'package:bazar/models/notification.dart';
import 'package:bazar/services/notifications_service.dart';
import 'package:get/state_manager.dart';

class NotificationsController extends GetxController with StateMixin {
  List<NotifyModel> getNewNotifications = <NotifyModel>[];
  List<NotifyModel> getErlierNotifications = <NotifyModel>[];

  // @override
  // void onInit() {
  //   print('NotificationsController init called');
  //   super.onInit();
  //   fetchAllNotifications();
  // }

  Future<List<NotifyModel>> fetchNewNotifications() async {
    print('Notifications_CTRL => fetchNewNotifications called ');

    return getNewNotifications =
        await NotificationsService.getNewNotifications();
  }

  Future<List<NotifyModel>> fetchEarlierNotifications() async {
    print('Notifications_CTRL => fetchEarlierNotifications called ');

    return getErlierNotifications =
        await NotificationsService.getEarlierNotifications();
  }
}
