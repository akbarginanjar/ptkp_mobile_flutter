import 'dart:async';
import 'dart:io';
import 'package:ptkp/global_resources.dart';

class AuthController extends GetConnect {
  Future<User> login(
      {required String username, required String password}) async {
    try {
      if (password.isNotEmpty && username.isNotEmpty) {
        GetStorage box = GetStorage();
        var body = {
          'username': username,
          'password': password,
        };

        final Response conn = await post(
          'http://203.210.84.8:8082/api/Login',
          body,
        );
        EasyLoading.show(status: 'loading...');
        if (conn.statusCode == 200) {
          EasyLoading.showSuccess('Login Success');
          // print(conn.body['token']);
          box.write('username', conn.body['usernama']);
          box.write('useremail', conn.body['useremail']);
          box.write('token', conn.body['token']);
        } else if (conn.statusCode == null) {
          // EasyLoading.showInfo('Perbaiki Koneksi Internet');
        } else {
          EasyLoading.showError('Login Failed');
          // Get.dialog(
          //   barrierDismissible: false,
          //   barrierColor: Colors.black.withOpacity(0.2),
          //   AlertDialog(
          //     backgroundColor: Colors.white,
          //     surfaceTintColor: Colors.white,
          //     title: const Text('Login Gagal!'),
          //     content: const Text('Akun tidak ditemukan!'),
          //     actions: [
          //       TextButton(
          //         onPressed: () {
          //           Get.back();
          //           Get.back();
          //         },
          //         child: Text(
          //           'OKE',
          //           style: GoogleFonts.poppins(color: primary),
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        }
        // Get.snackbar("Gagal Login", conn.body['message']);
      }
    } on TimeoutException {
      Get.snackbar('Masalah Koneksi',
          'Jaringan lemah\nsilahkan perbaiki jaringan anda!');
    } on SocketException {
      Get.snackbar('Masalah Koneksi',
          'Data dalam keadaan mati\nsilahkan nyalakan data anda!');
    } on HttpException catch (e) {
      Get.snackbar('Masalah Koneksi', e.message);
    } on Error catch (e) {
      Get.snackbar(e.toString(), e.stackTrace.toString());
    }
    return User();
  }
}
