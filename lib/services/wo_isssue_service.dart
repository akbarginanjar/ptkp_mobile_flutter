import 'dart:convert';

import 'package:ptkp/global_resources.dart';

class WoIssueService extends GetConnect {
  Future<WoIssue> getMaterialRequest(String code) async {
    final response = await get(
      '${Base.url}/WOIssue/GetMaterialRequest?material_request_code=$code',
      headers: {
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return WoIssue.fromJson(response.body);
    } else if (response.statusCode == 400) {
      EasyLoading.showError('Code tidak ditemukan');
    } else {
      throw Exception('Failed to load item');
    }
    return WoIssue();
  }

  Future<List<WoLocationList>> getLocationList(
      String enId, String branchId) async {
    final response = await get(
      '${Base.url}/WOIssue/GetLocationList?en_id=$enId&branch_id=$branchId&user_name=${box.read('username')}',
      headers: {
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List jsonResponse = response.body;
      return jsonResponse.map((data) => WoLocationList.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<WoScanQrCode> getQrCode(
      String qrCode, String mrCode, String locId) async {
    final response = await get(
      'http://203.210.84.8:8082/api/WOIssue/ScanQR?material_request_code=$mrCode&lot_serial_no=$qrCode&loc_id=$locId',
      headers: {
        'Authorization': 'Bearer ${box.read('token')}',
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final WoIssueController controller = Get.put(WoIssueController());
      String qtyIssueString = response.body['qty_issue'].toString();
      int qtyIssue = int.tryParse(qtyIssueString) ?? 0;
      TextEditingController qty =
          TextEditingController(text: qtyIssue.toString());
      Get.defaultDialog(
        titlePadding: const EdgeInsets.only(top: 20),
        title: 'Detail Item',
        titleStyle:
            GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),
        contentPadding: const EdgeInsets.all(15),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Item Description', style: TextStyle(fontSize: 13)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              // width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(13),
              ),
              child: TextFormField(
                enabled: false,
                controller:
                    TextEditingController(text: '${response.body['pt_desc1']}'),
                decoration: InputDecoration(
                  fillColor: primary,
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text('Lot/Serial', style: TextStyle(fontSize: 13)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              // width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(13),
              ),
              child: TextFormField(
                enabled: false,
                controller: TextEditingController(
                    text: '${response.body['lot_serial']}'),
                decoration: InputDecoration(
                  fillColor: primary,
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Qty',
              style: TextStyle(fontSize: 13),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              // width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(13),
              ),

              child: TextFormField(
                controller: qty,
                decoration: InputDecoration(
                  fillColor: primary,
                  suffix: Text('${response.body['um_name']}'),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    surfaceTintColor: primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                  onPressed: () {
                    WoScanQrCode newBarang = WoScanQrCode(
                      wodOid: response.body['wod_oid'],
                      ptId: response.body['pt_id'],
                      ptDesc1: response.body['pt_desc1'],
                      locId: response.body['loc_id'],
                      locDesc: response.body['loc_desc'],
                      lotSerial: response.body['lot_serial'],
                      qtyIssue: int.tryParse(qty.text),
                    );
                    WoIssueController().addBarang(newBarang);
                    Get.back();
                    controller.loadData();
                    controller.clearQrCode();
                  },
                  child: Text(
                    'Add To Detail',
                    style: GoogleFonts.poppins(color: white),
                  )),
            )
          ],
        ),
      );
    } else if (response.statusCode == 400) {
      Get.dialog(
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.2),
        AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text('Scan Gagal!'),
          content: Text('${response.body['message']}'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'OKE',
                style: GoogleFonts.poppins(color: primary),
              ),
            ),
          ],
        ),
      );
    } else {
      throw Exception('Failed to load item');
    }
    return WoScanQrCode();
  }
}
