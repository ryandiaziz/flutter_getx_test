import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
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
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  value.increment();
                },
                child: Icon(Icons.add),
              ),
              ElevatedButton(
                onPressed: () {
                  value.decrement();
                },
                child: Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CountController extends GetxController {
  var data = 0.obs;
  increment() => data++;
  decrement() => data--;
}
