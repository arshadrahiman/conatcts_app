import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/Ui/home/bind/home_bind.dart';
import 'package:task_app/res/colors.dart';
import 'package:task_app/res/style.dart';
import 'package:task_app/utils/route/routes.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        actions: const[
          Icon(Icons.search),
           SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: AppColors.white,
      body: GetBuilder<HomePageController>(builder: (logic) {
        return SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(8),
              height: size.height,
              width: size.width,
              child: (logic.dbUsers.isNotEmpty)
                  ? ListView.builder(
                      itemCount:
                          (logic.dbUsers.length < 0) ? logic.users.length : 10,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            Get.toNamed(Routes.detailsPage, arguments: [
                              '${logic.dbUsers[index].name}',
                              '${logic.dbUsers[index].userName}',
                              '${logic.dbUsers[index].email}',
                              '${logic.dbUsers[index].addressStreet}',
                              '${logic.dbUsers[index].addressSuit}',
                              '${logic.dbUsers[index].addressCity}',
                              '${logic.dbUsers[index].zipcode}',
                              '${logic.dbUsers[index].latitude}',
                              '${logic.dbUsers[index].longitude}',
                              '${logic.dbUsers[index].phone}',
                              '${logic.dbUsers[index].website}',
                              '${logic.dbUsers[index].companyName}',
                              '${logic.dbUsers[index].companycatchPhrase}',
                              '${logic.dbUsers[index].companyBs}',
                            ]);
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(child: Icon(Icons.phone)),
                              title: Text(logic.dbUsers[index].name.toString()),
                              subtitle:
                                  Text(logic.dbUsers[index].phone.toString()),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('No data found'),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              logic.getData();
                              if (logic.connectionStatus.value == 0) {
                                Get.defaultDialog(
                                    title: 'connectivity status',
                                    middleText:
                                        'no Internet connection\n Try Again');
                                Future.delayed(
                                    const Duration(milliseconds: 2000),
                                    () async {
                                  Get.back();
                                });
                              }
                            },
                            child: Container(
                              height: 30,
                              width: 150,
                              color: Colors.red,
                              child: Center(
                                  child: Text(
                                'Try again',
                                style: customStyle(
                                    18.0, AppColors.white, FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    )),
        );
      }),
    );
  }
}
