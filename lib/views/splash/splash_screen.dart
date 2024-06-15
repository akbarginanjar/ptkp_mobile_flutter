import 'package:ptkp/global_resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (s) => Container(
          color: white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 100),
              // SizedBox(
              //   height: 220,
              //   width: 220,
              //   child: Image.asset(
              //     'assets/images/rider.png',
              //   ),
              // ),
              const SizedBox(height: 50),
              const Text(
                'PTKP',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
