import 'package:event_demo_mac/features/recuiter/events/presentation/screens/editevent.dart';
import 'package:flutter/material.dart';

class GetEvent extends StatefulWidget {
  const GetEvent({super.key});

  @override
  State<GetEvent> createState() => _GetEventState();
}

class _GetEventState extends State<GetEvent> {
  // Dummy list of events
  final List<Map<String, String>> events = [
    {
      "title": "Node.js Developer Meetup",
      "date": "1 Sept 2025",
      "location": "New Delhi",
    },
    {"title": "Flutter Workshop", "date": "5 Sept 2025", "location": "Mumbai"},
    {
      "title": "AI & ML Conference",
      "date": "12 Sept 2025",
      "location": "Bangalore",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Events"), centerTitle: true),
      body:
          events.isEmpty
              ? const Center(
                child: Text(
                  "No events added yet.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      title: Text(
                        event["title"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          "${event["date"]} • ${event["location"]}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      trailing: PopupMenuButton<String>(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onSelected: (value) {
                          if (value == "edit") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => EditEventScreen(
                                      title: event["title"]!,
                                      date: event["date"]!,
                                      location: event["location"]!,
                                    ),
                              ),
                            );
                          } else if (value == "delete") {
                            setState(() {
                              events.removeAt(index);
                            });
                          }
                        },
                        itemBuilder:
                            (context) => [
                              const PopupMenuItem(
                                value: "edit",
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, size: 20),
                                    SizedBox(width: 8),
                                    Text("Edit"),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: "delete",
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 8),
                                    Text("Delete"),
                                  ],
                                ),
                              ),
                            ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
