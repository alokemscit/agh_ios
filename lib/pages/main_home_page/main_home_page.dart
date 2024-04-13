// ignore_for_file: avoid_unnecessary_containers, non_constant_identifier_names, unused_element, unused_element

import 'package:asgar_ali_hospital/constant/const.dart';
import 'package:asgar_ali_hospital/data/data_static_user.dart';
import 'package:asgar_ali_hospital/pages/login_page/login_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/connection_error_page.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/connection_controller.dart';
import 'package:asgar_ali_hospital/pages/main_home_page/controller/main_home_page_controller.dart';
import 'package:get/get.dart';

class MainHomePagae extends StatelessWidget {
  const MainHomePagae({super.key});

  @override
  Widget build(BuildContext context) {
    MainHomePagaeController controller = Get.put(MainHomePagaeController());
    controller.context = context;

    final ConnectivityService connectivityService =
        Get.find<ConnectivityService>();

    return Obx(() {
      if (!connectivityService.isConnected) {
        //print("fired");
        return const ConnectionErrorPage();
      } else {
        return Scaffold(
          //backgroundColor: kBgLightColor,
          // backgroundColor:appColorPista.withOpacity(0.5),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Obx(() {
                return Column(
                  children: [
                    45.heightBox,
                    _logo_and_user_part(controller),
                    32.heightBox,
                    Expanded(
                      child: controller.pageList[controller.currentIndex.value],
                    ),
                  ],
                );
              })),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedFontSize: 13.0,
                unselectedFontSize: 10.5,
                selectedLabelStyle: const TextStyle(fontFamily: appFontMuli),
                type: BottomNavigationBarType.fixed,
                iconSize: 20.0,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.people_outline),
                    label: 'Doctor',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.liquor_outlined),
                    label: 'Lab Report',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.library_books_sharp),
                    label: 'Prescription',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.devices_other_sharp),
                    label: 'Others',
                  ),
                ],
                currentIndex: controller.currentIndex.value,
                selectedItemColor: appColorLogo,
                onTap: (v) {
                  if (v == 2 || v == 3) {
                    if (DataStaticUser.hcn == '') {
                      CustomCupertinoAlertWithYesNo(
                          context,
                          const Text("Alert"),
                          const Text(
                              "You have to login first\n Do you want to log in?"),
                          () {}, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      });
                      return;
                    }
                  }
                  controller.currentIndex.value = v;
                },
              )),
        );
      }
    });
  }
}

_logo_and_user_part(MainHomePagaeController controller) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
            height: 55,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              hoverColor: appColorLogo,
              highlightColor: appColorPista,
              borderRadius: BorderRadius.circular(50),
              onTap: () {
                controller.logoClick();
                // print("object");
              },
              child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 2),
                  width: 38,
                  height: 38,
                  // padding: const EdgeInsets.symmetric(horizontal:4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(50),
                      color: appColorPista),
                  child: Opacity(
                    opacity: 0.9,
                    child: ClipRRect(
                        borderRadius: BorderRadiusDirectional.circular(50),
                        child: DataStaticUser.img ?? const Icon(Icons.people)),
                  )),
            ),
            Text(
              DataStaticUser.name == '' ? "Geust   " : DataStaticUser.name,
              style: customTextStyleDefault.copyWith(
                  fontSize: 8, fontWeight: FontWeight.bold),
            )
            //"Aloke Sikder".text.sm.fontFamily(appFontMuli).make()
          ],
        )
      ],
    );








// _imageDoctor(MainHomePagaeController controller) => Container(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       height: 160,
      
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
//             child: Container(
//                decoration:  BoxDecoration(
//                         borderRadius: const BorderRadius.all(Radius.circular(8)),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               blurRadius: 4,
//                               spreadRadius: 1,
//                               color: appColorGrayDark.withOpacity(0.2)),
//                         ]),
//               height: 150,
//                margin: const EdgeInsets.only(right: 4),
//               child: Stack(
//                 children: [
//                   SizedBox(
                   
//                     height: 110,
//                     width: 110,
                   
                 
//                      child:
//                      Obx(() => controller.isLoading.value?const SizedBox():  Image.network(
//                          'https://www.asgaralihospital.com/storage/${GetDoctorImage().ImageList().where((element) => element.id == controller.list_doctor_master[index].dOCID).isEmpty ? "doctors/vczm1a75nsZZfBfxqpXWvZzDI.webp" : GetDoctorImage().ImageList().where((element) => element.id == controller.list_doctor_master[index].dOCID).first.image!}'),)
            
                     
                  
                  
//                   ),
//                   Positioned(
//                       left: 0,
//                       right: 0,
//                       bottom: 4,
//                       child: 
                      
//                       Container(
//                         //color: Colors.white,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
                                      
