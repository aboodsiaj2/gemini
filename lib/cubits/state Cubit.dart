import 'package:gemini/models/ChatMessage.dart';

class ChatState {
  final List<ChatMessage> messages;
  final bool isLoading;

  ChatState({required this.messages, this.isLoading = false});
}
