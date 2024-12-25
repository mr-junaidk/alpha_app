import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:alpha_app/screens/chat_screen.dart';
import 'package:alpha_app/custom_widgets/custom_widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';


class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final TextEditingController _searchController = TextEditingController();
  final _advancedDrawerController = AdvancedDrawerController();
  String searchText = '';

  List<Map<String, String>> pinnedMessages = [
    {'name': 'Alphaboard', 'message': 'Jane: Hello, Mark!', 'count': '3', 'svg': 'assets/images/alphaboard.svg'},
    {'name': 'Design Team', 'message': 'You: Can you drop the...', 'count': '2', 'svg': 'assets/images/designteam.svg'},
    {'name': 'Dustin Williamson', 'message': 'Dustin is typing...', 'count': '5', 'svg': 'assets/images/avatar3.svg'},
  ];

  List<Map<String, String>> allMessages = [
    {'name': 'Jane Wilson', 'message': 'Hi! How are you?', 'count': '0', 'svg': 'assets/images/avatar10.svg'},
    {'name': 'Brandon Pena', 'message': 'How about going somewhere?', 'count': '0', 'svg': 'assets/images/avatar2.svg'},
    {'name': 'Nathan Fox', 'message': 'We have a meeting...', 'count': '0', 'svg': 'assets/images/avatar4.svg'},
    {'name': 'Jacob Hawkins', 'message': 'Well done! 👍', 'count': '1', 'svg': 'assets/images/avatar3.svg'},
    {'name': 'Shane Black', 'message': 'Paul is having a party...', 'count': '0', 'svg': 'assets/images/avatar5.svg'},
    {'name': 'Priscilla Edwards', 'message': 'It\'s up to you.', 'count': '0', 'svg': 'assets/images/avatar9.svg'},
    {'name': 'Kristin Mccoy', 'message': 'It looks amazing!', 'count': '0', 'svg': 'assets/images/avatar8.svg'},
    {'name': 'Bruce Russell', 'message': 'Any progress on the...', 'count': '3', 'svg': 'assets/images/avatar1.svg'},
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      animationCurve: Curves.linear,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: false,
      rtlOpening: false,
      openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      drawer: const MyCustomDrawer(),
      child: Scaffold(
        backgroundColor: const Color(0xffF2F4F7),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffE3E5E8),
                  width: 1,
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: const Color(0xffF2F4F7),
              leading: IconButton(
                icon: SvgPicture.asset('assets/images/Menu.svg', width: 24, height: 24),
                onPressed: () {
                  _advancedDrawerController.showDrawer();
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/Search.svg', height: 22, width: 22),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/Setting.svg', height: 22, width: 22),
                ),
                IconButton(
                  onPressed: () {},
                  icon: badges.Badge(
                    position: BadgePosition.topEnd(top: -3, end: 1),
                    badgeStyle: const BadgeStyle(
                        borderSide: BorderSide(
                            width: 2,
                            color: Color(0xffF2F4F7)
                        )
                    ),
                    child: SvgPicture.asset('assets/images/Notification.svg', width: 24, height: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15, left: 16, right: 16),
                  child: VerticalDivider(width: 1, color: Color(0xffE3E5E8)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/images/avatar2.svg', height: 40, width: 40),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Container(
                  width: 450,
                  decoration: const BoxDecoration(
                    color: Color(0xffF1F3F7),
                    border: Border(
                      top: BorderSide(
                        color: Color(0xffE3E5E8),
                        width: 1,
                      ),
                      bottom: BorderSide(
                        color: Color(0xffE3E5E8),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: const TextStyle(color: Color(0xFF637085), fontFamily: 'Nunito Regular', fontSize: 15),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(
                            'assets/images/Search.svg',
                            width: 22,
                            height: 22,
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchText = value.toLowerCase();
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 42, bottom: 16),
              child: Text('PINNED', style: TextStyle(fontSize: 15, fontFamily: 'Nunito SemiBold', color: Color(0xff637085))),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSection('Pinned Messages', pinnedMessages),
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 42, bottom: 16),
                    child: Text('ALL MESSAGES', style: TextStyle(fontSize: 15, fontFamily: 'Nunito SemiBold', color: Color(0xff637085))),
                  ),
                  buildSection('All Messages', allMessages),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSection(String title, List<Map<String, String>> messages) {
    return Column(
      children: messages
          .where((msg) => msg['name']!.toLowerCase().contains(searchText) || msg['message']!.toLowerCase().contains(searchText))
          .map((msg) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            height: 110,
            width: 370,
            decoration: BoxDecoration(
              color: const Color(0xffF5F7FA),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 18, left: 8, right: 6),
              child: ListTile(
                leading: SvgPicture.asset(
                  msg['svg']!,
                  width: 40,
                  height: 40,
                ),
                title: Text(msg['name']!),
                titleTextStyle: const TextStyle(fontSize: 15, fontFamily: 'Nunito Regular', color: Color(0xff1A1926)),
                subtitle: Text(msg['message']!),
                subtitleTextStyle: const TextStyle(fontSize: 15, fontFamily: 'Nunito Regular', color: Color(0xff637085)),
                trailing: msg['count'] != '0'
                    ? CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(msg['count']!, style: const TextStyle(color: Colors.white, fontSize: 12)),
                )
                    : null,
                onTap: () {
                  setState(() {

                  });
                  if ( msg['name']! == 'Alphaboard') {
                    Navigator.push(context, MaterialPageRoute(builder: (covariant) => const ChatScreen()));
                  }
                },
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
