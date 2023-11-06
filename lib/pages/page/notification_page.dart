import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    List<String> imagesList = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ];
    List<String> notificationsList = [
      'Apple stocks just increased Check it out now.',
      'Check out today’s best inves-tor. You’ll learn from him',
      'Where do you see yourself in the next ages.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Notification',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: imagesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: MediaQuery.of(context).size.width * 0.16,
                            child: Image.asset(
                              imagesList[index],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.46,
                            child: Text(
                              notificationsList[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            DateFormat('E d MMM ').format(
                              DateTime.now(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 1,
                          width: double.infinity,
                          color: const Color.fromARGB(146, 158, 158, 158),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
