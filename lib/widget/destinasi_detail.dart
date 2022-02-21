import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DestinasiDetail extends StatelessWidget {
  List listDestinasi;
  int index;

  DestinasiDetail({
    Key key,
    this.listDestinasi,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${listDestinasi[index]['nama']}'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.network('${listDestinasi[index]['photo']}'),
          Container(
            padding: const EdgeInsets.all(32),
            child: Text(
              '${listDestinasi[index]['nama']}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Html(
              data: listDestinasi[index]['konten'],
            ),
          )
        ],
      ),
    );
  }
}
