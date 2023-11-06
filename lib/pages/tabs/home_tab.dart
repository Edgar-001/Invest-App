import 'package:flutter/material.dart';
import 'package:invest_app/pages/page/my_asset_widget.dart';
import 'package:invest_app/pages/page/notification_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const NotificationPage(),
                ),
              );
            },
          )
        ],
      ),
      drawer: const Drawer(),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Jessie.',
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 34,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 49, 160, 98),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 11),
                      child: Text(
                        'Your total asset portfolio',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'N203,935',
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Invest now',
                            style: TextStyle(
                              color: Color.fromARGB(255, 49, 160, 98),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Plans',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Seel All >',
                      style: TextStyle(
                          color: Colors.orange.shade700, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CardWidget(
                    title: 'Gold',
                    percent: 30,
                    listColor: const [
                      Color.fromARGB(153, 255, 165, 0),
                      Color.fromARGB(255, 168, 111, 5),
                    ],
                    nameImage: 'assets/images/goldCoin.png',
                    openPage: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyAssetWidget(
                                  numberLabel: 'N240,450',
                                  sectionTitle: 'Current Plans',
                                  nameCard: 'GOLD',
                                )),
                      );
                    },
                  ),
                  CardWidget(
                    title: 'Silver',
                    percent: 60,
                    listColor: [
                      Colors.grey.shade400,
                      Colors.grey.shade900,
                    ],
                    nameImage: 'assets/images/silverCoin.png',
                    openPage: () {},
                  ),
                  CardWidget(
                    title: 'Platin',
                    percent: 90,
                    listColor: const [
                      Color.fromARGB(153, 126, 87, 194),
                      Color.fromRGBO(103, 58, 183, 1),
                    ],
                    nameImage: 'assets/images/silverCoin.png',
                    openPage: () {},
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'Investment Guide',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            ServicesWidget(
              title: 'Basic type of investments',
              textServices:
                  'This is how you set your foot for 2020 Stock market recession. What’s next...',
              image: Image.asset('assets/images/ellipse.png'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(159, 158, 158, 158),
              ),
            ),
            ServicesWidget(
              title: 'How much can you start wit..',
              textServices:
                  'What do you like to see? It’s a very different market from 2018. The way...',
              image: Image.asset('assets/images/ellipse2.png'),
            )
          ],
        ),
      ),
    );
  }
}

class ServicesWidget extends StatelessWidget {
  final String title;
  final String textServices;
  final Image image;
  const ServicesWidget(
      {super.key,
      required this.title,
      required this.textServices,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                textServices,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 61,
          width: 61,
          child: image,
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final int percent;
  final List<Color> listColor;
  final String nameImage;
  final Function()? openPage;
  const CardWidget({
    super.key,
    required this.title,
    required this.percent,
    required this.listColor,
    required this.nameImage,
    required this.openPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Container(
              width: 130,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: listColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    '$percent% return',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              left: 40,
              child: Image.asset(
                nameImage,
                fit: BoxFit.cover,
                width: 115,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
