import 'package:intl/intl.dart';

String formatDateDMY(String dateString) {
  // Ubah string tanggal menjadi objek DateTime
  DateTime date = DateTime.parse(dateString);
  // Buat objek DateFormat untuk format "dd-MM-yyyy" (dmy)
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  // Gunakan dateFormat untuk memformat tanggal dan kembalikan string yang diformat
  return dateFormat.format(date);
}
