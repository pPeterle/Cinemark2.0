import 'package:bot_toast/bot_toast.dart';
import 'package:cinemark_2/app/shared/errors/errors.dart';

class ErrorHandler {
  void showErrorMessage(Failure fail) async {
    BotToast.showSimpleNotification(title: fail.message);
  }
}
