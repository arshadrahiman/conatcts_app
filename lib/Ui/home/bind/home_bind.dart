import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:task_app/models/db_model.dart';
import 'package:task_app/models/users_model.dart';
import 'package:task_app/utils/api/api_services.dart';
import 'package:task_app/utils/utils.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  UsersModel? usersModel;
  List<dynamic> users = [];
  var dbUsers = [];
  var connectionStatus = 0.obs;
  var usersLength = 0.obs;

  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  void getData() async {
    checkConnectivity();
    getDbUserData();
  }

  checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      connectionStatus.value = 1;
    } else {
      connectionStatus.value = 0;
    }
    Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        connectionStatus.value = 1;
        update();

        Get.defaultDialog(
            title: 'connectivity status', middleText: 'connected');
        Future.delayed(const Duration(milliseconds: 500), () async {
          Get.back();
        });
        getUserData();
        Future.delayed(const Duration(milliseconds: 500), () async {
          getDbUserData();
        });
      } else {
        connectionStatus.value = 0;
        update();
        Get.defaultDialog(
            title: 'connectivity status', middleText: 'disconnected');
        Future.delayed(const Duration(milliseconds: 2000), () async {
          Get.back();
        });

        getDbUserData();
      }
    });
    return connectionStatus.value;
  }

  void inserUserDB(int length) async {
    for (int i = 0; i <= length; i++) {
      final data = DbUsers(
          email: users[i]['email'].toString(),
          name: users[i]['name'].toString(),
          phone: users[i]['phone'].toString(),
          addressCity: users[i]['address']['city'].toString(),
          addressStreet: users[i]['address']['street'].toString(),
          addressSuit: users[i]['address']['suite'].toString(),
          companyBs: users[i]['company']['bs'].toString(),
          companyName: users[i]['company']['name'].toString(),
          companycatchPhrase: users[i]['company']['catchPhrase'].toString(),
          latitude: users[i]['address']['geo']['lat'].toString(),
          longitude: users[i]['address']['geo']['lng'].toString(),
          userName: users[i]['username'].toString(),
          website: users[i]['website'].toString(),
          zipcode: users[i]['address']['zipcode'].toString());

      Future.delayed(const Duration(milliseconds: 1000), () async {
        await insertFruit(data);
      });
    }
  }

  void getDbUserData() async {
    dbUsers = await getDBData();
    update();
    print(dbUsers.length.toString());
  }

  void getUserData() async {
    var response = await ApiServices().getUserData();
    if (response.statusCode == 200) {
      final data = response.data;
      users = List<dynamic>.from(data);
      usersLength.value = users.length;
      update();
      Future.delayed(const Duration(milliseconds: 2000), () {
        DbClear();
        inserUserDB(usersLength.value);
      });
      getDbUserData();
    } else {
      Get.defaultDialog(
        middleText: 'something went wrong\n Try again',
      );
    }
  }
}
