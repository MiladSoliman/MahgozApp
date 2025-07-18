import 'package:flutter/material.dart';
import 'package:minamakram/constants/strings.dart';
import 'package:minamakram/models/building/buildingObject.dart';
import 'package:minamakram/models/building/floorObject.dart';
import 'package:minamakram/models/room/roomObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../constants/colors.dart';
import '../models/building_entity.dart';

class BuildingPage extends StatefulWidget {
  const BuildingPage({Key? key}) : super(key: key);

  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  List? myBuildings;
  Widget? buildingListWidget;

  @override
  void initState() {

    buildingListWidget = GridView.builder(

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 50,
        crossAxisSpacing: 10,
        // width / height: fixed for *all* items
        childAspectRatio: 0.7,
      ),
      // return a custom ItemCard
      itemBuilder: (context, i) => BuildingItem(item: myBuildings?[i]),
      itemCount: myBuildings!.length,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: MyColors.secondaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.building,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            fontFamily: 'Tajawal',
            color: MyColors.secondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: buildingListWidget,
      ),
    );
  }
}

class BuildingItem extends StatelessWidget {
  Buildingg item;
  BuildingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Navigator.pushNamed(context, buildingDetails,arguments: [item,true]);
          },
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 110,
                  decoration: BoxDecoration(
                    // image: const DecorationImage(
                    //   image: AssetImage("assets/images/img.png"),
                    //   fit: BoxFit.fill
                    // ),
                      color: Colors.grey,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                      border: Border.all(
                          width: 1, color: const Color.fromRGBO(207, 198, 198, 1))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Text(
                  "عدد الادوار ${item.floors.length}",
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
                Text(
                  "عدد القاعات ${item.floors.length}",
                  style: const TextStyle(
                    color: MyColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
