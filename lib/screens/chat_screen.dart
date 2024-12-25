import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:alpha_app/custom_widgets/custom_widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

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
          body: ListView(
            children: const [

            ],
          ),
        )
    );
  }
}
