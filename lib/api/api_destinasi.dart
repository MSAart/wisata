import 'package:dio/dio.dart';

Future<List> getDestinasi() async {
  var dio = Dio();
  Response response =
      await dio.get('http://192.168.8.105/public/api/destinasi');
  return response.data['data'];
}
