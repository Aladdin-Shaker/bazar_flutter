import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/messages_controller.dart';
import 'package:bazar/models/message.dart';
import 'package:bazar/services/messages_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleChatScreen extends GetWidget<MessagesController> {
  SingleChatScreen({Key? key}) : super(key: key);

  String dropdownValue = 'One';
  List<String> items = ['Block', 'Clear chat', 'Mute notification'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: GetBuilder<MessagesController>(
          builder: (controller) {
            debugPrint(
                'single chat => ${controller.selectedSingleChat.sender}');
            return Row(
              children: [
                Text(
                  controller.selectedSingleChat.sender.fullname,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 15),
                CircleAvatar(
                  backgroundColor: controller.selectedSingleChat.isOnline
                      ? Colors.green
                      : Colors.red,
                  radius: 5,
                ),
              ],
            );
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          iconSize: 28.0,
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
        elevation: 0.0,
        // actions: [
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: DropdownButton<String>(
        //     // value: dropdownValue,

        //     icon: const Icon(Icons.more_horiz, color: Colors.grey),
        //     elevation: 10,
        //     underline: const SizedBox.shrink(),
        // style: const TextStyle(color: Colors.deepPurple),
        // onChanged: (String newValue) {
        //   setState(() {
        //     dropdownValue = newValue;
        //   });
        // },
        //     items: items.map<DropdownMenuItem<String>>((String value) {
        //       return DropdownMenuItem<String>(
        //         onTap: () {
        //           debugPrint('you have been selected $value');
        //         },
        //         value: value,
        //         child: Padding(
        //           padding: const EdgeInsets.only(
        //             right: 20,
        //             top: 10,
        //           ),
        //           child: Text(value),
        //         ),
        //       );
        //     }).toList(),
        //   ),
        // ),
        // ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(30.0),
                  //   topRight: Radius.circular(30.0),
                  // ),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  // borderRadius: const BorderRadius.only(
                  //   topLeft: Radius.circular(30.0),
                  //   topRight: Radius.circular(30.0),
                  // ),
                  child: GetBuilder<MessagesController>(
                    init: MessagesController(),
                    builder: (controller) {
                      return FutureBuilder<List<Message>>(
                        future: controller.allChatMessages.value,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              reverse: true,
                              padding: const EdgeInsets.only(top: 15.0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Message message = snapshot.data![index];
                                final bool isMe = message.sender.id ==
                                    MessagesService.currentUser.id;
                                return _buildMessage(message, isMe);
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
                      );
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
              right: 15,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 15,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      width: SizeConfig.screenWidth / 1.5,
      decoration: BoxDecoration(
        color: isMe ? kPrimaryColor : Colors.blue[50],
        borderRadius: isMe
            ? const BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0))
            : const BorderRadius.only(
                topRight: Radius.circular(30.0),
                topLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (isMe)
            Text(
              message.time,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            )
          else
            Text(
              message.time,
              style: const TextStyle(
                color: kSecondaryColor,
                fontSize: 14.0,
              ),
            ),
          const SizedBox(height: 5.0),
          if (isMe)
            Text(
              message.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            )
          else
            Text(
              message.text,
              style: const TextStyle(
                color: kSecondaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          iconSize: 28.0,
          color: message.isLiked ? Colors.red : Colors.blueGrey,
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildMessageComposer() {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            onPressed: () {},
            color: kPrimaryColor,
            iconSize: 25,
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Senda message ...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
            color: kPrimaryColor,
            iconSize: 25,
          )
        ],
      ),
    );
  }
}
