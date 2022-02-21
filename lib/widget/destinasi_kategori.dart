import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wisata/widget/destinasi_detail.dart';

class DestinasiKategori extends StatelessWidget {
  final Map kategori;

  const DestinasiKategori(this.kategori, {Key key}) : super(key: key);

  Future<List> getDestinasiKategori() async {
    final id = kategori['id'];
    var response = await Dio()
        .get('http://192.168.8.105/public/api/destinasi/kategori/${id}');
    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kategori['nama']),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List>(
        future: getDestinasiKategori(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DestinasiDetail(
                                      listDestinasi: snapshot.data,
                                      index: index,
                                    )));
                      },
                      child: ListTile(
                        leading: Image.network(
                          "${snapshot.data[index]['photo']}",
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "${snapshot.data[index]['nama']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Text("${snapshot.data[index]['wilayah']}"),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
