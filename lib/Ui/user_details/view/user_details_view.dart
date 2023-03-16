import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/Ui/home/bind/home_bind.dart';
import 'package:task_app/res/colors.dart';
import 'package:task_app/widgets/common_widgets.dart';

class UserDetailsPageView extends StatelessWidget {
  final data = Get.arguments;

  UserDetailsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        title: const Text('Contact Details'),
        centerTitle: true,
      ),      backgroundColor: AppColors.white,
      body: GetBuilder<HomePageController>(builder: (logic) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        child: Text(data[0][0]),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                DetailsWidg(
                  title: 'Name',
                  subTitle: data[0],
                  icontype: const Icon(
                    Icons.person_2_rounded,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'User-Name',
                  subTitle: data[1],
                  icontype: const Icon(
                    Icons.person_2_rounded,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'E-mail',
                  subTitle: data[2],
                  icontype: const Icon(
                    Icons.mail,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Phone',
                  subTitle: data[9],
                  icontype: const Icon(
                    Icons.phone,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Company',
                  subTitle: '${data[11]}, ${data[12]}, ${data[13]}',
                  icontype: const Icon(
                    Icons.laptop_mac,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Website',
                  subTitle: data[10],
                  icontype: const Icon(
                    Icons.web,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Street',
                  subTitle: data[3],
                  icontype: const Icon(
                    Icons.streetview,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Suite',
                  subTitle: data[4],
                  icontype: const Icon(
                    Icons.apartment,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'City',
                  subTitle: data[5],
                  icontype: const Icon(
                    Icons.location_city,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Zip-Code',
                  subTitle: data[6],
                  icontype: const Icon(
                    Icons.share_location_sharp,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Geo-Latitude',
                  subTitle: data[7],
                  icontype: const Icon(
                    Icons.location_pin,
                    size: 35,
                  ),
                ),
                DetailsWidg(
                  title: 'Geo-Longitude',
                  subTitle: data[8],
                  icontype: const Icon(
                    Icons.location_pin,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
