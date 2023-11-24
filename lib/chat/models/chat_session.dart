import 'package:purserapp/chat/models/chat_message.dart';
import 'package:purserapp/chat/models/chat_session_member.dart';
import 'package:purserapp/core/datatypes/model.dart';

class ChatSessionMA {
  String? id;
  String? name;

  ChatSessionMA({this.id, this.name});
}

class ChatSession extends Model<ChatSession, ChatSessionMA> {
  String? id;
  String? name;

  @override
  String collection = 'chat_sessions';

  @override
  ChatSession create(ChatSessionMA arguments) {
    var session = ChatSession();
    session.id = arguments.id;
    session.name = arguments.name;
    return session;
  }

  @override
  ChatSession? fromMap(Map<String, dynamic>? data) {
    if (data == null) {
      return null;
    } else {
      return ChatSession()
          .create(ChatSessionMA(id: data['id'], name: data['name']));
    }
  }

  @override
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  Future<List<ChatSessionMember>> getMembers() async {
    var members = await ChatSessionMember()
        .getObjects(QueryBuilder().where('chatSessionId', id));
    return members;
  }

  Future<String> getName() async {
    var sessionName = id!;

    if (name != null) {
      sessionName = name!;
    }

    var members = await getMembers();
    if (members.isNotEmpty) {
      sessionName = '';
      for (var element in members) {
        sessionName += "${element.username},";
      }
    }

    return sessionName;
  }

  Future<List<ChatMessage>> getMessages() async {
    var messages =
        await ChatMessage().getObjects(QueryBuilder().where('sessionId', id));
    return messages;
  }
}
