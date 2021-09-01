import 'package:bazar/models/notification.dart';
import 'package:get/state_manager.dart';

class NotificationsService extends GetxService {
  static Future<List<NotifyModel>> getNewNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/380/530/original/notification-vector-icon.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          false,
          'https://static.vecteezy.com/system/resources/previews/000/449/485/original/vector-notification-icon.jpg',
        ).toJson(),
      ),
    ];
  }

  static Future<List<NotifyModel>> getEarlierNotifications() async {
    await Future.delayed(const Duration(seconds: 1));

    return [
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/380/530/original/notification-vector-icon.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/449/485/original/vector-notification-icon.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
      NotifyModel.fromJson(
        NotifyModel(
          'standard dummy text ever since the 1500s, when an unknown printer ',
          '09:35 AM',
          true,
          'https://static.vecteezy.com/system/resources/previews/000/497/448/original/vector-notification-icon-design.jpg',
        ).toJson(),
      ),
    ];
  }
}
