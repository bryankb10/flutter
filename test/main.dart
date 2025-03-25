import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'model/member.dart';
import 'input.dart';
import 'detail.dart';
import 'session.dart' as mysession;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'My App Home Page'),
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
  void changeView() async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => Input()));

    setState(() {});
  }

  void deleteData(index) {
    mysession.arraymember.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: changeView)],
      ),
      body: ListView.builder(
        itemCount: mysession.arraymember.length,
        itemBuilder: (content, index) {
          return Container(
            margin: const EdgeInsets.all(8), // Adds spacing between cards
            padding: const EdgeInsets.all(
              10,
            ), // Adds padding inside the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.3), spreadRadius: 2),
              ], // Rounded corners
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Detail(index)));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          mysession.arraymember[index].gender == "Pria"
                              ? "https://cdn-icons-png.flaticon.com/512/3233/3233508.png"
                              : "https://cdn-icons-png.flaticon.com/512/3233/3233486.png",
                          width: 50, // Adjust size as needed
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("NIK: " + mysession.arraymember[index].nik),
                            Text("Nama: " + mysession.arraymember[index].nama),
                            Text(
                              "Gender: " + mysession.arraymember[index].gender,
                            ),
                            Text(
                              "Status: " + mysession.arraymember[index].status,
                            ),
                            Text(
                              "Agama: " + mysession.arraymember[index].agama,
                            ),
                            Text(
                              "Gaji: " +
                                  mysession.arraymember[index].gaji.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        deleteData(index);
                        Fluttertoast.showToast(
                          msg: "Data berhasil dihapus!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      },
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
