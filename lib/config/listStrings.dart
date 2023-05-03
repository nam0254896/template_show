class ListStringConfig {
  static final Map<dynamic, dynamic> listStringConfig = {};
  static getListString(String key) {
    return listStringConfig[key];
  }

  static void setListString(String key, String value) {
    listStringConfig[key] = value;
    print('setListString: $key, $value');
  }

  static getValueInList(String listString, key) {
    return getListString(listString)[key] ?? key;
  }
}
