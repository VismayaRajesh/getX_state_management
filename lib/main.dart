import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_state_mngmt/counter_cntrl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final Countcntrl c = Get.put(Countcntrl());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Obx(() => Text("${c.count}")),
            GetBuilder(builder: (Countcntrl controller) {
              return Text('${c.count}');
            },),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            Get.snackbar("Snackbar", "just an message", duration: Duration(seconds: 3));
          }, child: Text("Snackbar")),

            SizedBox(height: 10,),

            ElevatedButton(onPressed: () {
              Get.defaultDialog(title: "Alert", content: Text("just an alert"),
                actions: [
                  ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("exit")),
                ]
              );
            }, child: Text("Dialogue")),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Get.to(Dashboard());
            }, child: Text("Nav to dash"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          c.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
    }

    }

    class Dashboard extends StatefulWidget {
      const Dashboard({super.key});

      @override
      State<Dashboard> createState() => _DashboardState();
    }

    class _DashboardState extends State<Dashboard> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.grey,
        );
      }
    }
