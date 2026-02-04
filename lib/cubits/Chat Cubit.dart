import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/Widget/import.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class ChatCubit extends Cubit<ChatState> {
  final GenerativeModel model;
  ChatCubit(this.model) : super(ChatState(messages: []));

  void sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final time = DateFormat('hh:mm a').format(DateTime.now());
    final userMsg = ChatMessage(text: text, isUser: true, time: time);

    emit(ChatState(messages: [...state.messages, userMsg], isLoading: true));

    try {
      final response = await model.generateContent([Content.text(text)]);

      if (response.text != null) {
        final aiMsg = ChatMessage(
          text: response.text!,
          isUser: false,
          time: DateFormat('hh:mm a').format(DateTime.now()),
        );
        emit(ChatState(messages: [...state.messages, aiMsg], isLoading: false));
      }
    } catch (e) {
      final errorMsg = ChatMessage(
        text:
            "Sorry, I'm having trouble connecting. Check your internet or VPN.",
        isUser: false,
        time: time,
      );
      emit(
        ChatState(messages: [...state.messages, errorMsg], isLoading: false),
      );
    }
  }

  void resetChat() {
    emit(ChatState(messages: []));
  }
}
