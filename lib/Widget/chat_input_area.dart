import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/Chat Cubit.dart';

class ChatInputArea extends StatelessWidget {
  final TextEditingController controller;

  const ChatInputArea({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
      decoration: const BoxDecoration(color: Colors.white),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Write your message...',
          filled: true,
          fillColor: const Color(0xffF7F7F7),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send, color: Color(0xff3369FF)),
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<ChatCubit>().sendMessage(controller.text);
                controller.clear();
              }
            },
          ),
        ),
      ),
    );
  }
}
