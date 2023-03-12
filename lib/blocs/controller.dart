import 'package:coinedone/model/phone_post_model/phine_post_model.dart';
import 'package:coinedone/service/phone_post_service.dart';
import 'package:coinedone/view/widgets/bottomsheet.dart';

Future<void> posting() async {
  PhoneModel model = PhoneModel(
    name: BottenSheet().namecontroller.text,
    startTime: BottenSheet().starttimecontroller.text,
    endTime: BottenSheet().endtimecontroller.text,
    date: BottenSheet().datecontroller.text,
    phoneNumber: BottenSheet().phonenumbetcontroller.text,
  );
  PhoneModelService().savePhoneModel(model);
}
