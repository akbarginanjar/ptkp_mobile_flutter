import 'package:ptkp/global_resources.dart';
import 'package:ptkp/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  GetStorage box = GetStorage();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController authController = AuthController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 80, bottom: 10),
                //   child: Center(
                //     child: SizedBox(
                //       height: 70,
                //       child: Image.asset('assets/images/logo-balanja.png'),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 200),
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Silahkan login disini',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  // width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextFormField(
                    controller: username,
                    validator: (val) {
                      if (val!.isEmpty) {}
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.grey[500],
                      ),
                      fillColor: primary,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.5, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  // width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: TextFormField(
                    controller: password,
                    obscureText: _obscureText,
                    validator: (val) {
                      if (val!.isEmpty) {}
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.grey[500],
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                      fillColor: primary,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1.5, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: primary,
                      elevation: 0,
                      surfaceTintColor: primary,
                    ),
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        authController
                            .login(
                          username: username.text,
                          password: password.text,
                        )
                            .then((value) {
                          if (box.read('token') != null) {
                            form.currentState!.reset();
                            Get.offAll(
                              const HomeScreen(),
                              transition: Transition.rightToLeft,
                            );
                          }
                        });
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
