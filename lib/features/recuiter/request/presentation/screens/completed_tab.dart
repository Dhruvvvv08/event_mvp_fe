
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';


class UpcomingCompletedBookingsTab extends StatefulWidget {
  const UpcomingCompletedBookingsTab({Key? key}) : super(key: key);

  @override
  State<UpcomingCompletedBookingsTab> createState() => _UpcomingCompletedBookingsTabState();
}

class _UpcomingCompletedBookingsTabState extends State<UpcomingCompletedBookingsTab> {
  

  @override
  void initState() {
    super.initState();
    // controller = Get.put(RequestCaregiverController(repository: CaregiverRepository()));
    // controller.getbookingshistoryccompleted(); // your API call method
  }

  @override
  void dispose() {
  //  Get.delete<RequestCaregiverController>();
    super.dispose();
  }

  String formatDate(DateTime dateTime) {
    return DateFormat('MMMM dd, yyyy').format(dateTime);
  }

  Widget _buildHardcodedCard() {
  //  DateTime startDateutc = DateTime.parse(booking.startTime);
  //   DateTime endDateutc= DateTime.parse(booking.endTime);
     

  //    DateTime starttimelocal=startDateutc.toLocal();
  //    DateTime endtimelocal=endDateutc.toLocal();

  //   String formattedDate = formatDate(startDateutc);
  //    String formatedstarttime=DateFormat('hh:mm a').format(starttimelocal);
  //    String formatedendtime=DateFormat('hh:mm a').format(endtimelocal);

  //    bool showdisputoption= DateTime.now().isBefore(endtimelocal.add(Duration(hours: 48)));

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
                        'Tushar Singh',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[700],
                    ),
                  ),
                ),
              //  if(showdisputoption)

                //  Theme(
                //   data: Theme.of(context).copyWith(
                //     popupMenuTheme: PopupMenuThemeData(
                //       color: Colors.white, // Background color of popup
                //       textStyle: const TextStyle(
                //         color: Colors.black, // Text color
                //         fontSize: 14,
                //       ),
                //     ),
                //   ),
                //   child: PopupMenuButton<String>(
                //     icon: const Icon(Icons.more_vert),
                //     onSelected: (value) {
                //       if (value == 'dispute') {
                //         _showDisputeDialog(context, booking);
                //       }
                //     },
                //     itemBuilder: (context) => [
                //       const PopupMenuItem(
                //         value: 'dispute',
                //         child: Text("Raise Dispute"),
                //       ),
                //     ],
                //   ),
                // )
           
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
                    "28-Aug 2025",
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
                    "18 sep - 19 sep 2025",
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
          
         
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
      // if (controller.completebool.value) {
      //   return const Center(child: CircularProgressIndicator());
      // }

      // final bookings = controller.bookingmodelcompletedfully.value?.data ?? [];

      return SingleChildScrollView(
        child: Column(
          children: [
         //   if (bookings.isEmpty)
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
          //  else
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, i) {
                //  final booking = bookings[i];
                  return _buildHardcodedCard();
                },
              ),
          ],
        ),
      );
  //  });
  
  
  }
  // void _showDisputeDialog(BuildContext context, Datum booking) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //         backgroundColor: Colors.white,
  //         title: const Text(
  //           "Raise Dispute",
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         content: SingleChildScrollView(
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Text(
  //                 "Dispute Title",
  //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  //               ),
  //               const SizedBox(height: 6),
  //               TextField(
                  
  //                 controller: controller.disputetitle,
  //                 maxLines: 1,
  //                 decoration: InputDecoration(

  //                   hintText: "Enter title",
  //                   filled: true,
  //                   fillColor: Colors.white,
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   contentPadding:
  //                       const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                 ),
  //               ),
  //               const SizedBox(height: 16),
  //               const Text(
  //                 "Describe the Issue",
  //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  //               ),
  //               const SizedBox(height: 6),
  //               TextField(
  //                 controller: controller.disputediscription,
  //                 maxLines: 4,
  //                 decoration: InputDecoration(
  //                   hintText: "Write your issue here...",
  //                   filled: true,
  //                     fillColor: Colors.white,
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(8),
  //                   ),
  //                   contentPadding: const EdgeInsets.symmetric(
  //                       horizontal: 12, vertical: 10),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         actionsPadding:
  //             const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.pop(context);
  //               controller.disputetitle.clear();
  //               controller.disputediscription.clear();
  //             },
  //             child: const Text(
  //               "Cancel",
  //               style: TextStyle(fontWeight: FontWeight.w500),
  //             ),
  //           ),
  //           ElevatedButton(
  //             onPressed: () async {
  //               controller.raisedispute(
  //                   userid: booking.userId!.id, transactionid: booking.id);
  //               Navigator.pop(context);
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.teal,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               padding:
  //                   const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  //             ),
  //             child: const Text(
  //               "Proceed",
  //               style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.black),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}

