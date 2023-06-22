import 'package:coffee/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

import 'add_cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;
  var current = 0;

  List data = [
    {"title": 'Cappuccino'},
    {"title": 'Latte'},
    {"title": 'Espresso'},
    {"title": 'Moc'},
    {"title": 'Coffee'},
    {"title": 'Black Tea'},
  ];
  List size = [
    {"title": 'Small'},
    {"title": 'Medium'},
    {"title": 'Large'},
  ];
  List img = [
    {"image": "assets/images/coffee1.png"},
    {"image": "assets/images/coffee2.png"},
    {"image": "assets/images/coffee3.png"},
    {"image": "assets/images/coffee4.png"},
    {"image": "assets/images/coffee5.png"},
  ];
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_outline_rounded,
    Icons.shopping_bag_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: bottomBarF(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70.0),
            child: Image.asset(
              'assets/images/avatar.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.location_pin,
              color: bglite,
            ),
            Text(
              'New York, NYC',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.28 / 1,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.2,
                        image: AssetImage(
                          'assets/images/beansBackground1.png',
                        ))),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17 / 1,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.095 / 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 21),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: CircleAvatar(
                                  backgroundColor: bglite,
                                  child: const Icon(
                                    Icons.search,
                                    color: white,
                                    size: 26,
                                  ),
                                ),
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(27))),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
                // height: 1.h,
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.055 / 1,
              child: ListView.builder(
                  itemCount: data.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.27 / 1,
                            decoration: BoxDecoration(
                                color: current == index
                                    ? bglite
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(29)),
                            child: Center(
                                child: Text(
                              data[index]['title'],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      current == index ? white : Colors.black),
                            )),
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02 / 1,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 15,
              ),
              child: CarouselSlider(
                  items: img
                      .map((data) => Padding(
                            padding: const EdgeInsets.only(
                                top: 38, left: 18, bottom: 30),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: ((context) {
                                  return AddToCart(image: data['image']);
                                })));
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: bgdark,
                                    boxShadow: [
                                      BoxShadow(
                                        color: bglite,
                                        offset: const Offset(0, 7),
                                        blurRadius: 17,
                                      ),
                                      const BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0, 3),
                                        blurRadius: 10,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(33)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                        offset: Offset(
                                            MediaQuery.of(context).size.width *
                                                0.11 /
                                                1,
                                            -40),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(65),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: const Offset(0, 35),
                                                  blurRadius: 20,
                                                )
                                              ]),
                                          child: Hero(
                                            tag: 'imageT',
                                            child: Image.asset(
                                              data['image'],
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35 /
                                                  1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Black Coffee',
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 27,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                          // height: 1.h,
                                          ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.18 /
                                                1,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.08 /
                                                1,
                                        decoration: BoxDecoration(
                                          color: bglite.withOpacity(0.6),
                                          borderRadius:
                                              BorderRadius.circular(65),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: white,
                                              size: 14,
                                            ),
                                            Text('4.8')
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          // height: 1.h,
                                          ),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: 'Volume ',
                                            style: TextStyle(
                                                color: bglite,
                                                // fontSize: 14.sp,
                                                fontWeight: FontWeight.normal)),
                                        const TextSpan(
                                            text: '116ml',
                                            style: TextStyle(
                                                color: white,
                                                // fontSize: 14.sp,
                                                fontWeight: FontWeight.bold))
                                      ])),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Text('\$${25.50}',
                                              style: TextStyle(
                                                  color: white,
                                                  // fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold)),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(65),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.4),
                                                    offset:
                                                        const Offset(-10, -10),
                                                    blurRadius: 30,
                                                  )
                                                ]),
                                            child: const CircleAvatar(
                                              radius: 24,
                                              backgroundColor: white,
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      aspectRatio: 0.94)),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomBarF() {
    return Container(
      margin: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.075 / 1,
      decoration: BoxDecoration(
        color: bglite,
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.01 / 1,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3 / 1,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    height: index == currentIndex
                        ? MediaQuery.of(context).size.width * 0.13
                        : 0,
                    width: index == currentIndex
                        ? MediaQuery.of(context).size.width * 0.13 / 1
                        : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex ? white : bglite,
                      borderRadius: BorderRadius.circular(70),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.3 / 1,
                alignment: Alignment.center,
                child: Center(
                  child: Icon(
                    listOfIcons[index],
                    size: MediaQuery.of(context).size.width * 0.1 / 1,
                    color: index == currentIndex ? bglite : white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
