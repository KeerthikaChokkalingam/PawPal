import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../view/pets_list_card.dart';

ValueNotifier<int> selectedCategoryIndex = ValueNotifier(0);

class Homescreen extends StatelessWidget {
   Homescreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            titleRow(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: searchRow(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: categoryTextRow(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: petsCategoryList(),
            ),
          ],
        ),
      ),
    );
  }
  // View Widgets
  Row titleRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleTextColumn(),
        Bounceable(
          onTap: () {
            // sort tap action
          },
          child: Container(
            width: 30,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border(right: BorderSide(color: Colors.black,width: 0.5,),left: BorderSide(color: Colors.black,width: 0.5,),top: BorderSide(color: Colors.black,width: 0.5,),bottom: BorderSide(color: Colors.black,width: 0.5,))
            ),
            child: const Center(
              child: CircleAvatar(backgroundColor:  Colors.white,
                  child: Icon(Icons.sort, size: 20, color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
  Column titleTextColumn(){
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Let's find a",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 16,
              letterSpacing: 0.8,
            )),
        SizedBox(height: 8,),
        Text("Little Friends",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.9,
            ))
      ],
    );
  }
  Row searchRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
            Expanded(
              child: Container(
                height: 50,
                margin: const EdgeInsets.only(right: 30),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5,color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
              ),
            ),
        Bounceable(
          onTap: () {
            // filter tap action
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                border: Border(right: BorderSide(color: Colors.black,width: 0.5,),left: BorderSide(color: Colors.black,width: 0.5,),top: BorderSide(color: Colors.black,width: 0.5,),bottom: BorderSide(color: Colors.black,width: 0.5,))
            ),
            child: const Center(
              child: CircleAvatar(backgroundColor:  Colors.white,
                  child: Icon(Icons.filter_7_rounded, size: 20, color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
  Row categoryTextRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Category",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 22,
              letterSpacing: 0.9,
              fontWeight: FontWeight.w500
            )),
        Bounceable(
          onTap: (){
            // view all tap action
          },
          child: const Text("View all",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 0.8,
              )),
        ),
      ],
    );
  }
  Container petsCategoryList(){
    return Container(
      color: Colors.transparent,
          height: 150,
          child: ListView.separated(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Bounceable(
                  onTap:(){
                    selectedCategoryIndex.value = index;
                  },
                  child: PetsListCard(index: index));
            },
            separatorBuilder: (context, index) => const Divider(),
          ),
    );
  }
}
