String? validatePassword(String value) {
  if (value.isEmpty) {
    return "* Password is Required";
  } else if (value.length < 6) {
    return "Password should be atleast 6 characters";
  } else if (value.length > 15) {
    return "Password should not be greater than 15 characters";
  }
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return "* Email is Required";
  } else if (value.length <= 10 ||
      !RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}").hasMatch(value)) {
    return "Not a Valid Email ";
  }
}
