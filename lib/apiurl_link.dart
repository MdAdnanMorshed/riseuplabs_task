class ApiUrl {
  static String globalUrl = '';
  static String baseUrl = 'https://api.mail.tm';

  ///--------- Domain----------------------
  static String domainListGETAPI = baseUrl + 'domains?page=1';
  static String domainListByIdGETAPI = baseUrl + '/domains/'; //id 613f72dc2a2501052c66504d

  ///--------------Account ------------------
  static String createDomainAccountPOSTAPI = baseUrl + '/accounts';
  static String domainAccountByIdGETAPI = baseUrl + '/accounts/'; // by id
  static String domainAccountByIdDELETEAPI = baseUrl + '/accounts/'; //by id
  static String domainAccountListGETAPI = baseUrl + '/me'; //need to token
  ///-----------------token--------------------------
  static String authTokenByMapPOSTAPI = baseUrl+'/token';

  /*
  eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MzMzNjA1ODEsInJvbGVzIjpbIlJPTEVfVVNFUiJdLCJ1c2VybmFtZSI6ImFkbmFuQHB1c3Nwb3J0LmNvbSIsImlkIjoiNjE1YjBlZTJmOTE0ZTM1YmNiNGVmNWE1IiwibWVyY3VyZSI6eyJzdWJzY3JpYmUiOlsiL2FjY291bnRzLzYxNWIwZWUyZjkxNGUzNWJjYjRlZjVhNSJdfX0.XKv7afj0YjFVYTuwMdqNA3Lk4ByQa2BMxicxwT5ISPeRa9x26Om82hOxtvVjo1J_nVUyWcWufPN2aQKtlinpNw",
  "id": "615b0ee2f914e35bcb4ef5a5
   */

  ///----------------- Messages -----------------------
  static String messageListGETAPI = '/messages';
  static String messagesBYIdGETAPI = baseUrl + '/messages/'; //by id
  static String messagesBYIdDELETEAPI = baseUrl + '/messages/'; //by id
  static String messagesBYIdUPDATEAPI = baseUrl+'/messages/'; //by id

  ///----------------- Source  -----------------------
  static String sourcesByIdGETAPI = 'https://api.mail.tm/sources/'; //by id

}
