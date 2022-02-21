import 'package:flutter/material.dart';
import 'destinasi_detail.dart';

class ListDestinasi extends StatelessWidget {
  final List listDestinasi;
  const ListDestinasi({this.listDestinasi, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: listDestinasi == null ? 0 : listDestinasi.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DestinasiDetail(
                          listDestinasi: listDestinasi,
                          index: index,
                        )));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              child: ListTile(
                leading: Image.network(
                  listDestinasi[index]['photo'],
                  width: 100,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  listDestinasi[index]['nama'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                    "${listDestinasi[index]['kategori']} | ${listDestinasi[index]['wilayah']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}
