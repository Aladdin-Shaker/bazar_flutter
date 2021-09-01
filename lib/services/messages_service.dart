import 'package:bazar/models/message.dart';
import 'package:bazar/models/user.dart';
import 'package:get/state_manager.dart';

// ignore: avoid_classes_with_only_static_members
class MessagesService extends GetxService {
  // YOU - current user
  static User currentUser = User(
    1,
    'Current User',
    'assets/images/users/greg.jpg',
  );

  // USERS
  static User greg = User(
    2,
    'Greg Kres',
    'assets/images/users/greg.jpg',
  );
  static User james = User(
    3,
    'James Max',
    'assets/images/users/james.jpg',
  );
  static User john = User(
    4,
    'John Logey',
    'assets/images/users/john.jpg',
  );
  static User olivia = User(
    5,
    'Olivia meso',
    'assets/images/users/olivia.jpg',
  );
  static User sam = User(
    6,
    'Sam',
    'assets/images/users/sam.jpg',
  );
  static User sophia = User(
    7,
    'Sophia reka',
    'assets/images/users/sophia.jpg',
  );
  static User steven = User(
    8,
    'Steven hofy',
    'assets/images/users/steven.jpg',
  );

  static Future<List<Message>> getAllChats() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Message> allChats = [
      Message.fromJson(
        Message(
          james,
          '2:00 PM',
          'I ate so much food today.',
          false,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          sam,
          '2:30 PM',
          'Nice! What kind of food did you eat?',
          false,
          true,
          false,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          olivia,
          '3:15 PM',
          'All the food',
          true,
          false,
          false,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          sophia,
          '3:45 PM',
          "How's the doggo?",
          false,
          false,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          greg,
          '4:30 PM',
          'Just walked my doge. She was super duper cute. The best pupper!!',
          false,
          true,
          false,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          steven,
          '5:30 PM',
          "Hey, how's it going? What did you do today?",
          true,
          false,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          greg,
          '4:30 PM',
          'Just walked my doge. She was super duper cute. The best pupper!!',
          false,
          true,
          false,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          steven,
          '5:30 PM',
          "Hey, how's it going? What did you do today?",
          true,
          false,
          true,
        ).toJson(),
      ),
    ];

    return allChats;
  }

  static Future<List<Message>> getChatMessages() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Message> allChatmessages = [
      Message.fromJson(
        Message(
          james,
          '2:00 PM',
          'I ate so much food today.',
          false,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          currentUser,
          '2:30 PM',
          'Nice! What kind of food did you eat?',
          false,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          james,
          '3:15 PM',
          'All the food',
          true,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          james,
          '3:45 PM',
          "How's the doggo?",
          false,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          currentUser,
          '4:30 PM',
          'Just walked my doge. She was super duper cute. The best pupper!!',
          false,
          true,
          true,
        ).toJson(),
      ),
      Message.fromJson(
        Message(
          james,
          '5:30 PM',
          "Hey, how's it going? What did you do today?",
          true,
          true,
          true,
        ).toJson(),
      ),
    ];
    return allChatmessages;
  }
}
