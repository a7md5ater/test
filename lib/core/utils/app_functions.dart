class AppFunctions {
  static String? handleTextFieldValidator({
    required List<bool> conditions,
    required List<String> messages,
  }) {
    String? result;
    for (int i = 0; i < conditions.length; i++) {
      if (conditions[i]) {
        result = messages[i];
      }
      if (result != null) break;
    }
    return result;
  }
}
