import 'package:get/get.dart';
import 'package:ptkp/global_resources.dart';
import 'package:ptkp/helpers/formatter.dart';
import 'package:ptkp/views/wo_issue/components/barang_component.dart';

class WoIssueScreen extends StatelessWidget {
  WoIssueScreen({super.key});

  final WoIssueController controller = Get.put(WoIssueController());

  @override
  Widget build(BuildContext context) {
    // List<WoScanQrCode> items = WoIssueService().getBarang();
    return Scaffold(
      appBar: AppBar(
        title: const Text('WO Issue'),
        backgroundColor: white,
        surfaceTintColor: white,
        elevation: 1,
        shadowColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
            controller.clearAllBarang();
            controller.clearMrCode();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Text('WO MR Code', style: Theme.of(context).textTheme.bodySmall),
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
                controller: controller.textMrCode,
                onChanged: (value) {
                  controller.getMrCode(controller.textMrCode.text);
                },
                decoration: InputDecoration(
                  hintText: 'Scan Code',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.transparent),
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
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('WO Code ', style: Theme.of(context).textTheme.bodyLarge),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Text('-');
                  } else {
                    return Text(controller.woIssue.value.woCode ?? '-');
                  }
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date ', style: Theme.of(context).textTheme.bodyLarge),
                Text(formatDateDMY(DateTime.now().toString()),
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Divider(
              color: Colors.grey[100],
            ),
            const SizedBox(height: 5),
            Text('Location From', style: Theme.of(context).textTheme.bodySmall),
            Obx(
              () => FutureBuilder<List<WoLocationList>>(
                future: WoIssueService().getLocationList(
                    controller.woIssue.value.enId.toString(),
                    controller.woIssue.value.branchId.toString()),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            )));
                  } else if (snapshot.hasError) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: DropdownButtonFormField<WoLocationList>(
                        value: null, // set value dropdown
                        onChanged: (WoLocationList? selectedItem) {},
                        items: const [],
                        decoration: InputDecoration(
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
                    );
                  } else {
                    List<WoLocationList> items = snapshot.data!;
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: DropdownButtonFormField<WoLocationList>(
                        value: null, // set value dropdown
                        onChanged: (WoLocationList? selectedItem) {
                          controller
                              .setSelected(selectedItem!.locId.toString());
                        },
                        items: items.map((WoLocationList item) {
                          return DropdownMenuItem<WoLocationList>(
                            value: item,
                            child: Text(item.locDesc.toString()),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: 'Select Location From',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[400],
                          ),
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
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            Text('QR Code', style: Theme.of(context).textTheme.bodySmall),
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
                controller: controller.textQrCode,
                onChanged: (value) {
                  controller.getQrCode(
                      controller.textQrCode.text,
                      controller.textMrCode.text,
                      controller.locationFrom.toString());
                },
                decoration: InputDecoration(
                  hintText: 'Scan QR Code',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                  prefixIcon: Icon(
                    Icons.qr_code,
                    color: Colors.grey[400],
                  ),
                  fillColor: primary,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 1.5, color: Colors.transparent),
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
            const SizedBox(height: 20),
            GetBuilder<WoIssueController>(
              builder: (controller) {
                // Memeriksa apakah sudah ada data yang dimuat
                if (controller.items.isEmpty) {
                  controller.loadData();
                }
                // Jika sudah ada data, tampilkan ListView.builder
                return Obx(
                  () => ListView.builder(
                    itemCount: controller.items.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      WoScanQrCode item = controller.items[index];
                      return BarangComponent(
                        itemDescription: item.ptDesc1.toString(),
                        lotSerial: item.lotSerial.toString(),
                        qty: item.qtyIssue.toString(),
                        umName: item.umName.toString(),
                        onDelete: () {
                          controller.deleteBarang(index);
                        },
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
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
                  controller.loadData();
                },
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(color: white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
