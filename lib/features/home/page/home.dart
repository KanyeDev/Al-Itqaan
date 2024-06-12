import 'package:alitqaan/core/services/firebase_auth_services.dart';
import 'package:alitqaan/features/auth/login/page/login_page.dart';
import 'package:alitqaan/features/notification/page/notification_page.dart';
import 'package:alitqaan/features/profile/page/profile_page.dart';
import 'package:alitqaan/features/time_table/page/time_table_page.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utility/pageRoutes.dart';
import '../widget/my_buttom_nav.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int visit = 0;

  Widget setWidgetToRender = const HomePage();

  Widget? getWidget() {
    Widget? render;

    render = setWidgetToRender;
    return render;
  }


  Future<void> setWidget(int index) async {
    if (index == 0) {
      setState(() {
        setWidgetToRender = const HomePage(); //home page
      });
    } else if (index == 1) {
      setState(() {
        setWidgetToRender = const TimeTablePage(); //TimeTable page
      });
    } else if (index == 2) {
      setState(() {
        setWidgetToRender = const NotificationPage(); //Notification page
      });
    } else {
      setState(() {
        setWidgetToRender =  ProfilePage(); //Profile page
      });
    }
  }


  List<TabItem> items = const [
    TabItem(icon: Icons.home_outlined, title: "Home"),
    TabItem(icon: Icons.calendar_month_outlined, title: "Time table"),
    TabItem(icon: Icons.notifications_outlined, title: "Notification"),
    TabItem(icon: FontAwesomeIcons.circleUser, title: "Profile")
  ];




  void logout()async{
    await FirebaseAuthServices().signOut().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          CustomPageRouteLR(
              child: const LoginPage(),
              direction: AxisDirection.right), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      extendBodyBehindAppBar: true,
      body:  SingleChildScrollView(
        child: Column(
          children: [
           setWidgetToRender,
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavBar(
            onTap: (int index) {
              setState(() {
                visit = index;
                setWidget(visit);
              });
              return null;
            },
            visit: visit,
            items: items,
          ),
          Positioned(
            right: MediaQuery.of(context).size.width / 2.7 , // Adjust this value based on the number of items and positioning
            bottom: MediaQuery.of(context).size.height / 20, // Adjust based on icon size and positioning
            child: Visibility(
              visible: visit != 2, // Only show badge when not on the notification tab
              child: const CircleAvatar(
                radius: 7,
                backgroundColor: Colors.red,
                child: Center(
                  child: Text(
                    '3', // This is where you can dynamically display the number of notifications
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
        
    );
  }
}
