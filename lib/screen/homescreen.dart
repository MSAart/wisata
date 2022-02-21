import 'package:flutter/material.dart';
import 'package:wisata/api/api_destinasi.dart';
import 'package:wisata/api/api_kategori.dart';
import 'package:wisata/widget/destinasi_kategori.dart';
import 'package:wisata/widget/list_destinasi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List listKategori = [];

  @override
  void initState() {
    getKategori().then((data) {
      setState(() {
        listKategori = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pariwisata Banjarmasin'),
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
        child: FutureBuilder<List>(
          future: getKategori(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['nama']),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DestinasiKategori(listKategori[index]),
                        ),
                      ),
                    );
                  });
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
            future: getDestinasi(),
            builder: (context, snaphost) {
              if (snaphost.hasError) {
                print(snaphost.error);
              }
              ;

              return snaphost.hasData
                  ? ListDestinasi(listDestinasi: snaphost.data)
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),

      // scf
    );
  }
}
