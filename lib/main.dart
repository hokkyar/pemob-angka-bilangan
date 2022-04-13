// Nama / NIM: KOMANG HOKKY ARYASTA / 2015091028

// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(Pertemuan10());
}

class Pertemuan10 extends StatefulWidget {
  @override
  State<Pertemuan10> createState() => _Pertemuan10State();
}

class _Pertemuan10State extends State<Pertemuan10> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController output1 = TextEditingController();
  TextEditingController output2 = TextEditingController();

  // pasangan angka(int) dan angka bilangannya(String)
  Map<int, String> angka = {
    0: "Nol",
    1: "Satu",
    2: "Dua",
    3: "Tiga",
    4: "Empat",
    5: "Lima",
    6: "Enam",
    7: "Tujuh",
    8: "Delapan",
    9: "Sembilan",
  };

  // melakukan penjumlahan
  void tambah() {
    int hasil = int.parse(input1.text) + int.parse(input2.text);
    output1.text = hasil.toString();
    konversiBerbilang(output1.text);
  }

  // melakukan pengurangan
  void kurang() {
    int hasil = int.parse(input1.text) - int.parse(input2.text);
    output1.text = hasil.toString();
    konversiBerbilang(output1.text);
  }

  // melakukan perkalian
  void kali() {
    int hasil = int.parse(input1.text) * int.parse(input2.text);
    output1.text = hasil.toString();
    konversiBerbilang(output1.text);
  }

  // melakukan pembagian
  void bagi() {
    int hasil = int.parse(input1.text) ~/ int.parse(input2.text);
    output1.text = hasil.toString();
    konversiBerbilang(output1.text);
  }

  // mengkonversi angka menjadi angka bilangannya dari 0 - 100 (LIMIT 100)
  void konversiBerbilang(String angkaString) {
    int angkaInt = int.parse(angkaString);

    angka.forEach((key, value) {
      // jika hasilnya kurang dari 0 (negatif)
      if (angkaInt < 0) {
        output2.text = "Bilangan Negatif";
      }

      // 0 sampai 9
      if (key == angkaInt) {
        output2.text = value;
      }
      // lainnya
      else {
        int angkaDepan = angkaInt ~/ 10;
        int angkaBelakang = angkaInt % 10;
        // 10,20,30..100 -> habis dibagi 0 kecuali 0
        if (angkaInt % 10 == 0 && angkaInt != 0) {
          if (angkaDepan == 1) {
            output2.text = "Sepuluh";
          }
          if (angkaDepan == 10) {
            output2.text = "Seratus";
          }
          if (angkaDepan == key) {
            output2.text = value + " Puluh";
          }
        } else {
          // 11 - 19 -> angka belasan
          if (angkaDepan == 1 && angkaBelakang == key) {
            (angkaBelakang == 1)
                ? output2.text = "Sebelas"
                : output2.text = value + " Belas";
          }
          // angka lainnya
          if (angkaDepan == key && angkaDepan != 1) {
            output2.text = value + " Puluh " + angka[angkaBelakang].toString();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("2015091028"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: input1,
                autofocus: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan angka ke-1',
                ),
              ),
              SizedBox(height: 7),
              TextField(
                controller: input2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukan angka ke-2',
                ),
              ),
              SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      tambah();
                    },
                    child: Text('+'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      kurang();
                    },
                    child: Text('-'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      kali();
                    },
                    child: Text('x'),
                  ),
                  SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      bagi();
                    },
                    child: Text(':'),
                  ),
                ],
              ),
              SizedBox(height: 7),
              TextField(
                controller: output1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hasil Angka',
                ),
              ),
              SizedBox(height: 7),
              TextField(
                controller: output2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hasil Berbilang',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
