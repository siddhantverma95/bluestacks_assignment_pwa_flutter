import 'package:bluestack_assignment_pwa_flutter/core/validator.dart';
import 'package:bluestack_assignment_pwa_flutter/repository/repository.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class LoginViewModel {
  Repository repo = Repository.instance;
  Artboard _riveArtboard;
  bool _isUserNameValid = false;
  bool _isPasswordValid = false;
  bool _userAutoValidate = false;
  bool _passwordAutoValidate = false;

  Artboard get getRiveArtboard => _riveArtboard;

  bool get getUsername => _isUserNameValid;

  bool get getPassword => _isPasswordValid;

  bool get getUserAutoValidate => _userAutoValidate;

  bool get getPasswordAutoValidate => _passwordAutoValidate;

  bool get enableSubmitButton => _isUserNameValid && _isPasswordValid;

  Future<void> loadRiveArtboard(RiveAnimationController controller) async {
    await rootBundle.load('lib/resources/images/knight063.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(controller = SimpleAnimation('idle'));
          _riveArtboard = artboard;
        }
      },
    );
  }

  void validateUsername(String username) {
    _userAutoValidate = true;
    _isUserNameValid = Validator.passwordLengthValidator.hasMatch(username);
  }

  void validatePassword(String password) {
    _passwordAutoValidate = true;
    _isPasswordValid = Validator.passwordLengthValidator.hasMatch(password);
  }

  Future<bool> onSubmitButton(String username, String password) {
    if (username == '9898989898' && password == 'password12' ||
        username == '9876543210' && password == 'password12') {
      repo.cacheHelper.saveUserData(true);
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  Future<void> onLogout() {
    return repo.cacheHelper.saveUserData(false);
  }

  Future<bool> getLoggedIn() {
    return repo.cacheHelper.getUserData();
  }
}
