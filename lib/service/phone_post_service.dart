import 'package:coinedone/model/phone_post_model/phine_post_model.dart';
import 'package:dio/dio.dart';

class PhoneModelService {
  static const String baseUrl =
      'https://alpha.classaccess.io/api/challenge/v1/save/schedule';

  final Dio dio = Dio();

  Future<void> savePhoneModel(PhoneModel phoneModel) async {
    try {
      final response = await dio.post(baseUrl, data: phoneModel.toJson());

      if (response.statusCode == 200) {
        print('Phone model saved successfully');
      } else {
        throw Exception('Failed to save phone model');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception('Failed to save phone model: ${e.response?.data}');
      } else {
        throw Exception('Failed to save phone model: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to save phone model: $e');
    }
  }
}
