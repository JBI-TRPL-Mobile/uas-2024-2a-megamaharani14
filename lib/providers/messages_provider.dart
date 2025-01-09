import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:template_project/model/messagesModel.dart';


class MessageProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  Future<void> loadMessages() async {
    try {
      final String response = await rootBundle.loadString('assets/datamessage.json');
      final List<dynamic> data = json.decode(response);

      _messages = data.map((json) => Message.fromJson(json)).toList();
      notifyListeners(); // Beritahu UI untuk update
    } catch (e) {
      if (kDebugMode) {
        print("Error loading messages: $e");
      }
    }
  }
}
