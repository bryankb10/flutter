import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Model/Member.dart';
import 'session.dart' as mysession;

class Input extends StatefulWidget {
  @override
  _input createState() => _input();
}

class _input extends State<Input> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController txtnik = TextEditingController();
  TextEditingController txtnama = TextEditingController();
  TextEditingController txtgaji = TextEditingController();
  String gender = "Pria";
  bool status = false;
  String agama = "Katolik";
  String kerja = "Admin";
  List<String> listKerja = ["Admin", "Kasir", "Operator"];
  List<String> listGender = <String>["Pria", "Wanita"];

  void addMember() {
    if (txtnik.text.isEmpty || txtnama.text.isEmpty || txtgaji.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Tidak boleh ada data kosong!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }
    bool namaExists = mysession.arraymember.any(
      (member) => member.nama == txtnama.text,
    );

    if (namaExists) {
      Fluttertoast.showToast(
        msg: "User ini sudah terdaftar!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return;
    }

    Member baru = Member(
      txtnik.text,
      txtnama.text,
      gender,
      status == true ? "Menikah" : "Single", // Now correctly passing boolean
      agama,
      kerja,
      int.parse(
        txtgaji.text.toString(),
      ), // Avoids crash if input is empty or invalid
    );

    mysession.arraymember.add(baru);
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Input Member"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: addMember)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: Text("NIK: ")),
              Expanded(flex: 1, child: TextField(controller: txtnik)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: Text("Nama: ")),
              Expanded(flex: 1, child: TextField(controller: txtnama)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Pria"),
                  leading: Radio<String>(
                    value: "Pria",
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Wanita"),
                  leading: Radio<String>(
                    value: "Wanita",
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          CheckboxListTile(
            title: const Text("Menikah"),
            value: status,
            onChanged: (bool? newValue) {
              setState(() {
                status = newValue!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text("Katolik"),
                  leading: Radio<String>(
                    value: "Katolik",
                    groupValue: agama,
                    onChanged: (String? value) {
                      setState(() {
                        agama = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Islam"),
                  leading: Radio<String>(
                    value: "Islam",
                    groupValue: agama,
                    onChanged: (String? value) {
                      setState(() {
                        agama = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Hindu"),
                  leading: Radio<String>(
                    value: "Hindu",
                    groupValue: agama,
                    onChanged: (String? value) {
                      setState(() {
                        agama = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Kristen"),
                  leading: Radio<String>(
                    value: "Kristen",
                    groupValue: agama,
                    onChanged: (String? value) {
                      setState(() {
                        agama = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text("Buddha"),
                  leading: Radio<String>(
                    value: "Buddha",
                    groupValue: agama,
                    onChanged: (String? value) {
                      setState(() {
                        agama = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          DropdownButton<String>(
            value: kerja,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            onChanged: (String? value) {
              setState(() {
                kerja = value!;
              });
            },
            items:
                listKerja.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(flex: 1, child: Text("Gaji: ")),
              Expanded(flex: 1, child: TextField(controller: txtgaji)),
            ],
          ),
        ],
      ),
    );
  }
}
