import 'package:flutter/material.dart';
import 'package:pms_mobile/page/user_info_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: data.length,
        itemBuilder: (context, index) => OnboardContent(
          pageController: _pageController,
          image: data[index].image,
          titleId: data[index].titleId,
          body: data[index].body,
          description: data[index].description,
        ),
      ),
    );
  }
}

class Onboard {
  final String image, titleId, body, description;
  Onboard(
      {required this.image,
      required this.titleId,
      required this.body,
      required this.description});
}

final List<Onboard> data = [
  Onboard(
    image: 'assets/image/onboard.jpeg',
    titleId: '01.',
    body: 'Lovely furniture everywhere',
    description:
        'Find furniture product you want by your location or neighborhood',
  ),
  Onboard(
    image: 'assets/image/onboard.jpeg',
    titleId: '02.',
    body: 'Save product needed',
    description: 'Save furniture products that you may need for now and later',
  ),
  Onboard(
    image: 'assets/image/onboard.jpeg',
    titleId: '03.',
    body: 'Create real inspiration',
    description: 'Create inspiration that amazes everyone you love around you',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.titleId,
    required this.body,
    required this.description,
    required this.pageController,
  }) : super(key: key);

  final String image, titleId, body, description;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 244),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF000000).withOpacity(0.0),
                const Color(0xFF000000),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 55, right: 16),
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
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            // logo
            Container(
              padding: const EdgeInsets.only(top: 10),
              margin: const EdgeInsets.only(left: 32, top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage("assets/icon/sofa.png"),
                    color: Colors.white,
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Furniture".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0),
                  ),
                ],
              ),
            ),
            Container(
              width: 311,
              height: 258,
              margin: const EdgeInsets.only(top: 88, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleId,
                    style: const TextStyle(
                      fontSize: 72,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    body,
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55),
              child: ElevatedButton(
                onPressed: () {
                  pageController.page == 2.0
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserInfoPage()))
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.ease,
                        );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(56, 56),
                  backgroundColor: const Color(0xFF5052A2),
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 55, left: 32, right: 32),
              child: RichText(
                text: const TextSpan(
                  text: 'By joining you agree to ours  ',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFC8C7CC),
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms of Service ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'and'),
                    TextSpan(
                      text: ' Privacy Policy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }
}
