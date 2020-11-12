/*import 'baseModel.dart';
import 'package:tooteptravelapp/src/services/navigation_service.dart';
import 'package:tooteptravelapp/src/services/locator.dart';
import 'package:tooteptravelapp/src/utils/routes_paths.dart' as routes;

class LoginViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      _navigationService.navigateTo(routes.HomeRoute, arguments: '\nFilledStacks');
      setErrorMessage(null);
    }

    setBusy(false);
  }
}*/