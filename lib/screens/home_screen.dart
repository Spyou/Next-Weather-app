import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_app_2/controller/main_controller.dart';
import 'package:weather_app_2/screens/about_page.dart';
import 'package:weather_app_2/services/current_weather.dart';
import 'package:weather_app_2/utils/const/strings.dart';

import '../services/hour_weather.dart';
import '../utils/const/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(MainController());
    var theme = Theme.of(context);
    var date = DateFormat("yMMMMd").format(DateTime.now());
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        //AppBar with action 2 button
        appBar: AppBar(
          title: Text(
            date,
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          actions: [
            Obx(
              //dark mode - light mode
              () => IconButton(
                onPressed: () {
                  controller.changeTheme();
                },
                icon: Icon(
                  controller.isDark.value
                      ? Icons.light_mode
                      : Icons.dark_mode_rounded,
                  color: theme.iconTheme.color,
                ),
              ),
            ),
            //more
            PopupMenuButton(
              onSelected: (result) {
                if (result == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: theme.popupMenuTheme.color,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: theme.iconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Change Location',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: theme.iconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Setting',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: theme.iconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'About',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    if (Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else {
                      exit(0);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: theme.iconTheme.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Exit',
                          style: TextStyle(color: theme.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              icon: Icon(
                Icons.more_vert,
                color: theme.iconTheme.color,
              ),
            )
          ],
        ),
        body: Obx(
          () => controller.isloaded.value == true
              ? Container(
                  padding: const EdgeInsets.all(12),
                  child: FutureBuilder(
                      future: controller.currentweatherdata,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          CurrentWeatherData data = snapshot.data;
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Location name
                                FadeInLeft(
                                  duration: const Duration(milliseconds: 700),
                                  delay: const Duration(milliseconds: 300),
                                  child: "${data.name}"
                                      .text
                                      .size(32)
                                      .letterSpacing(2)
                                      .color(theme.primaryColor)
                                      .make(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  // Current Main Icon
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FadeInLeft(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      delay: const Duration(milliseconds: 300),
                                      child: Image.asset(
                                        "assets/weather/${data.weather?[0].icon}.png",
                                        width: 80,
                                        height: 80,
                                      ),
                                    ),
                                    // Current temperature with small detail
                                    FadeInRight(
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      delay: const Duration(milliseconds: 300),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: "${data.main?.temp}$degree",
                                            style: TextStyle(
                                              color: theme.primaryColor,
                                              fontSize: 64,
                                            )),
                                        TextSpan(
                                            text: "${data.weather?[0].main}",
                                            style: TextStyle(
                                              letterSpacing: 1,
                                              color: theme.secondaryHeaderColor,
                                              fontSize: 14,
                                            ))
                                      ])),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                // 3 listed Icon Humidity, Wind, Clouds.
                                FadeInLeft(
                                  duration: const Duration(milliseconds: 900),
                                  delay: const Duration(milliseconds: 300),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: List.generate(3, (index) {
                                      var iconsList = [
                                        clouds,
                                        humidity,
                                        windspeed
                                      ];
                                      var values = [
                                        "${data.clouds?.all}",
                                        "${data.main?.humidity}",
                                        "${data.wind?.speed} km/h"
                                      ];
                                      return Column(
                                        children: [
                                          Image.asset(
                                            iconsList[index],
                                            width: 50,
                                            height: 50,
                                          )
                                              .box
                                              .color(theme.focusColor)
                                              .padding(const EdgeInsets.all(10))
                                              .customRounded(
                                                  BorderRadius.circular(20))
                                              .make(),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          values[index]
                                              .text
                                              .color(theme.primaryColor)
                                              .make(),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Divider(color: theme.dividerColor),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    "Today's"
                                        .text
                                        .semiBold
                                        .size(18)
                                        .color(theme.primaryColor)
                                        .make(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Middle Container Part
                                FadeInLeft(
                                  duration: const Duration(milliseconds: 900),
                                  delay: const Duration(milliseconds: 400),
                                  child: FutureBuilder(
                                    future: controller.hourlyweatherdata,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        HourlyWeatherData hourData =
                                            snapshot.data;
                                        return SizedBox(
                                          height: 150,
                                          child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: hourData.list!.length > 7
                                                ? 7
                                                : hourData.list?.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var time = DateFormat.jm().format(
                                                  DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          hourData.list![index]
                                                                  .dt!
                                                                  .toInt() *
                                                              1000));
                                              return Container(
                                                width: 110,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                margin: const EdgeInsets.only(
                                                    right: 6),
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 1, 124, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  children: [
                                                    time.text.gray300.make(),
                                                    Image.asset(
                                                      "assets/weather/${hourData.list![index].weather![0].icon}.png",
                                                      width: 70,
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    "${hourData.list![index].main!.temp}$degree"
                                                        .text
                                                        .white
                                                        .make(),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    "Next 6 Day's"
                                        .text
                                        .semiBold
                                        .size(18)
                                        .color(theme.primaryColor)
                                        .make(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                // Bottom listed container part
                                FadeInLeft(
                                  duration: const Duration(milliseconds: 1200),
                                  delay: const Duration(milliseconds: 400),
                                  child: FutureBuilder(
                                    future: controller.hourlyweatherdata,
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        HourlyWeatherData dayData =
                                            snapshot.data;
                                        return Container(
                                          height: 410,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                67, 158, 158, 158),
                                          ),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: 6,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              var day = DateFormat("EEEE")
                                                  .format(DateTime.now().add(
                                                      Duration(
                                                          days: index + 1)));
                                              return Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 5),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                        child: day.text.semiBold
                                                            .color(theme
                                                                .primaryColor)
                                                            .make()),
                                                    Expanded(
                                                      child: TextButton.icon(
                                                        onPressed: () {},
                                                        icon: Image.asset(
                                                          "assets/weather/${dayData.list![index].weather![0].icon}.png",
                                                          width: 40,
                                                        ),
                                                        label:
                                                            "${dayData.list![index].main!.temp}$degree"
                                                                .text
                                                                .color(theme
                                                                    .primaryColor)
                                                                .make(),
                                                      ),
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      TextSpan(
                                                          text:
                                                              "${dayData.list![index].main!.tempMin}$degree /",
                                                          style: TextStyle(
                                                            color: theme
                                                                .primaryColor,
                                                            fontSize: 16,
                                                          )),
                                                      TextSpan(
                                                          text:
                                                              "${dayData.list![index].main!.tempMax}$degree",
                                                          style: TextStyle(
                                                            color: theme
                                                                .secondaryHeaderColor,
                                                            fontSize: 16,
                                                          ))
                                                    ]))
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }
                                      return const Center(
                                        child: SpinKitDoubleBounce(
                                          color: Colors.blue,
                                          size: 50.0,
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return const Center(
                            child: SpinKitDoubleBounce(
                              color: Colors.blue,
                              size: 50.0,
                            ),
                          );
                        }
                      }),
                )
              : const Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ),
        ));
  }
}
