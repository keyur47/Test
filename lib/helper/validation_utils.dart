import 'package:dht/utils/strings_utils.dart';

class AppValidator {
  static String? emailValidator(String? value) {
    const Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return "Please enter email";
    } else if (!regex.hasMatch(value)) {
      return "Please enter valid email";
    } else {
      "";
    }
    return null;
  }
  static String? otpValidation(String? value) {
    if (value!.isEmpty) {
      return "Please fill 6 digit code";
    } else if (value.length != 6) {
      return "Please fill 6 digit code";
    } else {
      return null;
    }
  }

  static String? isValidMobile(String? value) {
    if (value!.isEmpty) {
      return "Please Enter your mobile number";
    } else if ((value.length != 10 /*> 7 && value.length < 11*/)) {
      return "Invalid mobile number";
    }
    return null;
  }


  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return StringsUtils.plzEnterPWD;
    }  else if ((value.length != 8 /*> 7 && value.length < 11*/)) {
      return StringsUtils.pWDMustBeUpperLower;
    } else {
      return null;
    }
  }

  static String? isLoginPasswordValid(String? value) {
    if (value!.isEmpty) {
      return StringsUtils.plzEnterPWD;
    }
    return null;
  }
  static String? isFirstNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Weight";
    }
    return null;
  }

  static String? isNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter name";
    }
    return null;
  }

  static String? isUserNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter user name";
    }
    return null;
  }

  static String? isCourseNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter course name";
    }
    return null;
  }

  static String? isCourseLocationValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter course location";
    }
    return null;
  }

  static String? playerNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter player name";
    }
    return null;
  }

  static String? handicapValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Handicap index";
    }
    return null;
  }

  static String? isNumberOfMatchesValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter number of matches played";
    }
    return null;
  }

  static String? teamNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter team name";
    }
    return null;
  }

  static String? teamDescriptionValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Description";
    }
    return null;
  }

  static String? teamOwnerValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter team owner";
    }
    return null;
  }

  static String? isTournamentNameValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter tournament name";
    }
    return null;
  }

  static String? isTournamentPrizeValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter tournament prize";
    }
    return null;
  }

  static String? isTournamentNumberOfRoundValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter number of round";
    }
    return null;
  }

  static String? isMatchNumberValid(String? value) {
    if (value!.isEmpty) {
      return "Please Enter number of match";
    }
    return null;
  }

  /// onboarding Screen

  static String? isBusinessName(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Business Name";
    }
    return null;
  }

  static String? isDirectorName(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Director Name";
    }
    return null;
  }

  static String? isHouseNumber(String? value) {
    if (value!.isEmpty) {
      return "Please Enter House Number ";
    }
    return null;
  }

  static String? isRoadName(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Road Name";
    }
    return null;
  }

  static String? isTownName(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Town Name";
    }
    return null;
  }

  static String? isPostCoed(String? value) {
    if (value!.isEmpty) {
      return "Please Enter PostCode Number";
    }
    return null;
  }

  static String? isContactTelephone(String? value) {
    if (value!.isEmpty) {
      return "Please Enter ContactTelephone Number";
    }
    return null;
  }

  static String? isNationalInsurance(String? value) {
    if (value!.isEmpty) {
      return "Please Enter NationalInsurance Number";
    }
    return null;
  }

  static String? isCompanyRegistration(String? value) {
    if (value!.isEmpty) {
      return "Please Enter CompanyRegistration Number";
    }
    return null;
  }

  static String? isVat(String? value) {
    if (value!.isEmpty) {
      return "Please Enter Vat Number";
    }
    return null;
  }

}

//
// extension Validator on String {
//   bool isValidEmail() {
//     String pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     if (this.isEmpty) {
//       showError("Please Enter your email address");
//       return false;
//     } else if (!regex.hasMatch(this)) {
//       showError("Email address is invalid");
//       return false;
//     }
//     return true;
//   }
//
//   bool isValidPassword() {
//     // String pattern =
//     //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     // RegExp regex = new RegExp(pattern);
//     print(this.length);
//     if (this.isEmpty) {
//       showError("Please Enter your password");
//       return false;
//     } else if (this.length < 6) {
//       showError("Password length must be at least 6 character long");
//       return false;
//     }
//     // else if (!regex.hasMatch(this)) {
//     //   showError("Password is invalid");
//     //   return false;
//     // }
//     return true;
//   }
//
//   bool isValidMobile() {
//     if (this.isEmpty) {
//       showError("Please Enter your mobile number");
//       return false;
//     } else if (!(this.length > 7 && this.length < 11)) {
//       showError("Invalid mobile number");
//       return false;
//     }
//     return true;
//   }
// }


