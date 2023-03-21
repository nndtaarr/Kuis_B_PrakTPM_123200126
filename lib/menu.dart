import 'package:flutter/material.dart';

import 'data_buku.dart';
import 'detail.dart';

class HalamanListBuku extends StatelessWidget {
  const HalamanListBuku({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Buku"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (BuildContext context, int index) {
          final DataBuku book = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDetailBuku(book: book),
                  ));
            },
            child: Card(
              elevation: 10,
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: 300,
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                          height: 400,
                          width: 150,
                          child: Image.network(book.imageLink)),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          book.title,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          book.author,
                          style: TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic),
                          maxLines: 1,
                        ),
                      ],
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
