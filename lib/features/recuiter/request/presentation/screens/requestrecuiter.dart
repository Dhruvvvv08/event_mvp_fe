import 'package:event_demo_mac/features/recuiter/request/presentation/controller/bloc/request_recuiter_bloc.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/screens/completed_tab.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/screens/pending_tab.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/screens/upcoming_tab.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/widgets/request_header.dart';
import 'package:event_demo_mac/features/recuiter/request/presentation/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCaregiverScreen extends StatelessWidget {
  const RequestCaregiverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final  controller = Get.put(RequestCaregiverController(repository: CaregiverRepository()));

    return BlocBuilder<RequestRecuiterBloc, RequestRecuiterState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              // Added space above header
              SizedBox(height: 44),

              // Header with decorative line
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RequestHeader(
                  title: 'Requests',
                  icon: Icons.request_page_rounded,
                  color: Colors.teal,
                ),
              ),

              // Pill-shaped tab bar with drop shadow like in the image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTabBar(
                  tabs: ['Upcoming', 'Pending', 'Completed'],
                  selectedIndex: state.currentindex,
                  onTabChanged: (index){
context.read<RequestRecuiterBloc>().add(TabchangedEvent(index));
                  },
                  activeColor: Colors.teal, // Match the orange from the image
                ),
              ),

              // Tab content
              Expanded(child: _buildTabContent(state.currentindex)),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildTabContent(int index) {
  // This would normally depend on the selected tab index and fetch appropriate data
  switch (index) {
    case 0: // Upcoming
      return UpcomingUpcomimngBookingsTab();

    // EmptyState(
    //   title: 'No Upcoming Requests',
    //   message: 'You don\'t have any upcoming caregiver requests at the moment.',
    //   icon: Icons.event_available,
    // );
    case 1: // Pending
      return UpcomingPendingBookingsTab();

    // EmptyState(
    //   title: 'No Pending Requests',
    //   message: 'You don\'t have any pending caregiver requests waiting for approval.',
    //   icon: Icons.pending_actions,
    // );
    case 2: // Cancelled
      return UpcomingCompletedBookingsTab();

    // EmptyState(
    //   title: 'No Completed Requests',
    //   message: 'You don\'t have any Completed caregiver requests.',
    //   icon: Icons.cancel_outlined,
    // );
    default:
      return SizedBox();
  }
}
