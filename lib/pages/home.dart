import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:animate_do/animate_do.dart';
import 'chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<HomePage> {
  var indexPage = 0;

  List<dynamic> listData = [
    {
      "id": 0,
      "photo": "assets/images/avatar-1.png",
      "first_name": "Jhon Borino",
      "message": "Terimakasih kak",
      "time_seen": "3 Minutes ago",
      "unread_count": 10,
      "type": "private"
    },
    {
      "id": 0,
      "photo": "assets/images/avatar-1.png",
      "title": "Pela Team",
      "message": "Hello guys",
      "time_seen": "3 Minutes ago",
      "unread_count": 10,
      "type": "group",
      "messages_users": [
        {
          "id": 0,
          "photo": "assets/images/avatar-1.png",
          "first_name": "Jhon Borino",
          "message": "Terimakasih kak",
          "time_seen": "3 Minutes ago",
          "unread_count": 10,
          "type": "private"
        },
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final getHeight = mediaQuery.size.height;
    final getWidht = mediaQuery.size.width;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return SafeArea(
      minimum: const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FadeInUp(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0.0),
                        hintText: 'Search foor messages',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                        prefixIcon: const Icon(
                          Iconsax.search_normal,
                          color: Colors.black,
                          size: 18,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        floatingLabelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[100],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Image(
                        image: AssetImage('assets/images/avatar-1.png'),
                      ),
                    ),
                    onTap: () {
                      // ignore: avoid_print
                      print("tap pp");
                    },
                  ),
                ],
              ), 
              const SizedBox(
                height: 15,
              ),
              const Text("Last Messages"),
              const SizedBox(
                height: 15,
              ),
              for (var index = 0; index < listData.length; index++) ...[
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    if ((listData[index]["type"] == "private")) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChatPage(userData: listData[index]),
                        ),
                      );
                    }
                  },
                  child: Ink(
                    width: getWidht,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xffF0F8FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SafeArea(
                      minimum: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueGrey[100],
                            backgroundImage:
                                AssetImage(listData[index]["photo"]),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (listData[index]["type"] == "private")
                                      ? listData[index]["first_name"]
                                      : listData[index]["title"],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  listData[index]["message"],
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  listData[index]["time_seen"],
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  constraints: const BoxConstraints(
                                    maxHeight: double.infinity,
                                    maxWidth: double.infinity,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFF5216),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: SafeArea(
                                    minimum: const EdgeInsets.all(4.0),
                                    child: Text(
                                      listData[index]["unread_count"]
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
