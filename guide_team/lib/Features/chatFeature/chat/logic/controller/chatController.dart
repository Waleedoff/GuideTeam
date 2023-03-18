import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var mssageTextController = TextEditingController().obs;
  @override
  void onInit() {
    // getCurrentUser();
    // mssageTextController.clear();
    // mssageTextController;
    super.onInit();
  }

//File

  // PlatformFile? pickedfile;
  // UploadTask? uploadTask;

  // File? pickedFile;
  // String imgUrl = "";
  // final imagePicker = ImagePicker();

  // var urlDownload;
  // selectFile() async {
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result == null) return;

  //   pickedfile = result.files.first;
  //   print(pickedfile!.name);
  // }

  // uploadFile() async {
  //   if (pickedfile == null) {
  //     return null;
  //   } else {
  //     final path = 'files/${pickedfile!.name}';
  //     final file = File(pickedfile!.path!);
  //     final ref = FirebaseStorage.instance.ref().child(path);
  //     uploadTask = ref.putFile(file);
  //     final snapshot = await uploadTask!.whenComplete(() => {});
  //     final urlDownload = await snapshot.ref.getDownloadURL();
  //     print('DownLoad Link: $urlDownload');
  //     uploadTask = null;
  //   }
  // }
//

  // final firestore = FirebaseFirestore.instance;
  // late User signedInUser;
  // void getCurrentUser() {
  //   try {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       signedInUser = user;
  //       print(signedInUser.email);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // chatFunc(messageText, email) async {
  //   firestore.collection('messages').add({
  //     'text': messageText,
  //     'sender': email,
  //     'time': FieldValue.serverTimestamp()
  //   });
  //   mssageTextController.obs;
  //   update();
  // }

  // getMessages() async {
  //   final messages = await firestore.collection('messages').get();

  //   for (var message in messages.docs) {
  //     print(message.data());
  //   }
  // }
  // Future messagesStreem() async {
  //   await for (var snapshot in firestore.collection('messages').snapshots()) {
  //     for (var message in snapshot.docs) {
  //       print(message.data());
  //     }
  //   }
  //   ;
  // }
}
