import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/Widget/import.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutQuart,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) => _scrollToBottom(),
      builder: (context, state) {
        final bool isChatEmpty = state.messages.isEmpty;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: ChatAppBar(isChatEmpty: isChatEmpty),
          body: Column(
            children: [
              Expanded(
                child: isChatEmpty
                    ? const SuggestionsView()
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount:
                            state.messages.length + (state.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == state.messages.length) {
                            return const Align(
                              alignment: Alignment.centerLeft,
                              child: LoadingDots(),
                            );
                          }
                          final msg = state.messages[index];
                          return ChatBubble(text: msg.text, isUser: msg.isUser);
                        },
                      ),
              ),
              ChatInputArea(controller: _textController),
            ],
          ),
        );
      },
    );
  }
}
