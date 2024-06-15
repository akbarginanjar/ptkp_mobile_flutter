import 'package:ptkp/global_resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WoIssueController controllerWoIssue = Get.put(WoIssueController());
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'PTKP',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: white, fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                        side: BorderSide(
                          color: Colors.grey[300]!, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      backgroundColor: white,
                      elevation: 0,
                      surfaceTintColor: white,
                    ),
                    onPressed: () {
                      controllerWoIssue.loadData();
                      Get.to(WoIssueScreen());
                    },
                    child: Text(
                      'WO Issue',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: primary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
