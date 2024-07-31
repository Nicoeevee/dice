import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble({
    required this.message,
    required this.isUserMe,
    required this.userName,
    super.key,
    this.time,
  });

  final String message;
  final bool isUserMe;
  final String userName;
  final DateTime? time;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool showDateTime = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = widget.isUserMe
        ? colorScheme.onTertiaryContainer
        : colorScheme.onPrimaryContainer;
    final messageBubble = Card.filled(
      margin: const EdgeInsets.symmetric(vertical: 4),
      color: widget.isUserMe
          ? colorScheme.tertiaryContainer
          : colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          widget.message,
          style: textTheme.bodyMedium?.copyWith(
            color: textColor,
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: widget.time == null
          ? null
          : () {
              setState(() {
                showDateTime = !showDateTime;
              });
            },
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: widget.isUserMe
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.userName),
                    if (showDateTime && widget.time != null)
                      TextSpan(
                        text: ' ${DateFormat.Hms().format(widget.time!)}',
                      ),
                  ],
                ),
                style: textTheme.titleSmall?.copyWith(
                  color: textColor,
                ),
              ),
              messageBubble,
            ],
          ),
        ),
      ),
    );
  }
}
