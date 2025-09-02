
import 'package:event_demo_mac/core/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class UpcomingPendingBookingsTab extends StatefulWidget {
  const UpcomingPendingBookingsTab({Key? key}) : super(key: key);

  @override
  State<UpcomingPendingBookingsTab> createState() => _UpcomingPendingBookingsTabState();
}

class _UpcomingPendingBookingsTabState extends State<UpcomingPendingBookingsTab> {


  @override
  void initState() {
    super.initState();
    // controller = Get.put(RequestCaregiverController(repository: CaregiverRepository()));
    // controller.getbookingshistorypending(); // your API call method
  }

  @override
  void dispose() {
   // Get.delete<RequestCaregiverController>();
    super.dispose();
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }

  Widget _buildHardcodedCard(
   // Datum booking
    ) {

  
    // DateTime startDateutc = DateTime.parse(booking.startTime);
    // DateTime endDateutc= DateTime.parse(booking.endTime);
     

    //  DateTime starttimelocal=startDateutc.toLocal();
    //  DateTime endtimelocal=endDateutc.toLocal();

    // String formattedDate = formatDate(startDateutc);
    //  String formatedstarttime=DateFormat('hh:mm a').format(starttimelocal);
    //  String formatedendtime=DateFormat('hh:mm a').format(endtimelocal);



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
                       'HARSH SINGH',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue[600], size: 20),
                  const SizedBox(width: 8),
                  Text(
                    "30 AUG 2025",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
             Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.blue[600], size: 20),
                  const SizedBox(width: 8),
                  Text(
                   "4:00 pm to 5:00 pm",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                  //    controller.coachaction(booking.id ?? '', "confirm");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                            "Approve",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                   //   controller.coachaction(booking.id ?? '', "reject");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Text(
                            "Reject",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

      // if (controller.getbookingstatus.value) {
      //   return const Center(child: CircularProgressIndicator());
      // }

//      final bookings = controller.bookingmodel.value?.data ?? [];

      return SingleChildScrollView(
        child: Column(
          children: [
            // if (bookings.isEmpty)
              // Center(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       const SizedBox(height: 50),
              //       Icon(Icons.calendar_today_outlined, size: 64, color: Colors.grey[400]),
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
                 // final booking = bookings[i];
                 // return _buildHardcodedCard(booking);
                 return _buildHardcodedCard();
                },
              ),
          ],
        ),
      );
  
 
 
 
  }
}

