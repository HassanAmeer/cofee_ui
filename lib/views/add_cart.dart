import 'package:coffee/utils/colors.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  final dynamic image;
  const AddToCart({Key? key, this.image});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: white,
                width: 2.0,
              ),
            ),
            child: const Icon(Icons.arrow_back_rounded, color: white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: white,
                  width: 2.0,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.favorite, color: white),
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.45,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.36,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(45),
                          bottomStart: Radius.circular(45),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/beansBackground2.png',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width * 0.25 / 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5 / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(130),
                          boxShadow: [
                            BoxShadow(
                              color: bglite,
                              offset: Offset(0, 25),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: 'imageT',
                          child: Image.asset(
                            widget.image,
                            // width: 48.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight * 0.034,
                    width: screenWidth * 0.16,
                    decoration: BoxDecoration(
                      color: bglite,
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          color: white,
                          size: 14,
                        ),
                        Text('4.8', style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01 / 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cappuccino',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${22.50}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015 / 1,
                  ),
                  Text(
                    'Coffee size',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08 / 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                    currentIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.27 /
                                        1,
                                    decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? bglite
                                            : Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(29)),
                                    child: Center(
                                        child: Text(
                                      data[index]['title'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: currentIndex == index
                                              ? white
                                              : Colors.black),
                                    )),
                                  ),
                                ),
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01 / 1,
                  ),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01 / 1,
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nec quam sit amet mauris malesuada commodo. Maecenas ac dui sagittis.',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03 / 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Volume ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 148, 146, 146),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: '110ml',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.24 / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                          border: Border.all(
                            color: Colors.black54,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(Icons.remove),
                              Text(
                                '5',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025 / 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: white,
                          radius: 25.0,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.71 / 1,
                          decoration: BoxDecoration(
                            color: bglite,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
