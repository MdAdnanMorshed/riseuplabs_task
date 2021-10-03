class ApiUrl {
  static String globalUrl = '';
  static String baseUrl = 'https://api.mail.tm';

  ///--------- Domain----------------------
  static String domainListGETAPI = baseUrl + 'domains?page=1';
  static String domainListByIdGETAPI =
      baseUrl + '/domains/'; //id 613f72dc2a2501052c66504d

  ///--------------Account ------------------
  static String createDomainAccountPOSTAPI = baseUrl + '/accounts';
  static String domainAccountByIdGETAPI = baseUrl + '/accounts/'; // by id
  static String domainAccountByIdDELETEAPI = baseUrl + '/accounts/'; //by id
  static String domainAccountListGETAPI = baseUrl + '/me'; //need to token
  ///-----------------token--------------------------
  static String authTokenByMapPOSTAPI = '/token';

  ///----------------- Messages -----------------------
  static String messageListGETAPI = '/messages?page=1';
  static String messagesBYIdGETAPI = baseUrl + '/messages/'; //by id
  static String messagesBYIdDELETEAPI = baseUrl + '/messages/'; //by id
  static String messagesBYIdUPDATEAPI = baseUrl+'/messages/'; //by id

  ///----------------- Source  -----------------------
  static String sourcesByIdGETAPI = 'https://api.mail.tm/sources/'; //by id

}
