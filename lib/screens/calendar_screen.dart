import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hovering/hovering.dart';
import 'package:badges/badges.dart' as badges;
import 'package:alpha_app/custom_widgets/custom_widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  String selectedItem = '';

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
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 16, left: 20),
                    child: Text(
                      'Calendar',
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Nunito SemiBold',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: const Color(0xffE8EAED),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildMonthWeekDay('Month', const Color(0xff1A1926)),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8),
                              child: VerticalDivider(width: 1, color: Color(0xffE3E5E8)),
                            ),
                            buildMonthWeekDay('Week', const Color(0xff637085)),
                            const Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8),
                              child: VerticalDivider(width: 1, color: Color(0xffE3E5E8)),
                            ),
                            buildMonthWeekDay('Day', const Color(0xff637085)),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xff2D99FF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 22,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    height: 380,
                    width: 380,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ]),
                    child: Expanded(
                      child: CalendarCarousel<Event>(
                        onDayPressed: (DateTime date, List<Event> events) {
                        },
                        weekdayTextStyle: const TextStyle(
                          color: Color(0xff637085),
                          fontFamily: 'Nunito Regular',
                          fontSize: 14,

                        ),
                        showOnlyCurrentMonthDate: true,
                        weekendTextStyle: const TextStyle(
                            color: Color(0xff28263B),
                            fontFamily: 'Nunito Regular',
                            fontSize: 14
                        ),
                        dayButtonColor: const Color(0xffF5F7FA),
                        daysTextStyle: const TextStyle(
                            color: Color(0xff28263B),
                            fontFamily: 'Nunito Regular',
                            fontSize: 14
                        ),
                        headerTextStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff28263B),
                            fontFamily: 'Nunito SemiBold'
                        ),
                        selectedDateTime: DateTime.now(),
                        daysHaveCircularBorder: true,
                        selectedDayButtonColor: const Color(0xff2D99FF),
                        markedDateShowIcon: true,
                        markedDateIconBuilder: (event) {
                          return event.icon;
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 14),
                        child: Text(
                          'Upcoming',
                          style: TextStyle(
                            color: Color(0xff1A1926),
                            fontSize: 24,
                            fontFamily: 'Nunito Bold',
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildTimeSlot(
                          '07:00',
                          '07:30',
                          '08:00',
                          'Brandbook and Guidebook',
                          'Design',
                          '07:00',
                          ['assets/images/avatar1.svg', 'assets/images/avatar2.svg', 'assets/images/avatar3.svg', 'assets/images/avatar4.svg'],
                          const Color(0xffFF9640) // Divider color
                      ),
                      _buildTimeSlot(
                          '08:30',
                          '09:00',
                          '09:30',
                          'App Development',
                          'Coding',
                          '08:30',
                          ['assets/images/avatar4.svg', 'assets/images/avatar5.svg', 'assets/images/avatar3.svg', 'assets/images/avatar2.svg'],
                          const Color(0xff31D482) // Divider color
                      ),
                      _buildTimeSlot(
                          '10:00',
                          '10:30',
                          '11:00',
                          'Landing Page',
                          'Meeting',
                          '10:00',
                          ['assets/images/avatarupper.svg', 'assets/images/avatar7.svg', 'assets/images/avatar8.svg', 'assets/images/avatar9.svg'],
                          const Color(0xff826AF9) // Divider color
                      ),
                      _buildTimeSlot(
                          '11:30',
                          '12:00',
                          '12:30',
                          'Project "Rocket"',
                          'Meeting',
                          '11:30',
                          ['assets/images/avatar10.svg', 'assets/images/avatar1.svg', 'assets/images/avatar5.svg', 'assets/images/avatar9.svg'],
                          const Color(0xffFFD422) // Divider color
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
  Widget buildMonthWeekDay(String title, Color textColor){
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: HoverContainer(
        height: 40,
        width: 90,
        hoverDecoration: BoxDecoration(
          color: const Color(0xffE0E0E0),
          borderRadius: BorderRadius.circular(12),
        ),
        decoration: BoxDecoration(
          color: selectedItem == title ? const Color(0xffFFFFFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 22, top: 8),
          child: InkWell(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Nunito SemiBold',
                color: textColor,
              ),
            ),
            onTap: (){
              setState(() {
                selectedItem = title;
              });
            },
          ),
        ),
      ),
    );

  }
}



Widget _buildTimeSlot(String time, String time1, String time2, String title, String category, String eventTime, List<String> svgPaths, Color dividerColor) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
                width: 50,
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xff28263B),
                        fontSize: 14,
                        fontFamily: 'Nunito Regular',
                      ),
                    ),
                    Text(
                      time1,
                      style: const TextStyle(
                        color: Color(0xff28263B),
                        fontSize: 14,
                        fontFamily: 'Nunito Regular',
                      ),
                    ),
                    Text(
                      time2,
                      style: const TextStyle(
                        color: Color(0xff28263B),
                        fontSize: 14,
                        fontFamily: 'Nunito Regular',
                      ),
                    ),
                  ],
                )
            ),
          ),
          Expanded(
            child: Container(
              width: 290,
              height: 116,
              margin: const EdgeInsets.symmetric(vertical: 25),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2, right: 12),
                        child: VerticalDivider(
                          thickness: 4,
                          color: dividerColor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Color(0xff1A1926),
                              fontFamily: 'Nunito SemiBold',
                              fontSize: 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Row(
                              children: [
                                Text(
                                  category,
                                  style: const TextStyle(
                                    color: Color(0xff637085),
                                    fontFamily: 'Nunito Regular',
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SvgPicture.asset('assets/images/Time.svg', height: 16, width: 16),
                                const SizedBox(width: 4),
                                Text(
                                  eventTime,
                                  style: const TextStyle(
                                    color: Color(0xff637085),
                                    fontFamily: 'Nunito Regular',
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: svgPaths.map((path) => Padding(
                                padding: const EdgeInsets.only(right: 1),
                                child: CircleAvatar(
                                  radius: 16,
                                  child: SvgPicture.asset(
                                    path,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              )).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
