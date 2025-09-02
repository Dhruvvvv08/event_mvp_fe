import 'package:flutter/material.dart';

class HomeEvent extends StatefulWidget {
  const HomeEvent({super.key});

  @override
  State<HomeEvent> createState() => _HomeEventState();
}

class _HomeEventState extends State<HomeEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                // padding: EdgeInsets.all(12),
                itemCount: 10,
                itemBuilder: (context, index) {
                  // final job = jobs[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2), // shadow color
                          spreadRadius: 1, // how wide the shadow spreads
                          blurRadius: 6, // how soft the shadow looks
                          offset: Offset(
                            0,
                            3,
                          ), // horizontal & vertical movement
                        ),
                      ],
                    ),

                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(12),
                    // ),
                    margin: EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job title
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Need Volunteer for Arijit Singh Event",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(8),
                              //   decoration: BoxDecoration(
                              //     color: Colors.red[100],
                              //     borderRadius: BorderRadius.circular(8),
                              //   ),
                              //   child: Text("C", style: TextStyle(fontWeight: FontWeight.bold)),
                              // )
                            ],
                          ),
                          SizedBox(height: 6),

                          // Company & Rating
                          Row(
                            children: [
                              Text(
                                "Event pvt limited",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              // SizedBox(width: 8),
                              // Icon(Icons.star, color: Colors.orange, size: 16),
                              // Text("${job.rating} (${job.reviews} Reviews)",
                              //     style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                            ],
                          ),
                          SizedBox(height: 6),

                          // Location
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.grey[700],
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "Jnl Stadium,Delhi",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),

                          // Experience
                          Row(
                            children: [
                              Icon(
                                Icons.work,
                                size: 16,
                                color: Colors.grey[700],
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Experienced Preffered",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),

                          // Salary
                          Row(
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                size: 16,
                                color: Colors.grey[700],
                              ),
                              SizedBox(width: 4),
                              Text(
                                "1000 per day",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          SizedBox(height: 6),

                          // Skills
                          Wrap(
                            spacing: 6,
                            children:
                                ["Height:180 cm, Weight : 80kg"]
                                    .map(
                                      (skill) => Chip(
                                        label: Text(
                                          skill,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        backgroundColor: Colors.grey[200],
                                      ),
                                    )
                                    .toList(),
                          ),
                          SizedBox(height: 6),

                          // Bottom row: vacancies & posted ago
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "10 vacancies",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2D Ago",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
