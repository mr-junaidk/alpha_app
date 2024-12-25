import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:badges/badges.dart' as badges;
import 'package:alpha_app/models/chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:alpha_app/custom_widgets/custom_widgets.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';


class OverviewScreen extends StatefulWidget {
  const OverviewScreen({super.key});

  @override
  State<OverviewScreen> createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

// Chart Data
  List<ActivityData> getActivityData() {
    return [
      ActivityData('MO', 7),
      ActivityData('TU', 12),
      ActivityData('WE', 8),
      ActivityData('TH', 18),
      ActivityData('FR', 32),
      ActivityData('SA', 20),
      ActivityData('SU', 28),
    ];
  }

  List<ActivityBarData> getActivityDataPurple() {
    return [
      ActivityBarData('Mon', 22, const Color(0xff826AF9)),
      ActivityBarData('Tue', 29, const Color(0xff826AF9)),
      ActivityBarData('Wed', 28, const Color(0xff826AF9)),
      ActivityBarData('Thu', 39, const Color(0xff826AF9)),
      ActivityBarData('Fri', 29, const Color(0xff826AF9)),
      ActivityBarData('Sat', 21, const Color(0xff826AF9)),
      ActivityBarData('Sun', 17, const Color(0xff826AF9)),
    ];
  }

  List<ActivityBarData> getActivityDataYellow() {
    return [
      ActivityBarData('Mon', 8, const Color(0xffFFD422)),
      ActivityBarData('Tue', 15, const Color(0xffFFD422)),
      ActivityBarData('Wed', 20, const Color(0xffFFD422)),
      ActivityBarData('Thu', 17, const Color(0xffFFD422)),
      ActivityBarData('Fri', 35, const Color(0xffFFD422)),
      ActivityBarData('Sat', 31, const Color(0xffFFD422)),
      ActivityBarData('Sun', 18, const Color(0xffFFD422)),
    ];
  }

