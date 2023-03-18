// import 'package:chat/chat/logic/controller/chatController.dart';
// import 'package:chat/controller/date.dart';
// import 'package:chat/welcome/view/screen/welcome_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_team/Features/chatFeature/chat/controller/date.dart';
import 'package:guide_team/Features/chatFeature/chat/logic/controller/chatController.dart';

final controller = Get.put(ChatController());
final controller1 = Get.put(DataController());

class ChatScreen extends StatefulWidget {
  static const String screenRouts = 'chat_screen';
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? messageText;

  var isEmpty1 = controller.mssageTextController.value.text.isEmpty;

  var mssageTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.blue[800],
        //   title: Row(
        //     children: [
        //       // Image.asset(
        //       //   'images/logoChat.png',
        //       //   height: 25,
        //       // ),
        //       const SizedBox(
        //         width: 10,
        //       ),
        //       const Text("Message")
        //     ],
        //   ),
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           setState(() {
        //             auth.signOut();
        //             Get.to(WelcomeScreen());
        //           });
        //           // controller.getMessages();
        //           // controller.messagesStreem();
        //         },
        //         icon: const Icon(Icons.close))
        //   ],
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "دليلي في خدمتك الآن",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(1, 89, 39, 1)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Image.asset('assets/images/az.png'),
                  ],
                ),
                Divider(
                  color: Colors.black12,
                  thickness: 2,
                  height: 35,
                ),
              ],
            ),

            //////////

            Expanded(
              child: GetBuilder<DataController>(
                  builder: (controller) => ListView.builder(
                        itemCount: controller1.token.length,
                        itemBuilder: (BuildContext context, int index) {
                          return controller1.token.isEmpty
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  153, 162, 165, 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              controller1.userMessage[index],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    1, 89, 39, 0.5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                controller1.token[index],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                        },
                      )),
            ),

            const MessageStreemBuilder(),
            Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
                child: GetBuilder<ChatController>(
                  builder: (controller) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: TextField(
                          controller: controller1.controllerM,
                          onChanged: (value) {
                            setState(() {
                              messageText = value;
                              controller1.controllerM.value;
                            });
                          },
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 24,
                              ),
                              hintText: 'Write your message here...',
                              border: InputBorder.none),
                        )),
                        IconButton(
                            onPressed: () {
                              ////
                              ///
                              ///
                              // controller.selectFile();
                            },
                            icon: const Icon(Icons.mic_rounded)),
                        IconButton(
                          onPressed: () {
                            print(
                                '---------${controller1.controllerM.value.text}-----');
                            controller1.makePostRequest(
                                controller1.controllerM.value.text);
                          },
                          icon: Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 22, 75, 24),
                          ),
                        ),
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class MessageStreemBuilder extends StatelessWidget {
  const MessageStreemBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: getData(),
        builder: ((context, snapshot) {
          List<MessageLine> messageWidgets = [];

          if (!snapshot.hasData) {
            return const Center(
              child: Text(''),
              // backgroundColor: Colors.blue,
            );
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: messageWidgets,
            ),
          );
        }));
  }

  getData() {}
}

class MessageLine extends StatelessWidget {
  const MessageLine({
    this.text,
    this.sender,
    required this.isMe,
    super.key,
  });
  final String? sender;
  final String? text;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('$sender',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              )),
          Material(
              elevation: 5,
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))
                  : const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
              color: isMe ? Colors.blue[800] : Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text('$text',
                    style: TextStyle(
                      fontSize: 15,
                      color: isMe ? Colors.white : Colors.black45,
                    )),
              )),
        ],
      ),
    );
  }
}

// // Widget buildProgress() => StreamBuilder(
// //     stream: controller.uploadTask?.snapshotEvents,
// //     builder: ((context, snapshot) {
// //       if (snapshot.hasData) {
// //         final data = snapshot.data!;
// //         double progress = data.bytesTransferred / data.totalBytes;
// //         return SizedBox(
// //           height: 50,
// //           child: Stack(
// //             fit: StackFit.expand,
// //             children: [
// //               LinearProgressIndicator(
// //                 value: progress,
// //                 backgroundColor: Colors.grey,
// //               ),
// //               Center(
// //                 child: Text(
// //                   '${(100 * progress).roundToDouble()}%',
// //                   style: const TextStyle(color: Colors.white),
// //                 ),
// //               )
// //             ],
// //           ),
// //         );
// //       } else {
// //         return const SizedBox(
// //           height: 550,
// //         );
// //       }
//     }));
