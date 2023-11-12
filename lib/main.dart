import 'package:fevoticketscanner/config/web_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(/*options: firebaseOptions*/);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TicketList(),
    );
  }
}

class TicketList extends StatelessWidget {
  final String eventId = "event1";

  const TicketList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket List"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("events")
            .doc(eventId)
            .collection("tickets")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          var tickets = snapshot.data?.docs;

          return ListView.builder(
            itemCount: tickets?.length,
            itemBuilder: (context, index) {
              var ticket = tickets?[index];
              var isScanned = ticket?["is_scanned"];
              var price = ticket?["price"];

              return ListTile(
                title: const Text('Event Name'),
                subtitle: Text("Price: $price"),
                trailing: isScanned
                    ? const Text("Scanned")
                    : ElevatedButton(
                        onPressed: () {
                          // Handle scan button press
                          // Update "is_scanned" in the database
                          FirebaseFirestore.instance
                              .collection("events")
                              .doc(eventId)
                              .collection("tickets")
                              .doc(ticket?.id)
                              .update({"is_scanned": true});
                        },
                        child: const Text("Scan"),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
