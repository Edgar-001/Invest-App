import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyAssetWidget extends StatelessWidget {
  final String numberLabel;
  final String sectionTitle;
  final String nameCard;
  const MyAssetWidget({
    super.key,
    required this.numberLabel,
    required this.sectionTitle,
    required this.nameCard,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Asset',
          style: TextStyle(color: Colors.black),
        ),
        leading: const Text(''),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.dangerous,
              size: 30,
              color: Color.fromARGB(255, 179, 179, 179),
            ),
          ),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your total asset portfolio',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 40,
              ),
              child: Row(
                children: [
                  Text(
                    numberLabel,
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.upload,
                    color: Colors.green,
                  ),
                  const Text(
                    '+2%',
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
            Text(
              sectionTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: cardWidget(
                context,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'See All Plans ',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                    Icon(
                      Icons.arrow_right_alt,
                      color: Colors.orange,
                    )
                  ],
                ),
              ),
            ),
            const Text(
              'History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: ((context, index) {
                  return transactionsWidget(index);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            Color.fromARGB(153, 255, 165, 0),
            Color.fromARGB(255, 168, 111, 5),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameCard,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '30% return',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            height: 200,
            top: 20,
            left: MediaQuery.of(context).size.width * 0.45,
            child: Image.asset('assets/images/goldCoin.png'),
          ),
        ],
      ),
    );
  }

  Widget transactionsWidget(index) {
    Color color;

    index % 2 == 0 ? color = Colors.black : color = Colors.green;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RP 2000',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700, color: color),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Buy “APPL” Stock',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
              Text(
                DateFormat('E d MMM y').format(
                  DateTime.now(),
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            color: const Color.fromARGB(144, 158, 158, 158),
          )
        ],
      ),
    );
  }
}
