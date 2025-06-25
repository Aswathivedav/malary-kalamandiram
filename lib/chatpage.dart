import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For timestamp formatting

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();

  void sendMessage(String text, {bool fromMe = true}) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.insert(0, {
        'text': text.trim(),
        'fromMe': fromMe,
        'time': DateFormat.Hm().format(DateTime.now()),
      });
    });
    _controller.clear();

    // Auto reply
    
  }

  void clearChat() {
    setState(() {
      messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Malary Kalamandiram"),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {
              // Video call logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Audio call logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: clearChat,
            tooltip: "Clear chat",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final align = msg['fromMe']
                    ? Alignment.centerRight
                    : Alignment.centerLeft;
                final color = msg['fromMe']
                    ? Colors.blue[100]
                    : Colors.grey[300];

                return Align(
                  alignment: align,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: msg['fromMe']
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg['text'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg['time'],
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}