import 'package:flutter/material.dart';

import '../homeTab/homeScreen.dart';

class PetsListCard extends StatelessWidget {
  int index;
   PetsListCard({super.key,required this.index});
   
  final categoryImageList = [
    'assets/dogs.webp',
    'assets/cat.png',
    'assets/birds.png',
    'assets/rabit.jpg',
  ];
  final categoryNameList = [
    'Dogs',
    'Cats',
    'Birds',
    'Rabits',
  ];
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedCategoryIndex,
        builder: (BuildContext context,int value, Widget? child) {
        return Container(
          decoration: BoxDecoration(
              color: value == index ? Colors.orange : Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(55))
          ),
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.only(top: 20,bottom: 25),
          height: 150,
          width: 110,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35))
                ),
                child: Center(
                  child: CircleAvatar(backgroundColor:  Colors.white,
                      child: Image.asset(categoryImageList[index])),

                ),
              ),
               Text(
                 categoryNameList[index],
                style: const TextStyle(
                  color: Colors.black,
                  letterSpacing: 0.8,
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),);
      }
    );
  }
}
