import 'package:coinedone/model/phone_get_model/phone_get_model.dart';
import 'package:dio/dio.dart';

class PhoneService {
  final dio = Dio();

  Future<List<Datum>> getData(String phoneNumber) async {
    final response = await dio.get(
        'https://alpha.classaccess.io/api/challenge/v2/schedule/$phoneNumber');

    if (response.statusCode == 200) {
      final List<dynamic> responseData = response.data['data'];
      final List<Datum> data =
          responseData.map((e) => Datum.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
