import 'package:get/get.dart';
import 'package:test_assignment/models/account_list_model.dart';
import 'package:test_assignment/models/domain_list_model.dart';
import 'package:test_assignment/repositries/rest_api.dart';

class MessageController extends GetxController{

  Rx<DomainListModel> message = DomainListModel().obs;
  RxBool messageDataLoaded = false.obs;

  @override
  void onInit() {
    getMessage();
    super.onInit();
  }

  void getMessage() async{
     var messageInfo =await RestApiRepository().getMessages();
     message.value=messageInfo;
     messageDataLoaded.value = true;
  }
}