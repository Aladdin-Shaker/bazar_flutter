import 'package:bazar/models/message.dart';
import 'package:bazar/services/messages_service.dart';
import 'package:get/state_manager.dart';

class MessagesController extends GetxController {
  // static RxList<Message> allChats = <Message>[].obs;
  final allChats = Future.value(<Message>[]).obs;
  final allChatMessages = Future.value(<Message>[]).obs;

  late Message selectedSingleChat;

  @override
  void onInit() {
    print('MessagesController init called');
    super.onInit();
    fetchAllChats();
    fetchAllChatMessages();
  }

  Future<List<Message>> fetchAllChats() {
    print('Messages_CTRL => fetchAllChats called ');
    return allChats.value = MessagesService.getAllChats();
  }

  Future<List<Message>> fetchAllChatMessages() {
    print('Messages_CTRL => fetchAllChatMessages called ');
    return allChatMessages.value = MessagesService.getChatMessages();
  }
}
