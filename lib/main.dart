import 'package:ptkp/global_resources.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide(color: Colors.grey[100]!, width: 1.0),
          ),
          counterStyle: const TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.w300,
              color: Colors.black54),
          outlineBorder: BorderSide(color: Colors.grey[200]!, width: 1.0),
          contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: primary, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.red, width: 1.0)),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
        textTheme: TextTheme(
          titleLarge:
              GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600),
          titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          titleSmall: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          bodyLarge: GoogleFonts.poppins(),
          bodyMedium: GoogleFonts.poppins(),
          bodySmall: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}
