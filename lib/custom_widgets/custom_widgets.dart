import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:alpha_app/screens/calendar_screen.dart';
import 'package:alpha_app/screens/chat_list_screen.dart';
import 'package:alpha_app/screens/overview_screen.dart';


// Custom Drawer
class MyCustomDrawer extends StatefulWidget {
  const MyCustomDrawer({super.key});

  @override
  _MyCustomDrawerState createState() => _MyCustomDrawerState();
}

class _MyCustomDrawerState extends State<MyCustomDrawer> {
  List<String> calendarItems = ["Important", "Meeting", "Event", "Work", "Other"];
  int unreadMails = 8;
  String _selectedMenuItem = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Color(0xffE3E5E8),
            width: 1,
          ),
        ),
      ),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: const Color(0xffF2F4F7),
        child: ListView(
          padding: const EdgeInsets.only(top: 20),
          children: [
            buildCompanyHeader(),
            const SizedBox(height: 10),
            buildMenuItem('assets/images/Overview.svg', 'Overview'),
            buildMenuItem('assets/images/Cart.svg', 'E-Commerce'),
            buildMenuItem('assets/images/Calendar.svg', 'Calendar'),
            buildMailSection('assets/images/Mail.svg', 'Mail'),
            buildMenuItem('assets/images/Chat.svg', 'Chat'),
            buildMenuItem('assets/images/Tasks.svg', 'Tasks'),
            buildMenuItem('assets/images/Projects.svg', 'Projects'),
            buildMenuItem('assets/images/File Manager.svg', 'File Manager'),
            buildMenuItem('assets/images/Notes.svg', 'Notes'),
            buildMenuItem('assets/images/Contacts.svg', 'Contacts'),
            buildCalendarSection('CALENDAR'),
          ],
        ),
      ),
    );
  }

  Widget buildCompanyHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Row(
        children: [
          SvgPicture.asset('assets/images/logo.svg', width: 32, height: 30),
          const SizedBox(width: 10),
          const Text(
            'alpha',
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Comfortaa',
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(String svgPath, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 20),
        child: HoverContainer(
          height: 60,
          hoverDecoration: BoxDecoration(
            color: const Color(0xffE0E0E0),
            borderRadius: BorderRadius.circular(10),
          ),
          decoration: BoxDecoration(
            color: _selectedMenuItem == title ? const Color(0xff1A8EFF).withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            trailing: Padding(
              padding: const EdgeInsets.only(right: 13),
              child: title == 'E-Commerce'
                  ? const Icon(Icons.arrow_forward_ios, color: Color(0xff1A1926), size: 12)
                  : const Visibility(
                  visible: false,
                  child: Icon(Icons.arrow_forward_ios, color: Color(0xffF2F4F7), size: 12,)),
            ),
            leading: SvgPicture.asset(svgPath, width: 24, height: 24),
            title: Text(
              title,
              style: const TextStyle(
                color: Color(0xff1A1926),
                fontFamily: 'Nunito SemiBold',
                fontSize: 15,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedMenuItem = title;
              });
              if (title == 'Calendar') {
                Navigator.push(context, MaterialPageRoute(builder: (covariant) => const CalendarScreen()));
              }else if(title == 'Chat') {
                Navigator.push(context, MaterialPageRoute(builder: (covariant) => const ChatListScreen()));
              }else if(title == 'Overview') {
                Navigator.push(context, MaterialPageRoute(builder: (covariant) => const OverviewScreen()));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildMailSection(String svgPath, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 20),
        child: HoverContainer(
          height: 60,
          hoverDecoration: BoxDecoration(
            color: const Color(0xffE0E0E0),
            borderRadius: BorderRadius.circular(10),
          ),
          decoration: BoxDecoration(
            color: _selectedMenuItem == title ? const Color(0xff1A8EFF).withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            trailing: Padding(
              padding: const EdgeInsets.only(right: 13),
              child: badges.Badge(
                badgeStyle: const BadgeStyle(badgeColor: Color(0xffFF6640)),
                badgeContent: Text(unreadMails.toString(),
                    style: const TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Nunito Bold', fontSize: 11)),
              ),
            ),
            leading: SvgPicture.asset(svgPath, width: 24, height: 24),
            title: Text(
              title,
              style: const TextStyle(
                color: Color(0xff1A1926),
                fontFamily: 'Nunito SemiBold',
                fontSize: 15,
              ),
            ),
            onTap: () {
              setState(() {
                _selectedMenuItem = title;
              });
            },
          )
          ,
        ),
      ),
    );
  }


  Widget buildCalendarSection(String title) {
    List<Map<String, dynamic>> calendarData = [
      {"item": "Important", "color": const Color(0xffFF6640)},
      {"item": "Meeting", "color": const Color(0xffFF9640)},
      {"item": "Event", "color": const Color(0xff31D482)},
      {"item": "Work", "color": const Color(0xff826AF9)},
      {"item": "Other", "color": const Color(0xffC6C8CC)},
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 16),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 20),
            child: HoverContainer(
              height: 60,
              hoverDecoration: BoxDecoration(
                color: const Color(0xffE0E0E0),
                borderRadius: BorderRadius.circular(10),
              ),
              decoration: BoxDecoration(
                color: _selectedMenuItem == title ? const Color(0xff1A8EFF).withOpacity(0.1) : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff637085),
                    fontSize: 15,
                    fontFamily: 'Nunito SemiBold',
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 13),
                  child: IconButton(
                    icon: const Icon(Icons.add, color: Color(0xff637085)),
                    onPressed: () {
                      setState(() {
                        calendarItems.add("New Item");
                      });
                    },
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedMenuItem = title;
                  });
                },
              ),
            ),
          ),
        ),
        ...calendarData.map((data) {
          return buildCalendarItem(data["item"], data["color"]);
        }),
        const SizedBox(height: 466),
      ],
    );
  }

  Widget buildCalendarItem(String item, Color circleColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 42, top: 10),
      child: Row(
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(item, style: const TextStyle(color: Color(0xff1A1926))),
        ],
      ),
    );
  }
}



// Followers Bar
Widget buildBar(String label, double value, {bool isHighlighted = false}) {
  return Column(
    children: [
      Container(
        height: 200,
        width: 16,
        decoration: BoxDecoration(
          color: isHighlighted ? const Color(0xffFF9640) : const Color(0xff826AF9),
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [const Color(0xff826AF9), const Color(0xffF0F1F5).withOpacity(0.5)],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: value,
            child: Container(
              decoration: BoxDecoration(
                color: isHighlighted ? const Color(0xffFF9640) : const Color(0xff826AF9),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(fontSize: 14, fontFamily: 'Nunito Regular', color: Color(0xff637085)),),
    ],
  );
}

//Positioned Widget
class CustomPositionedWidget extends StatelessWidget {
  final String percentageText;
  final String iconText;
  final double top;
  final double left;

  const CustomPositionedWidget({
    super.key,
    required this.percentageText,
    required this.iconText,
    required this.top,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 56,
        width: 56,
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(10, 10),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: percentageText,
              style: const TextStyle(
                  fontSize: 15, fontFamily: 'Nunito Regular', color: Color(0xff1A1926)),
              children: <TextSpan>[
                TextSpan(
                  text: iconText,
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Nunito Regular',
                      color: Color(0xff637085)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Popover Bottom Container
class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(10, 10)
      ..lineTo(20, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}