//                            Obx(() => controller.isLoading.value? const Text("") : 
//                           Padding(
//                             padding: const EdgeInsets.only(right: 6,left: 6),
//                             child: Column(
//                               children: [
//                                 Text( 
//                                  overflow:TextOverflow.ellipsis,
//                                   controller.list_doctor_master[index].dOCTORNAME!.isEmpty?"":controller.list_doctor_master[index].dOCTORNAME!,
//                                  style: customTextStyle.copyWith(fontSize: 10,fontWeight: FontWeight.w800),
//                                 ),
//                                 Text( 
//                                  overflow:TextOverflow.ellipsis,
//                                   controller.list_doctor_master[index].uNIT!.isEmpty?"":controller.list_doctor_master[index].uNIT!,
//                                  style: customTextStyle.copyWith(fontSize: 8,fontWeight: FontWeight.w800),
//                                 ),
//                               ],
//                             ),
//                           ))
//                             // controller.list_doctor_master.where((p0) => p0.dOCID==GetDoctorImage().ImageList()[index].id).first.dOCTORNAME!.text.fontFamily(appFontMuli).sm.make()
//                           ],
//                         ),
//                       ))
                      
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
// _gridView(MainHomePagaeController controller) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 20),
//     child: GridView.builder(
//       padding: EdgeInsets.zero,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 4,
//         mainAxisSpacing: 18,
//         crossAxisSpacing: 18,
//       ),
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: iconList.length,
//       itemBuilder: (BuildContext context, index) {
//         var list = iconList[index];
//         return GestureDetector(
//           onTap: () {
//             //Navigator.pushNamed(context, list['route']);
//           },
//           child: Container(
//             padding: const EdgeInsets.all(4),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadiusDirectional.circular(8),
//                 color: Colors.white,
//                 boxShadow: const [
//                   BoxShadow(
//                       blurRadius: 2, spreadRadius: 3, color: appColorGray200)
//                 ]),
//             child: SizedBox(
//               width: 56,
//               height: 56,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topCenter,
//                           end: Alignment.bottomCenter,
//                           colors: [
//                             Colors.white,
//                             Colors.white.withOpacity(0),
//                           ],
//                         ),
//                         shape: BoxShape.circle,
//                         boxShadow: const [
//                           BoxShadow(
//                             color: appColorGrayLight,
//                             spreadRadius: 1,
//                             blurRadius: 20,
//                             offset:
//                                 Offset(0, 0), // x, y changes position of shadow
//                           )
//                         ],
//                       ),
//                       child: Center(
//                         child: Opacity(
//                           opacity: 0.9,
//                           child: Image.asset(
//                             list.icon,
//                             height: 30,
//                             width: 30,
//                             color: appColorGrayDark,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   //const SizedBox(height: 8),
//                   Text(
//                     list.name,
//                     textAlign: TextAlign.center,
//                     style: customTextStyleDefault.copyWith(
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black.withOpacity(0.8)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }

// _department_list(MainHomePagaeController controller) => Container(
//         child: Obx(
//       () => SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Wrap(
//           children: [
//             for (var i = 0; i < controller.list_docunit.length; i++)
//               Padding(
//                 padding: const EdgeInsets.only(right: 4),
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 4),
//                   margin:
//                       const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(4),
//                       color: appColorGrayLight,
//                       boxShadow: [
//                         BoxShadow(
//                             blurRadius: 4,
//                             spreadRadius: 0.5,
//                             color: appColorGrayDark.withOpacity(0.1))
//                       ]),
//                   //height: 42,
//                   // width: 110,
//                   child: Center(
//                       child: controller.list_docunit[i].NITTITLE!.text
//                           .align(TextAlign.start)
//                           .fontFamily(appFontMuli)
//                           .center
//                           .sm
//                           .make()),
//                 ),
//               )
//           ],
//         ),
//       ),
//     ));

// _cursol_part(List<String> img_list) => Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadiusDirectional.circular(8),
//           color: appColorGrayLight,
//           boxShadow: [
//             BoxShadow(
//                 blurRadius: 5,
//                 spreadRadius: 0.5,
//                 color: Colors.black.withOpacity(0.23))
//           ]),
//       child: CarouselSlider.builder(
//         itemCount: img_list.length,
//         options: CarouselOptions(
//           height: 90,
//           autoPlay: true,
//           // aspectRatio: 2,
//           viewportFraction: 1,
//           enlargeCenterPage: false,
//         ),
//         itemBuilder: (context, index, realIdx) {
//           return Container(
//             padding: EdgeInsets.zero,
//             child: ClipRRect(
//               borderRadius: BorderRadiusDirectional.circular(8),
//               child: Opacity(
//                 opacity: 0.7,
//                 child: Image.asset(img_list[index],
//                     fit: BoxFit.cover, width: context.width),
//               ),
//             ),
//           );
//         },
//       ),
//     );

// _logo_and_user_part(MainHomePagaeController controller) => Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Opacity(
//           opacity: 0.8,
//           child: Image.asset(
//             "assets/images/logo.png",
//             fit: BoxFit.cover,
//             height: 55,
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             InkWell(
//               hoverColor: appColorLogo,
//               highlightColor: appColorPista,
//               borderRadius: BorderRadius.circular(50),
//               onTap: () {
//                 controller.logoClick();
//                 // print("object");
//               },
//               child: Container(
//                  // margin: const EdgeInsets.symmetric(horizontal: 2),
//                   width: 38,
//                   height: 38,
//                  // padding: const EdgeInsets.symmetric(horizontal:4),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadiusDirectional.circular(50),
//                       color: appColorPista),
//                   child: Opacity(
//                     opacity: 0.9,
//                     child: ClipRRect(
                      
//                         borderRadius: BorderRadiusDirectional.circular(50),
//                         child: DataStaticUser.img ?? const Icon(Icons.people)),
//                   )),
//             ),
//             Text(
//               DataStaticUser.name == '' ? "Geust   " : DataStaticUser.name,
//               style: customTextStyleDefault.copyWith(fontSize: 8,fontWeight: FontWeight.bold),
//             )
//             //"Aloke Sikder".text.sm.fontFamily(appFontMuli).make()
//           ],
//         )
//       ],
//     );
