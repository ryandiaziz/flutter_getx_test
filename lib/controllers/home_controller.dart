import 'package:get/get.dart';

class CountController extends GetxController {
  // var data = 0.obs; // Menggunakan reactive state manager -> View mengguanakan Obx()
  int data = 0; // View menggunakan GetBuilder()
  increment() {
    // Menampilkan snackbar setiap nilai kelipatan 10
    if (data % 10 == 0) {
      // Menampilkan snackbar menggunakan Get X
      Get.snackbar("Selamat", "Nilai sudah Melebihi $data");
    }
    return data++;
  }

  decrement() => data--;

  void refreshTampilan() {
    update(); // FUngsi untuk mengupdate data pada tambilan
  }
}
