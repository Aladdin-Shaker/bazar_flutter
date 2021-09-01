import 'package:bazar/config/constants.dart';
import 'package:bazar/config/sizes.dart';
import 'package:bazar/controllers/messages_controller.dart';
import 'package:bazar/models/message.dart';
import 'package:bazar/views/widgets/appbar_notification_action.dart';
import 'package:bazar/views/widgets/custom_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends GetWidget<MessagesController> {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
        // title: const SizedBox.shrink(),
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
          ),
        ),

        actions: [
          appBarNotificationBtn(),
        ],
        isBackBtn: false,
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          //   child: customCartTitle(
          //     title: 'Notifications',
          //     titleSize: 28,
          //     press: null,
          //   ),
          // ),
          // SizedBox(height: getProportionateScreenHeight(15)),
          _buildChatSearch(),
          Expanded(
            child: buildGetBuilderAllContacts(),
          ),
        ],
      ),
    );
  }

  GetBuilder<MessagesController> buildGetBuilderAllContacts() {
    return GetBuilder<MessagesController>(
      init: MessagesController(),
      builder: (controller) {
        return FutureBuilder<List<Message>>(
          future: controller.allChats.value,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                primary: true,
                physics: const ScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Message msg = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      controller.selectedSingleChat = msg;
                      Get.toNamed(chatViewRoute);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: msg.unread ? Colors.blue[100] : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 25.0,
                                    backgroundImage:
                                        AssetImage(msg.sender.imageUrl),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 7,
                                      child: CircleAvatar(
                                        backgroundColor: msg.isOnline
                                            ? Colors.green
                                            : Colors.red,
                                        radius: 5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    msg.sender.fullname,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: Text(
                                      msg.text,
                                      style: const TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                msg.time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              if (msg.unread)
                                Container(
                                  width: 40,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Colors.red,
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'NEW',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              else
                                const SizedBox.shrink(),
                            ],
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
        );
      },
    );
  }

  Widget _buildChatSearch() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) => debugPrint('search => $value'),
        decoration: InputDecoration(
            fillColor: Colors.grey[200],
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kGrayColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true),
      ),
    );
  }
}
