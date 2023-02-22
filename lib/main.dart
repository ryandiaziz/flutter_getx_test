import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CountController value = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    print("render");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GET X STATE MANAGEMENT",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Obx(
              () => Text(
                "${value.data.value}",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    value.decrement();
                  },
                  child: const Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    value.increment();
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          ElevatedButton(
            onPressed: () {
              // Show dialog with GetX
              Get.defaultDialog(
                title: "Dialog with Getx",
                content: const Text(
                  "This is content dialog with getx dialog",
                ),
                actions: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("OK"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              );
            },
            child: const Text("Show Dialog"),
          ),
          const Divider(
            thickness: 2,
          ),
          ElevatedButton(
            onPressed: () {
              Get.bottomSheet(
                isDismissible: true,
                enableDrag: true,
                Container(
                  color: Colors.white,
                  height: 300,
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Nama"),
                      )
                    ],
                  ),
                ),
              );
            },
            child: const Text(
              "Bottom Sheet",
            ),
          ),
        ],
      ),
    );
  }
}

class CountController extends GetxController {
  var data = 0.obs;
  increment() {
    // Menampilkan snackbar setiap nilai kelipatan 10
    if (data % 10 == 0) {
      // Menampilkan snackbar menggunakan Get X
      Get.snackbar("Selamat", "Nilai sudah Melebihi $data");
    }
    return data++;
  }

  decrement() => data--;
}
