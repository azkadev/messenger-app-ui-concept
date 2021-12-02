import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.userData}) : super(key: key);
  final Map userData;
  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    widget.userData["type"];
  }

  // ignore: non_constant_identifier_names
  List<dynamic> messages = [
    {
      "id": 0,
      "type_message": "text",
      "text": "hallo",
      "is_outgoing": false,
      "content": "hello"
    },
    {
      "id": 0,
      "type_message": "text",
      "text": "hallo",
      "is_outgoing": true,
      "content": "hello juga"
    },
    {
      "id": 0,
      "type_message": "text",
      "text": "hallo",
      "is_outgoing": false,
      "content": "What are you doing?"
    },
    {
      "id": 0,
      "type_message": "text",
      "text": "hallo",
      "is_outgoing": true,
      "content": "saya sedang menonton youtube"
    },
    {
      "id": 0,
      "type_message": "text",
      "text": "hallo",
      "is_outgoing": true,
      "content": "Bagaimana dengan anda?"
    }
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final getHeight = mediaQuery.size.height;
    final getWidht = mediaQuery.size.width;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xffF0F8FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SafeArea(
          minimum: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                child: const Icon(
                  Iconsax.arrow_left,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey[100],
                backgroundImage: AssetImage(widget.userData["photo"]),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                widget.userData["first_name"],
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                child: const Icon(
                  Iconsax.call,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("tap pp");
                },
              ),
              const SizedBox(
                width: 10.0,
              ),
              InkWell(
                child: const Icon(
                  Iconsax.video,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("tap pp");
                },
              ),
              const SizedBox(
                width: 20.0,
              ),
              InkWell(
                child: const Icon(
                  Iconsax.more,
                  color: Colors.black,
                  size: 25,
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("tap pp");
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
            child: Align(
              alignment: (messages[index]["is_outgoing"]
                  ? Alignment.topRight 
                  : Alignment.topLeft),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (messages[index]["is_outgoing"]
                      ? Colors.blue[200]
                      : Colors.grey.shade200),
                ),
                padding: const EdgeInsets.all(16),
                child: Text(
                  messages[index]["content"],
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: SafeArea(
        minimum: const EdgeInsets.all(5.0),
        child: Container(
          width: getWidht,
          constraints: const BoxConstraints(
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 1,
              ),
            ],
          ),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 6,
            minLines: 1,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  child: const Icon(
                    Iconsax.happyemoji,
                    color: Colors.pink,
                    size: 25,
                  ),
                  onTap: () {
                    print("okeokeok");
                  },
                ),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  child: const Icon(
                    Iconsax.send_1,
                    color: Colors.blue,
                    size: 25,
                  ),
                  onTap: () {
                    print("okeokeok");
                  },
                ),
              ),
              hintText: "Typing here",
              hintStyle: const TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
            onChanged: (text) {
              print('First text field: $text');
            },
            onTap: () {
              print("hay");
            },
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
