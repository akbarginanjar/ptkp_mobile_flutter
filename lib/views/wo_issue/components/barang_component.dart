import 'package:ptkp/global_resources.dart';

class BarangComponent extends StatelessWidget {
  final String itemDescription;
  final String lotSerial;
  final String qty;
  final String umName;
  final VoidCallback onDelete;
  const BarangComponent({
    super.key,
    required this.itemDescription,
    required this.lotSerial,
    required this.qty,
    required this.umName,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 15,
      shadowColor: const Color.fromARGB(169, 245, 245, 245),
      surfaceTintColor: white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 25,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 234, 236),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.dialog(
                      barrierDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.2),
                      AlertDialog(
                        backgroundColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        title: const Text('Perhatian!'),
                        content: const Text(
                            'Apakah anda yakin ingin menghapus data barang ini?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'NO',
                              style: GoogleFonts.poppins(color: black),
                            ),
                          ),
                          TextButton(
                            onPressed: onDelete,
                            child: Text(
                              'YES',
                              style:
                                  GoogleFonts.poppins(color: Colors.red[800]),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Delete Item',
                    style: GoogleFonts.poppins(
                        color: Colors.red[800],
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Item Description',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(itemDescription,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lot/Serial',
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(lotSerial,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Qty', style: Theme.of(context).textTheme.bodyMedium),
                Text(qty,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            // Divider(
            //   color: Colors.grey[400],
            // )
          ],
        ),
      ),
    );
  }
}
