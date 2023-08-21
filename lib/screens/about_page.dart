import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: theme.primaryColor,
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text(
          'About',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w500,
            color: theme.primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 700),
                child: Card(
                  color: theme.focusColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/88382789?v=4',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Krishna Vishwakarma',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      'Web/App Developer',
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                    trailing: Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.link,
                            color: theme.primaryColor,
                          ),
                          tooltip: 'Github',
                          onPressed: () {
                            launchUrl(
                              Uri.parse('https://github.com/Spyou'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 6),
              child: FadeInLeft(
                duration: const Duration(milliseconds: 1100),
                child: Card(
                  color: theme.focusColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/104021711?v=4',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Ashutosh Pandey',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: theme.primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      'Web/App Developer',
                      style: TextStyle(
                        color: theme.primaryColor,
                      ),
                    ),
                    trailing: Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.link,
                            color: theme.primaryColor,
                          ),
                          tooltip: 'Github',
                          onPressed: () {
                            launchUrl(
                              Uri.parse('https://github.com/Ashutosp'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/weather/02d.png'),
                      Text(
                        "Version: 1.0",
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Real-time Weather Updates : ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                        children: const [
                          TextSpan(
                            text:
                                "We use the latest data from trusted sources to give you real-time weather updates, ensuring that you're always in the know about the current conditions.",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Hourly and Daily Forecasts : ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                        children: const [
                          TextSpan(
                            text:
                                " Plan your activities with confidence using our detailed hourly and daily forecasts. Get a clear picture of what to expect throughout the day.",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Global Coverage : ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                        children: const [
                          TextSpan(
                            text:
                                "Whether you're at home or traveling around the world, Next Weather provides weather information for locations across the globe.",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Support : ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor),
                        children: const [
                          TextSpan(
                            text: "Give us to star on github and support us",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      )
                    ],
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
