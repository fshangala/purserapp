import 'package:purserapp/core/datatypes/model.dart';

class ChatSessionMemberMA {
  String? id;
  String chatSessionId;
  String userId;
  String username;

  ChatSessionMemberMA(
      {this.id,
      required this.chatSessionId,
      required this.userId,
      required this.username});
}

class ChatSessionMember extends Model<ChatSessionMember, ChatSessionMemberMA> {
  String? id;
  late String chatSessionId;
  late String userId;
  late String username;

  @override
  String collection = 'chat_session_members';

  @override
  ChatSessionMember create(ChatSessionMemberMA arguments) {
    var chatsm = ChatSessionMember();
    chatsm.id = arguments.id;
    chatsm.chatSessionId = arguments.chatSessionId;
    chatsm.userId = arguments.userId;
    chatsm.username = arguments.username;
    return chatsm;
  }

  @override
  ChatSessionMember? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    } else {
      return ChatSessionMember().create(ChatSessionMemberMA(
          id: data['id'],
          chatSessionId: data['chatSessionId'],
          userId: data['userId'],
          username: data['username']));
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'chatSessionId': chatSessionId,
      'userId': userId,
      'username': username
    };
  }
}
