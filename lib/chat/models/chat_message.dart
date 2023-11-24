import 'package:purserapp/core/datatypes/model.dart';

class ChatMessageMA {
  String? id;
  String sessionId;
  String fromUserId;
  String fromUsername;
  String toUserId;
  String toUsername;
  String text;

  ChatMessageMA(
      {this.id,
      required this.sessionId,
      required this.fromUserId,
      required this.fromUsername,
      required this.toUserId,
      required this.toUsername,
      required this.text});
}

class ChatMessage extends Model<ChatMessage, ChatMessageMA> {
  String? id;
  late String sessionId;
  late String fromUserId;
  late String fromUsername;
  late String toUserId;
  late String toUsername;
  late String text;

  @override
  String collection = 'chat_messages';

  @override
  ChatMessage create(ChatMessageMA arguments) {
    var chatMessage = ChatMessage();
    chatMessage.id = arguments.id;
    chatMessage.sessionId = arguments.sessionId;
    chatMessage.fromUserId = arguments.fromUserId;
    chatMessage.fromUsername = arguments.fromUsername;
    chatMessage.toUserId = arguments.toUserId;
    chatMessage.toUsername = arguments.toUsername;
    chatMessage.text = arguments.text;
    return chatMessage;
  }

  @override
  ChatMessage? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    } else {
      return ChatMessage().create(ChatMessageMA(
          id: data['id'],
          sessionId: data['sessionId'],
          fromUserId: data['fromUserId'],
          fromUsername: data['fromUsername'],
          toUserId: data['toUserId'],
          toUsername: data['toUsername'],
          text: data['text']));
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sessionId': sessionId,
      'fromUserId': fromUserId,
      'fromUsername': fromUsername,
      'toUserId': toUserId,
      'toUsername': toUsername,
      'text': text
    };
  }
}
