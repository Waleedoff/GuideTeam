import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DataController extends GetxController {
  String? input;
  String res = "";
  TextEditingController controllerM = TextEditingController();
  var userMessage = [];

  List token = [];
  @override
  Future<void> makePostRequest(input) async {
    final url =
        Uri.parse('https://experimental.willow.vectara.io/v1/chat/completions');
    final headers = {
      'Content-Type': 'application/json',
      'customer-id': '2262343052',
      'x-api-key': 'zqt_htidjOPvnDoewmuwIjZJfx6McwwuPw5EX6IceQ'
    };
    final json = jsonEncode(({
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": input + 'في المملكه العربيه السعوديه'}
      ]
    }));
    final response = await post(url, headers: headers, body: json);
    Map<String, dynamic> data = jsonDecode(response.body);
    // token = data["choices"][0]["message"]['content'];
    token.add(data["choices"][0]["message"]['content']);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');

    userMessage.add(controllerM.text);
    print("${token}");
    update();
  }
}
