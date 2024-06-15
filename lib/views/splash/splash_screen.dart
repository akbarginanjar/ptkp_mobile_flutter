import 'package:ptkp/global_resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (s) => Container(
          color: primary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 100),
              // SizedBox(
              //   height: 220,
              //   width: 220,
              //   child: Image.asset(
              //     'assets/images/rider.png',
              //   ),
              // ),
              Text(
                'PTKP',
                style: TextStyle(
                  fontSize: 30,
                  color: white,
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
