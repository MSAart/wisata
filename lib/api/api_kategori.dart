// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';

Future<List> getKategori() async {
  var dio = Dio();
  Response response = await dio.get('http://192.168.8.105/public/api/kategori');
  return response.data['data'];
}
