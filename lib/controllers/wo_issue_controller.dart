import 'package:ptkp/global_resources.dart';

class WoIssueController extends GetxController {
  var locationFrom = ''.obs;
  var woIssue = WoIssue().obs;
  var woQrCode = WoScanQrCode().obs;
  var isLoading = true.obs;
  RxList<WoScanQrCode> items = <WoScanQrCode>[].obs;
  TextEditingController textQrCode = TextEditingController();
  TextEditingController textMrCode = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Memuat data saat controller diinisialisasi
    loadData();
  }

  void clearMrCode() {
    textMrCode.clear();
  }

  void clearQrCode() {
    textQrCode.clear();
  }

  void loadData() {
    // Ambil data dari getStorage
    List<dynamic>? storedItems = box.read('barang');
    if (storedItems != null) {
      items.assignAll(
        storedItems.map((item) => WoScanQrCode.fromJson(item)).toList(),
      );
    }
  }

  List<WoScanQrCode> getBarang() {
    List<dynamic> jsonBarang = box.read<List>('barang') ?? [];
    return jsonBarang.map((json) => WoScanQrCode.fromJson(json)).toList();
  }

  void addBarang(WoScanQrCode barang) {
    List<WoScanQrCode> barangs = getBarang();
    barangs.add(barang);
    box.write('barang', barangs.map((item) => item.toJson()).toList());
    loadData();
  }

  void deleteBarang(int index) {
    items.removeAt(index);
    box.write('barang', items.map((item) => item.toJson()).toList());
    loadData();
    Get.back();
  }

  void clearAllBarang() {
    items.clear();
    box.remove('barang');
  }

  void getMrCode(String code) async {
    try {
      isLoading(true);
      var fetched = await WoIssueService().getMaterialRequest(code);
      woIssue.value = fetched;
    } finally {
      isLoading(false);
    }
  }

  void setSelected(String value) {
    locationFrom.value = value;
  }

  void getQrCode(String qrCode, String mrCode, String locId) async {
    try {
      isLoading(true);
      var fetchQrCode = await WoIssueService().getQrCode(qrCode, mrCode, locId);
      woQrCode.value = fetchQrCode;
    } finally {
      isLoading(false);
    }
  }
}
