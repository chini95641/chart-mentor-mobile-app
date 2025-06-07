// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<Map<String, String>> _messages = [];

//   void _sendMessage() async {
//     final userMessage = _controller.text.trim();
//     if (userMessage.isEmpty) return;

//     setState(() {
//       _messages.add({'role': 'user', 'content': userMessage});
//       _controller.clear();
//     });

//     await Future.delayed(Duration(milliseconds: 500));
//     setState(() {
//       _messages.add({'role': 'assistant', 'content': 'Response here'});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: const Text("Talk To Mentor"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _messages.isEmpty
//                 ? const Center(
//                     child: Text(
//                       "What can I help with?",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _messages.length,
//                     padding: const EdgeInsets.all(12),
//                     itemBuilder: (_, index) {
//                       final message = _messages[index];
//                       final isUser = message['role'] == 'user';
//                       return Align(
//                         alignment: isUser
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         child: Container(
//                           padding: const EdgeInsets.all(12),
//                           margin: const EdgeInsets.symmetric(vertical: 4),
//                           decoration: BoxDecoration(
//                             color: isUser ? Colors.blue : Colors.grey.shade300,
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text(
//                             message['content'] ?? '',
//                             style: TextStyle(
//                               color: isUser ? Colors.white : Colors.black,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 6,
//                   offset: Offset(0, -1),
//                 )
//               ],
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 4,
//                           offset: Offset(0, 2),
//                         )
//                       ],
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       controller: _controller,
//                       decoration: const InputDecoration(
//                         hintText: "Ask anything",
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                         border: InputBorder.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.blue,
//                   ),
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_upward, color: Colors.white),
//                     onPressed: _sendMessage,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class ChatService {
// //   static const _apiUrl = 'https://api.openai.com/v1/chat/completions';

// //   static Future<String> sendMessage(List<Map<String, String>> messages) async {
// //     final headers = {
// //       'Content-Type': 'application/json',
// //       'Authorization': 'Bearer YOUR_API_KEY', // Replace safely at runtime
// //     };

// //     final body = jsonEncode({
// //       "model": "gpt-3.5-turbo",
// //       "messages": messages,
// //     });

// //     final response = await http.post(
// //       Uri.parse(_apiUrl),
// //       headers: headers,
// //       body: body,
// //     );

// //     if (response.statusCode == 200) {
// //       final data = jsonDecode(response.body);
// //       return data['choices'][0]['message']['content'].toString().trim();
// //     } else {
// //       return "Something went wrong. Try again.";
// //     }
// //   }
// // }

import 'package:chart_mentor/constants/constants.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatUser _currentuser =
      ChatUser(id: '1', firstName: 'Me', lastName: 'user');
  final ChatUser _gpt =
      ChatUser(id: '0', firstName: 'Chart', lastName: 'Mentor');
  List<ChatMessage> _messages = <ChatMessage>[];

  final _openAi = OpenAI.instance.build(
      token: chatgpt_api,
      baseOption: HttpSetup(
        receiveTimeout: Duration(seconds: 10),
      ),
      enableLog: true);

  List<ChatUser> _typing = <ChatUser>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Talk To Mentor"),
      ),
      body: DashChat(
          currentUser: _currentuser,
          typingUsers: _typing,
          messageOptions: MessageOptions(
            currentUserContainerColor: Colors.blue,
          ),
          onSend: (ChatMessage m) {
            getchatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getchatResponse(ChatMessage m) async {
    setState(() {
      _messages.insert(0, m);
      _typing.add(_gpt);
    });
    List<Messages> messagehistory = _messages.reversed.map((m) {
      if (m.user == _currentuser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();

    final request = ChatCompleteText(
      model: Gpt4oMiniChatModel(), // or Gpt4oMiniChatModel()
      messages: [
        {
          'role': 'system',
          'content':
              'You are Chart Mentor, a stock trading assistant. Only answer questions related to stock market, trading strategies, ETFs, technical analysis, etc. Do not answer unrelated questions.',
        },
        ...messagehistory.map((m) => {
              'role': m.role.name,
              'content': m.content,
            })
      ],
      maxToken: 200,
    );

    final response = await _openAi.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  user: _gpt,
                  createdAt: DateTime.now(),
                  text: element.message!.content));
        });
      }
    }
    setState(() {
      _typing.remove(_gpt);
    });
  }
}
