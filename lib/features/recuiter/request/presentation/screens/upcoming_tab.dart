

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class UpcomingUpcomimngBookingsTab extends StatefulWidget {
  const UpcomingUpcomimngBookingsTab({Key? key}) : super(key: key);

  @override
  State<UpcomingUpcomimngBookingsTab> createState() =>
      _UpcomingUpcomimngBookingsTabState();
}

class _UpcomingUpcomimngBookingsTabState
    extends State<UpcomingUpcomimngBookingsTab> {


  @override
  void initState() {
    super.initState();
  
    // your API call method
  }



  String formatDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }



 

  

    // final statuses = await [
    //   Permission.camera,
    //   Permission.microphone,
    // ].request();

    // if (statuses[Permission.camera]!.isDenied ||
    //     statuses[Permission.microphone]!.isDenied) {
    //   Get.snackbar("Permissions required", "Please allow camera and mic.");
    //   return;
    // }

  Widget _buildHardcodedCard() {
    // DateTime startDate = DateTime.parse(booking.startTime);
    // DateTime endtimeutc = DateTime.parse(booking.endTime);

    // DateTime starttimelocal = startDate.toLocal();
    // DateTime endtimelocal = endtimeutc.toLocal();

    // String formattedDate = formatDate(startDate);
    // String formatedstarttime = DateFormat('hh:mm a').format(starttimelocal);
    // String formatedendtime = DateFormat('hh:mm a').format(endtimelocal);
    // bool canjoin =
    //     DateTime.now().isAfter(starttimelocal.subtract(Duration(minutes: 10)));

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue[100],
                  child: Icon(Icons.person, color: Colors.blue[700], size: 30),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Harsh ji',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      // Text('Fitness Coach',
                      //     style:
                      //         TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(12)),
                  child: Text('Upcoming',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal[700])),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!)),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue[600], size: 20),
                  const SizedBox(width: 8),
                  Text("12-sep",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700])),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!)),
              child: Row(
                children: [
                  Icon(Icons.timer, color: Colors.blue[600], size: 20),
                  const SizedBox(width: 8),
                  Text("12:00  to 7:00 PM",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700])),
                ],
              ),
            ),
          //   const SizedBox(height: 16),
          //   SizedBox(
          //     width: double.infinity,
          //     child: ElevatedButton.icon(
          //       onPressed: () => canjoin
          //           ? joinMeeting(booking.coachVideoLink.toString())
          //           :

          //           ///
          //           Get.snackbar(
          //               "⏳ Unable to Join",
          //               "You can only join the meeting 10 minutes before the start time.",
          //               snackPosition: SnackPosition.BOTTOM,
          //               backgroundColor: Colors.redAccent.shade100,
          //               colorText: Colors.white,
          //               icon: const Icon(Icons.lock_clock, color: Colors.white),
          //               margin: const EdgeInsets.all(16),
          //               borderRadius: 12,
          //               duration: const Duration(seconds: 4),
          //               isDismissible: true,
          //               forwardAnimationCurve: Curves.easeOutBack,
          //               reverseAnimationCurve: Curves.easeInBack,
          //             ),
          //       icon: const Icon(Icons.video_call, color: Colors.white),
          //       label: const Text('Join Meeting',
          //           style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w600,
          //               color: Colors.white)),
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: AppColors.primaryColor,
          //         padding: const EdgeInsets.symmetric(vertical: 12),
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(8)),
          //       ),
          //     ),
          //   ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
   
      

      //final bookings = controller.bookingmodelcompleted.value?.data ?? [];

      return SingleChildScrollView(
        child: Column(
          children: [
           // if (bookings.isEmpty)
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const SizedBox(height: 50),
              //       Icon(Icons.calendar_today_outlined,
              //           size: 64, color: Colors.grey[400]),
              //       const SizedBox(height: 16),
              //       Text(
              //         'No other upcoming bookings',
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Colors.grey[600],
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // )
           // else
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, i) {
               //   final booking = bookings[i];
                 // return _buildHardcodedCard(booking);
                 return _buildHardcodedCard();
                },
              ),
          ],
        ),
      );
    
  
  
  
  }
}


