import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/pages/page/contact_info_page.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({
    super.key,
  });

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  String? userName;

  @override
  void initState() {
    super.initState();

    userSetup();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body(),
      ),
    );
  }

  Widget body() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: MediaQuery.of(context).size.width * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 34,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.16,
                      width: MediaQuery.of(context).size.width * 0.36,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(159, 158, 158, 158),
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            'assets/images/user.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      userName ?? '',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Expert',
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              ),
            ],
          ),
          InfoWidget(
            icon: const Icon(Icons.assignment_ind),
            nameInfoCard: 'Contact Info',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ContactInfoPage(),
                ),
              );
            },
          ),
          InfoWidget(
            icon: const Icon(Icons.payments_sharp),
            nameInfoCard: 'Source of Funding Info',
            onPressed: () {},
          ),
          InfoWidget(
            icon: const Icon(Icons.account_balance_rounded),
            nameInfoCard: 'Bank Account Info',
            onPressed: () {},
          ),
          InfoWidget(
            icon: const Icon(Icons.contact_page),
            nameInfoCard: 'Document Info',
            onPressed: () {},
          ),
          InfoWidget(
            icon: const Icon(Icons.settings),
            nameInfoCard: 'Settings',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Future<void> userSetup() async {
    CollectionReference user = FirebaseFirestore.instance.collection('Users');
    FirebaseAuth auth = FirebaseAuth.instance;
    String? uid = auth.currentUser?.uid.toString();

    final DocumentSnapshot userDocSp = await user.doc(uid).get();

    userName = (userDocSp.data() as Map<String, dynamic>)['full_name'];

    if (mounted) {
      setState(() {});
    }

    return;
  }
}

class InfoWidget extends StatelessWidget {
  final Icon icon;
  final String nameInfoCard;
  final Function() onPressed;

  const InfoWidget({
    super.key,
    required this.icon,
    required this.nameInfoCard,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.065,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(89, 158, 158, 158),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon,
              const SizedBox(
                width: 40,
              ),
              Text(
                nameInfoCard,
                style: const TextStyle(fontSize: 16),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
        ),
      ),
    );
  }
}