  List<ActivityBarData> getActivityDataOrange() {
    return [
      ActivityBarData('Mon', 18, const Color(0xffFF9640)),
      ActivityBarData('Tue', 24, const Color(0xffFF9640)),
      ActivityBarData('Wed', 15, const Color(0xffFF9640)),
      ActivityBarData('Thu', 21, const Color(0xffFF9640)),
      ActivityBarData('Fri', 13, const Color(0xffFF9640)),
      ActivityBarData('Sat', 28, const Color(0xffFF9640)),
      ActivityBarData('Sun', 8, const Color(0xffFF9640)),
    ];
  }

// Social Media Data
  final List<Map<String, String>> dataList = [
    {
      'icon': 'twitter',
      'username': '@mitchell.cooper',
      'platform': 'Twitter',
      'info': '484,36K',
      'action': '2.79%',
      'additionalInfo': 'Followers',
    },
    {
      'icon': 'instagram',
      'username': '@sarah.smith',
      'platform': 'Instagram',
      'info': '484,36K',
      'action': '2.79%',
      'additionalInfo': 'Followers',
    },
    {
      'icon': 'facebook',
      'username': '@john.doe',
      'platform': 'Facebook',
      'info': '484,36K',
      'action': '2.79%',
      'additionalInfo': 'Followers',
    },
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Overview',
                    style: TextStyle(
                        fontFamily: 'Nunito Bold', fontSize: 28, color: Color(0xff1A1926)),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, blurRadius: 40),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Color(0xffb7b7bd),
                            borderSide: BorderSide(
                                width: 2,
                                color: Color(0xffFFFFFF)
                            )
                        ),
                        position: BadgePosition.topEnd(top: -1, end: -3),
                        child: SvgPicture.asset('assets/images/photo.svg', width: 24, height: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: const Color(0xffF2F4F7),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(10, 10),
                              blurRadius: 20,
                            )
                          ],
                          border: Border.all(
                            color: const Color(0xffE3E5E8),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/images/arrowdown.svg',
                          height: 20,
                          width: 20,
                        ),
                      )),
                  Container(
                    height: 48,
                    width: 279,
                    decoration: BoxDecoration(
                        color: const Color(0xffF2F4F7),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xffE3E5E8))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'This Week',
                          hintStyle: const TextStyle(
                              color: Color(0xFF28263B),
                              fontFamily: 'Nunito Regular',
                              fontSize: 15),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(13),
                            child: SvgPicture.asset(
                              'assets/images/arrowdown3.svg',
                              width: 18,
                              height: 18,
                            ),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                final data = dataList[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: Container(
                    height: 175,
                    width: 340,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: SvgPicture.asset('assets/images/${data['icon']}.svg'),
                            title: Text(
                              data['username']!,
                              style: const TextStyle(
                                fontFamily: 'Nunito SemiBold',
                                fontSize: 15,
                                color: Color(0xff1A1926),
                              ),
                            ),
                            subtitle: Text(
                              data['platform']!,
                              style: const TextStyle(
                                fontFamily: 'Nunito Regular',
                                fontSize: 14,
                                color: Color(0xff637085),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data['info']!,
                                style: const TextStyle(
                                  fontFamily: 'Nunito SemiBold',
                                  fontSize: 28,
                                  color: Color(0xff1A1926),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 90),
                                child: Container(
                                  height: 32,
                                  width: 87,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFC5344).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/images/arrowdown2.svg', height: 8, width: 8,),
                                        const SizedBox(width: 8,),
                                        Text(
                                          data['action']!,
                                          style: const TextStyle(
                                            fontFamily: 'Nunito SemiBold',
                                            color: Color(0xffFF6640),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            data['additionalInfo']!,
                            style: const TextStyle(
                              fontFamily: 'Nunito Regular',
                              fontSize: 15,
                              color: Color(0xff637085),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
            },
          ),
        ),
      ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                height: 498,
                width: 343,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Followers', style: TextStyle(fontSize: 20, fontFamily: 'Nunito SemiBold', color: Color(0xff1A1926))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: SvgPicture.asset('assets/images/More 2.svg'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '254.68K',
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Nunito SemiBold',
                                color: Color(0xff1A1926)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/images/arrowup.svg', height: 8, width: 8,),
                                      const SizedBox(width: 8,),
                                      const Text(
                                        '6.18%',
                                        style: TextStyle(
                                          fontFamily: 'Nunito SemiBold',
                                          color: Color(0xff24B26B),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildBar('M', 0.5),
                            buildBar('T', 0.6),
                            buildBar('W', 0.7),
                            buildBar('T', 0.8, isHighlighted: true),
                            buildBar('F', 0.5),
                            buildBar('S', 0.3),
                            buildBar('S', 0.7),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '834 ',
                                  style: TextStyle(color: Color(0xff31D482), fontSize: 24, fontFamily: 'Nunito SemiBold'),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(color: Color(0xff637085), fontSize: 15, fontFamily: 'Nunito Regular'),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '152',
                                  style: TextStyle(color: Color(0xffFF6640), fontSize: 24, fontFamily: 'Nunito SemiBold'),
                                ),
                                Text(
                                  'Unfollowed',
                                  style: TextStyle(color: Color(0xff637085), fontSize: 15, fontFamily: 'Nunito Regular'),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                height: 498,
                width: 343,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Gender', style: TextStyle(fontSize: 20, fontFamily: 'Nunito SemiBold', color: Color(0xff1A1926))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: SvgPicture.asset('assets/images/More 2.svg'),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Align(
                          alignment: Alignment.center,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SfCircularChart(
                                series: <CircularSeries>[
                                  DoughnutSeries<ChartData, String>(
                                    dataSource: [
                                      ChartData('Male', 42, const Color(0xff826AF9)),
                                      ChartData('Female', 58, const Color(0xffFFD422)),
                                    ],
                                    pointRadiusMapper: (ChartData data, _) => '100%',
                                    pointColorMapper: (ChartData data, _) => data.color,
                                    xValueMapper: (ChartData data, _) => data.category,
                                    yValueMapper: (ChartData data, _) => data.value,
                                    innerRadius: '110%',
                                    cornerStyle: CornerStyle.bothCurve,
                                    explode: true,
                                    explodeIndex: 1,
                                    explodeOffset: '2%',
                                  ),
                                ],
                              ),
                              Container(
                                height: 110,
                                width: 110,
                                decoration: const BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  shape: BoxShape.circle
                                ),
                                child: const Center(child: Text('🙋‍♀️', style: TextStyle(fontSize: 45),)),
                              ),
                              const CustomPositionedWidget(
                                percentageText: '58',
                                iconText: '%',
                                top: 140,
                                left: 5,
                              ),
                              const CustomPositionedWidget(
                                percentageText: '42',
                                iconText: '%',
                                top: 100,
                                left: 280,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/labelpurple.svg'),
                                const SizedBox(width: 8),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Male: ',
                                    style: TextStyle(color: Color(0xff637085), fontFamily: 'Nunito Regular', fontSize: 15),
                                    children: <TextSpan>[
                                      TextSpan(text: '352K', style: TextStyle(fontFamily: 'Nunito SemiBold', fontSize: 15, color: Color(0xff1A1926))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/labelyellow.svg'),
                                const SizedBox(width: 8),
                                RichText(
                                  text: const TextSpan(
                                    text: 'Female: ',
                                    style: TextStyle(color: Color(0xff637085), fontFamily: 'Nunito Regular', fontSize: 15),
                                    children: <TextSpan>[
                                      TextSpan(text: '352K', style: TextStyle(fontFamily: 'Nunito SemiBold', fontSize: 15, color: Color(0xff1A1926))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Container(
                width: 343,
                height: 498,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Activity', style: TextStyle(fontSize: 20, fontFamily: 'Nunito SemiBold', color: Color(0xff1A1926))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 14),
                            child: SvgPicture.asset('assets/images/More 2.svg'),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            '254.68K',
                            style: TextStyle(
                                fontSize: 32,
                                fontFamily: 'Nunito SemiBold',
                                color: Color(0xff1A1926)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xff55D46A).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/images/arrowup.svg', height: 8, width: 8,),
                                      const SizedBox(width: 8,),
                                      const Text(
                                        '6.18%',
                                        style: TextStyle(
                                          fontFamily: 'Nunito SemiBold',
                                          color: Color(0xff24B26B),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 550, // Adjust based on your needs
                            child: SfCartesianChart(
                              primaryXAxis: const CategoryAxis(
                                labelPlacement: LabelPlacement.onTicks,
                                majorGridLines: MajorGridLines(width: 0),
                                majorTickLines: MajorTickLines(
                                  width: 2,
                                  size: 7,
                                  color: Color(0xffE3E5E8),
                                ),
                                axisLine: AxisLine(width: 2, color: Color(0xffE3E5E8)),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff637085),
                                  fontFamily: 'Nunito Regular',
                                ),
                              ),
                              primaryYAxis: const NumericAxis(
                                majorGridLines: MajorGridLines(
                                  width: 2,
                                  color: Color(0xffE3E5E8),
                                  dashArray: <double>[6, 6],
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff637085),
                                  fontFamily: 'Nunito Regular',
                                ),
                                majorTickLines: MajorTickLines(
                                  width: 1,
                                  size: 20,
                                  color: Color(0xffFFFFFF),
                                ),
                                axisLine: AxisLine(width: 2, color: Color(0xffFFFFFF)),
                                minimum: 0,
                                maximum: 40,
                                interval: 10,
                              ),
                              series: <CartesianSeries>[
                                SplineAreaSeries<ActivityData, String>(
                                  dataSource: getActivityData(),
                                  xValueMapper: (ActivityData data, _) => data.day,
                                  yValueMapper: (ActivityData data, _) => data.value,
                                  color: const Color(0xffFF9640).withOpacity(0.12),
                                  borderColor: const Color(0xffFF9640),
                                  borderWidth: 5,
                                ),
                              ],
                              trackballBehavior: TrackballBehavior(
                                enable: true,
                                activationMode: ActivationMode.singleTap,
                                lineDashArray: const <double>[6, 6],
                                markerSettings: const TrackballMarkerSettings(
                                  markerVisibility: TrackballVisibilityMode.visible,
                                  height: 12,
                                  width: 12,
                                  color: Color(0xffFF9640),
                                  borderWidth: 4,
                                  borderColor: Color(0xffFFFFFF),
                                ),
                                tooltipSettings: const InteractiveTooltip(
                                  enable: true,
                                ),
                                builder: (BuildContext context, TrackballDetails trachballDetails ){
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 75,
                                        width: 158,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black12.withOpacity(0.2),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: const Column(
                                          children: [
                                            Text(
                                              '\$1.000',
                                              style: TextStyle(
                                                fontFamily: 'Nunito Regular',
                                                fontSize: 15,
                                                color: Color(0xff1A1926),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              '23 August, 2021',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff637085),
                                                fontFamily: 'Nunito Regular'
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomPaint(
                                        painter: TrianglePainter(),
                                      ),
                                    ],
                                  );
                                }
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              child: Container(
                width: 343,
                height: 552,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: Text('Statistics', style: TextStyle(fontSize: 20, fontFamily: 'Nunito SemiBold', color: Color(0xff1A1926))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: Container(
                        height: 48,
                        width: 348,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xffE3E5E8))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'This Week',
                              hintStyle: const TextStyle(
                                  color: Color(0xFF28263B),
                                  fontFamily: 'Nunito Regular',
                                  fontSize: 15),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(13),
                                child: SvgPicture.asset(
                                  'assets/images/arrowdown3.svg',
                                  width: 18,
                                  height: 18,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 550, // Adjust based on your needs
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 16,),
                                        child: Text('Share', style: TextStyle(fontSize: 15, fontFamily: 'Nunito Regular', color: Color(0xff637085)),),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '19,068',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontFamily: 'Nunito SemiBold',
                                                color: Color(0xff1A1926)
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0, left: 16),
                                            child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: const Color(0xff55D46A).withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset('assets/images/arrowup.svg', height: 8, width: 8,),
                                                      const SizedBox(width: 8,),
                                                      const Text(
                                                        '6.18%',
                                                        style: TextStyle(
                                                          fontFamily: 'Nunito SemiBold',
                                                          color: Color(0xff24B26B),
                                                          fontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 100,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 16, ),
                                      child: Text('Likes', style: TextStyle(fontSize: 15, fontFamily: 'Nunito Regular', color: Color(0xff637085)),),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16),
                                    child: Row(
                                      children: [
                                        const Text(
                                          '34,368',
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontFamily: 'Nunito SemiBold',
                                              color: Color(0xff1A1926)
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 8.0, left: 16),
                                          child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFC5344).withOpacity(0.1),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 8.0),
                                                child: Row(
                                                  children: [
                                                    SvgPicture.asset('assets/images/arrowdown2.svg', height: 8, width: 8,),
                                                    const SizedBox(width: 8,),
                                                    const Text(
                                                      '6.18%',
                                                      style: TextStyle(
                                                        fontFamily: 'Nunito SemiBold',
                                                        color: Color(0xffFF6640),
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 900, // Adjust based on your needs
                          child: SfCartesianChart(
                            primaryXAxis: const CategoryAxis(
                              majorGridLines: MajorGridLines(width: 0),
                              majorTickLines: MajorTickLines(
                                width: 2,
                                size: 7,
                                color: Color(0xffE3E5E8),
                              ),
                              axisLine: AxisLine(width: 2, color: Color(0xffE3E5E8)),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xff637085),
                                fontFamily: 'Nunito Regular',
                              ),
                            ),
                            primaryYAxis: const NumericAxis(
                              majorGridLines: MajorGridLines(
                                width: 2,
                                color: Color(0xffE3E5E8),
                                dashArray: <double>[6, 6],
                              ),
                              labelStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xff637085),
                                fontFamily: 'Nunito Regular',
                              ),
                              majorTickLines: MajorTickLines(
                                width: 1,
                                size: 20,
                                color: Color(0xffFFFFFF),
                              ),
                              axisLine: AxisLine(width: 2, color: Color(0xffFFFFFF)),
                              minimum: 0,
                              maximum: 40,
                              interval: 10,
                            ),
                            series: <CartesianSeries>[
                              // First Bar Group (Purple Bars)
                              ColumnSeries<ActivityBarData, String>(
                                dataSource: getActivityDataPurple(),
                                xValueMapper: (ActivityBarData data, _) => data.day,
                                yValueMapper: (ActivityBarData data, _) => data.value,
                                pointColorMapper: (ActivityBarData data, _) => data.color,
                                width: 0.6,
                                borderRadius: BorderRadius.circular(15),
                                spacing: 0.3,
                              ),
                              // Second Bar Group (Yellow Bars)
                              ColumnSeries<ActivityBarData, String>(
                                dataSource: getActivityDataYellow(),
                                xValueMapper: (ActivityBarData data, _) => data.day,
                                yValueMapper: (ActivityBarData data, _) => data.value,
                                pointColorMapper: (ActivityBarData data, _) => data.color,
                                width: 0.6,
                                borderRadius: BorderRadius.circular(15),
                                spacing: 0.3,
                              ),
                              // Third Bar Group (Orange Bars)
                              ColumnSeries<ActivityBarData, String>(
                                dataSource: getActivityDataOrange(),
                                xValueMapper: (ActivityBarData data, _) => data.day,
                                yValueMapper: (ActivityBarData data, _) => data.value,
                                pointColorMapper: (ActivityBarData data, _) => data.color,
                                width: 0.6,
                                borderRadius: BorderRadius.circular(15),
                                spacing: 0.3,
                              ),
                            ],
                            tooltipBehavior: TooltipBehavior(
                              enable: true,
                              activationMode: ActivationMode.singleTap,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
      ],
        ),
      ),
    );
  }
}


















