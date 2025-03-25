import 'package:flutter/material.dart';
import 'model/member.dart';
import 'input.dart';
import 'session.dart' as mysession;

class Detail extends StatefulWidget {
  int index;
  Detail(this.index);

  @override
  _Detail createState() => _Detail();
}

class _Detail extends State<Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Data Member"),
        //actions: [IconButton(icon: Icon(Icons.save), onPressed: changeView)],
      ),
      body: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              mysession.arraymember[widget.index].gender == "Pria"
                  ? "https://cdn-icons-png.flaticon.com/512/3233/3233508.png"
                  : "https://cdn-icons-png.flaticon.com/512/3233/3233486.png",
              width: 50, // Adjust size as needed
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("NIK: " + mysession.arraymember[widget.index].nik),
                Text("Nama: " + mysession.arraymember[widget.index].nama),
                Text("Gender: " + mysession.arraymember[widget.index].gender),
                Text("Status: " + mysession.arraymember[widget.index].status),
                Text("Agama: " + mysession.arraymember[widget.index].agama),
                Text(
                  "Gaji: " +
                      mysession.arraymember[widget.index].gaji.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
