import 'package:flutter/material.dart';
import 'data_buku.dart';

class HalamanDetailBuku extends StatefulWidget {
  final DataBuku book;
  const HalamanDetailBuku({Key? key, required this.book}) : super(key: key);

  @override
  State<HalamanDetailBuku> createState() => _HalamanDetailBukuState();
}

class _HalamanDetailBukuState extends State<HalamanDetailBuku> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;

  bool isAvailable = true;
  String status = "Tersedia";
  var warna = Colors.green;
  statusbutton() {
    if (isAvailable == false) {
      return null;
    } else {
      return () {
        String text = " ";
        if (isAvailable == true) {
          setState(() {
            text = "Berhasil Meminjam Buku";
            status = "Tidak Tersedia";
            warna = Colors.red;
            isAvailable = false;
          });
        }
        SnackBar snackBar = SnackBar(
          content: Text(text),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("${widget.book.title}"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // final Uri _url = Uri.parse(widget.book.link);
                  // _launchUrl(_url);
                }),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 220,
                width: 270,
                padding: const EdgeInsets.all(12),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                        height: 400,
                        width: 250,
                        child: Image.network(widget.book.imageLink)),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.book.title,
                style: TextStyle(fontSize: 24),
                maxLines: 1,
              ),
              const SizedBox(
                width: 20,
              ),
              Card(
                child: Container(
                  height: 250,
                  width: 700,
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      //biar bertingkat diberi column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Judul                           : " +
                                widget.book.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Penulis                       : " +
                                widget.book.author,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Bahasa                       : " +
                                widget.book.language,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Negara                       : " +
                                widget.book.country,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Jumlah Halaman     : " +
                                widget.book.pages.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            "Tahun Terbit             : " +
                                widget.book.year.toString(),
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Status                        :  ' + status,
                            style: TextStyle(fontSize: 16, color: warna),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: 35,
                  width: 300,
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(100),
                    ),
                    onPressed: statusbutton(),
                    child: const Text('Pinjam Buku'),
                  )),
            ],
          ),
        ));
  }

  // Future<void> _launchUrl(Uri _url) async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }
}
