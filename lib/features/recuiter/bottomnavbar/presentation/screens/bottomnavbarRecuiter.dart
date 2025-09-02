import 'package:event_demo_mac/features/recuiter/addevent/presentation/screens/addeventUI.dart';
import 'package:event_demo_mac/features/recuiter/events/presentation/screens/getevent.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/screens/requestrecuiter.dart';
import 'package:event_demo_mac/features/user/botoomnavbar/presentation/controller/bloc/bottom_navigation_bar_bloc.dart';
import 'package:event_demo_mac/features/user/home/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarRecuiter extends StatelessWidget {
  BottomNavBarRecuiter({super.key});

  final List<Widget> screens = [
    GetEvent(),
    AddEventRecuiter(),
    RequestCaregiverScreen(),
    AddEventRecuiter(),
      AddEventRecuiter (),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.currentindex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                currentIndex: state.currentindex,
                onTap: (index) {
                  context.read<BottomNavigationBarBloc>().add(
                    BottomNavTabchanged(index),
                  );
                },
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedItemColor: Color(0xff0D141C),
                unselectedItemColor: Color(0xff4F7096),
                unselectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4F7096),
                ),
                selectedLabelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D141C),
                ),
                items: [
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assests/images/events_logo.png'),
                      size: 28,
                    ),
                    label: "Events",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assests/images/events_logo.png'),
                      size: 28,
                    ),
                    label: "Add Event",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assests/images/events_logo.png'),
                      size: 28,
                    ),
                    label: "Requests",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assests/images/events_logo.png'),
                      size: 28,
                    ),
                    label: "Wallet",
                  ),

                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assests/images/profile_logo.png'),
                      size: 28,
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
