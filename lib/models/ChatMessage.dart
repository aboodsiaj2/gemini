class ChatMessage {
  final String text;
  final bool isUser;
  final bool isLoading;
  final bool isError;
  final String time;

  ChatMessage({
    required this.text,
    required this.isUser,
    this.isLoading = false,
    this.isError = false,
    required this.time,
  });
}