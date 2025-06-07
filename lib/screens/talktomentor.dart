import 'package:flutter_dotenv/flutter_dotenv.dart';
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
      ChatUser(id: '2', firstName: 'Chart', lastName: 'Mentor');
  List<ChatMessage> _messages = <ChatMessage>[];
  var api_key;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api_key = dotenv.env['_openAiKey'];
    print(api_key + " in file");
  }

  final _openAi = OpenAI.instance.build(
    
      token: dotenv.env['_openAiKey'],
      baseOption: HttpSetup(
        receiveTimeout: Duration(seconds: 6),
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
      model: Gpt4oMiniChatModel(),
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
