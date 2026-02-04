import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'import.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isChatEmpty;
  const ChatAppBar({super.key, required this.isChatEmpty});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: !isChatEmpty
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.read<ChatCubit>().resetChat(),
            )
          : null,
      title: Row(
        children: [
          Image.asset(
            "assets/logo.png",
            width: 40,
            height: 40,
            errorBuilder: (c, e, s) => const Icon(Icons.android),
          ),
          const SizedBox(width: 8),
          const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ChatGPT",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3369FF),
                ),
              ),
              Text(
                ". Online",
                style: TextStyle(fontSize: 14, color: Color(0xff3ABF38)),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.volume_up), onPressed: () {}),
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
