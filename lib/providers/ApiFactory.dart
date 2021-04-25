class ApiFactory {
  static String MAIN_URL = 'https://test.turbocare.app/turbo/care/v1/';
  static String WHEELERS = MAIN_URL+"makes?class=";
  static String VEH_MODEL({String classType, String maker}){
    return MAIN_URL+"models?class=$classType&make=$maker";
  }
}
