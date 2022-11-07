import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, right: 16),
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserInfoPage(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                width: 193,
                height: 134,
                margin: const EdgeInsets.only(left: 32, top: 65),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 40,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Fill in your information',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF666666),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 110, left: 32,bottom: 38),
                width: 86,
                height: 86,
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFFC8C7CC),
                      radius: 50.0,
                      child: Image.asset(
                        'assets/icon/user.png',
                      ),
                    ),
                    Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5052A2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                iconSize: 18,
                                onPressed: () {},
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
