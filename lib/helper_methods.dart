
List<String> splitAndBuildArray(String value) {
    var splitted = value.split(',');
    return splitted;
  }

  int compareValues(String a, String b) {
    double valA = double.parse(a);
    double valB = double.parse(b);
    if (valA >= valB) return 1;
    return 0;
  }