import 'package:flutter/material.dart';
import 'package:flutter_broadcasts/flutter_broadcasts.dart';
import 'package:minamakram/models/availableBuildings/avaliable_budilding_entity.dart';
import 'package:minamakram/models/building_entity.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/utils/date_converter.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../state/avalible_budilings_state.dart';
import '../viewmodel/getBuildingsByDate_viewModel.dart';
import 'iconWidget.dart';

class RequestingOrderTimeSecondWidget extends StatefulWidget {
  Order order;
  RequestingOrderTimeSecondWidget({Key? key,required this.order}) : super(key: key);

  @override
  State<RequestingOrderTimeSecondWidget> createState() => _RequestingOrderTimeSecondWidgetState();
}



class _RequestingOrderTimeSecondWidgetState extends State<RequestingOrderTimeSecondWidget> {
  bool hallShown = false;

  List<String> halls = [];
  List<AvaliableBuilding> availableBuildings = [];
  List<bool> hallsBool = [];
  int? selectedHallIndex;
  String? selectedRoom;
  String? availableRooms;
  late GetBuildingsByDateController getBuildingsByDateController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getBuildingsByDateController = GetBuildingsByDateController();
    getBuildingsByDateController.getAvailableBuildingsByDate(context, widget.order.times?[0], widget.order.times?[1]);
     availableRooms = AppLocalizations.of(context)!.availableHalls;
    widget.order.buildings = [];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AvailableBuildingsProvider>(
      builder: (context, availableBuildingsProvider, child) {
        if (availableBuildingsProvider.buildingsList == null) {
          return const Center(child: CircularProgressIndicator());
        }
        availableBuildings = availableBuildingsProvider.buildingsList!;
        if (availableBuildings.isNotEmpty) {
          halls = generateBuildingFloorRoomNames(availableBuildings);
          if (hallsBool.length != halls.length) {
            hallsBool = List.generate(halls.length, (index) => false);
          }
        }
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: MyColors.simpleBlue, width: 1)),
              width: MediaQuery.of(context).size.width,
              child: RichText(
                text: TextSpan(
                    text: AppLocalizations.of(context)!.activityRes,
                    style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'),
                    children: [
                      TextSpan(
                        text: widget.order.activity,
                        style: const TextStyle(
                            color: MyColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      )
                    ]
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: MyColors.simpleBlue, width: 1)),
              width: MediaQuery.of(context).size.width,
              child: RichText(
                text: TextSpan(
                    text: AppLocalizations.of(context)!.dateRes,
                    style: const TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'),
                    children: [
                      TextSpan(
                        text: widget.order.date,
                        style: const TextStyle(
                            color: MyColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      )
                    ]
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text(
            AppLocalizations.of(context)!.timeRes +  DateConverter().convertIsoRangeTo24Hour(widget.order.times?[0], widget.order.times?[1]),
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal',
                    color: MyColors.primaryColor
                )
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  hallShown = !hallShown;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: MyColors.simpleBlue, width: 1)),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconWidget(path: "assets/images/img_4.png"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          availableRooms ?? AppLocalizations.of(context)!.availableHalls,
                          style: const TextStyle(
                              color: MyColors.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          hallShown = !hallShown;
                        });
                      },
                      child: hallShown? const Icon(Icons.arrow_drop_up):const Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            hallShown? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 6)
                  ]),
              child: Column(
                children: List.generate(
                    halls.length, (index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                  minLeadingWidth: 0,
                  title: myListItemSecond(

                    capacity: availableBuildings
                        .expand((b) => b.floors)
                        .expand((f) => f.rooms)
                        .elementAt(index).capacity.toString(),
                    isChosen: selectedHallIndex == index,
                    text: halls[index],
                    ifFirst: index == 0 ? true : false,
                    ifLast: index == halls.length - 1 ? true : false,
                  ),
                  leading: Radio<int>(
                    activeColor: MyColors.primaryColor,
                    value: index,
                    groupValue: selectedHallIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedHallIndex = value;
                        widget.order.buildings?.clear();
                        widget.order.buildings?.add(halls[index]);
                        selectedHallIndex = value;
                        availableRooms = halls[index];
                        final room = availableBuildings
                            .expand((b) => b.floors)
                            .expand((f) => f.rooms)
                            .elementAt(index);
                        selectedRoom = room.roomId; // roomId is String
                        widget.order.hallId = selectedRoom;
                        widget.order.buildings?.add(selectedRoom!);
                      });
                    },
                  ),
                )),
              ),
            )
                : const SizedBox(),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(MyColors.primaryColor),
                  side: MaterialStateProperty.all(const BorderSide(
                      color: MyColors.secondaryColor, width: 1)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(30, 10, 30, 10))),
              onPressed: () {
                //TODO: API Call

                bool buildingFilled = true;
                if(widget.order.buildings!.isEmpty || widget.order.hallId == null)buildingFilled = false;

                if (buildingFilled) {
                  sendBroadcast(
                      BroadcastMessage(name: "third time page", data: {
                        "date": widget.order.date,
                        "times":widget.order.times?.asMap(),
                        "activity":widget.order.activity,
                        "buildings":widget.order.buildings?.asMap(),
                        "hallId": widget.order.hallId
                      }));
                } else {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Container(
                            alignment: Alignment.center,
                            width: 300,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.orderValidationMessage,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.primaryColor),
                            )),
                      ));
                }
              },
              child: Text(
                AppLocalizations.of(context)!.book,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        );
      },
    );
  }
}
class myListItemSecond extends StatefulWidget {
  String capacity;
  String text;
  bool isChosen;
  myListItemSecond({
    super.key,
    required this.capacity,
    required this.isChosen,
    required this.text,
    required this.ifFirst,
    required this.ifLast,
  });

  bool ifFirst;
  bool ifLast;


  @override
  State<myListItemSecond> createState() => _myListItemSecondState();
}

class _myListItemSecondState extends State<myListItemSecond> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
           bottom: widget.ifLast ? const Radius.circular(10) : Radius.zero,
            top: widget.ifFirst ? const Radius.circular(10) : Radius.zero),
        color: Colors.white,
      ),
      width:MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         /* IconButton(
              onPressed: (){
                showDialog<String>(
                    context: context,
                    builder: (BuildContext
                    context) =>
                        AlertDialog(
                          content: Container(
                            width: 500,
                            height: 200,
                            decoration:
                            BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  10),
                              color:
                              Colors.white,
                            ),
                            child:  Column(
                              children: [
                                  Text("Capacity is  :${widget.capacity}",
                                    style: const TextStyle(
                                      fontFamily: 'Tajwal',
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.primaryColor,
                                      fontSize: 25
                                    ),),
                               const Text("Screen  :4",
                                    style: TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontWeight: FontWeight.w700,
                                        color: MyColors.primaryColor,
                                        fontSize: 25
                                    )),
                               const Text("Air Conditioner  :4",
                                    style: TextStyle(
                                        fontFamily: 'Tajwal',
                                        fontWeight: FontWeight.w700,
                                        color: MyColors.primaryColor,
                                        fontSize: 25
                                    )),
                              ],
                            ),
                          ),
                        ),
                );
              },
              icon: const Icon(Icons.info)
          ),*/
          Text(widget.text),
        ],
      ),
    );
  }
}

List<String> generateBuildingFloorRoomNames(List<AvaliableBuilding> buildings) {
  List<String> result = [];

  for (var building in buildings) {
    for (var floor in building.floors) {
      for (var room in floor.rooms) {
        result.add(
            '${building.buildingName} - ${floor.floorName} -  ${room.roomName}'
        );
      }
    }
  }
  return result;
}