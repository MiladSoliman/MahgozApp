import 'package:flutter/material.dart';
import 'package:minamakram/models/order/orderObject.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:minamakram/utils/date_converter.dart';
import 'package:minamakram/utils/local_storge.dart';
import 'package:minamakram/viewmodel/addReservation_viewModel.dart';
import '../components/bottom_sheet.dart';
import '../components/loading_button.dart';
import '../constants/colors.dart';
import '../constants/strings.dart';

class RequestingOrderTimeThirdWidget extends StatefulWidget {
  Order order;
  RequestingOrderTimeThirdWidget({Key? key, required this.order})
      : super(key: key);

  @override
  State<RequestingOrderTimeThirdWidget> createState() =>
      _RequestingOrderTimeThirdWidgetState();
}

class _RequestingOrderTimeThirdWidgetState
    extends State<RequestingOrderTimeThirdWidget> {
  final AddReservationViewModel _addReservationViewModel =
      AddReservationViewModelImpl();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            AppLocalizations.of(context)!.orderDetails,
            style: const TextStyle(
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: MyColors.primaryColor),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: MyColors.simpleBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "  اسم الخادم :- ${SPUtils().getUserName()}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      color: MyColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "  الخدمة :- ${SPUtils().getUserRole()}" ?? "",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Tajawal',
                      color: MyColors.primaryColor),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)!.activityRes,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: MyColors.primaryColor),
                        children: [
                          TextSpan(
                              text: widget.order.activity,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.primaryColor))
                        ]),
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.dateRes,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Tajawal',
                          color: MyColors.primaryColor),
                      children: [
                        TextSpan(
                            text: widget.order.date,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal',
                                color: MyColors.primaryColor))
                      ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                        text: "القاعة :- ",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: MyColors.primaryColor),
                        children: [
                          TextSpan(
                              text: widget.order.buildings?[0],
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.primaryColor))
                        ]),
                  )),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RichText(
                    text: TextSpan(
                        text: "من ",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Tajawal',
                            color: MyColors.primaryColor),
                        children: [
                          TextSpan(
                              text: DateConverter().convertIsoRangeTo24Hour(
                                  widget.order.times?[0],widget.order.times?[1]),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Tajawal',
                                  color: MyColors.primaryColor))
                        ]),
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LoadingButton(
                indicatorColor: MyColors.primaryColor,
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: MyColors.primaryColor, width: 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                onPressed: () {
                  _addReservation();
                },
                child: Text(
                  AppLocalizations.of(context)!.confirm,
                  style: const TextStyle(
                      color: MyColors.primaryColor,
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                )),
            ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: MyColors.secondaryColor, width: 1)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.fromLTRB(30, 10, 30, 10))),
                onPressed: () {
                  Navigator.pushNamed(context, home, arguments: true);
                },
                child: Text(
                  AppLocalizations.of(context)!.del,
                  style: const TextStyle(
                      color: MyColors.secondaryColor,
                      fontFamily: "Tajawal",
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ))
          ],
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }

  Future<void> _addReservation() async {
    try {
      await _addReservationViewModel.addReservation(
        widget.order.buildings?[1] ?? "",
        widget.order.times?[0] ?? "",
        widget.order.times?[1] ?? "",
        SPUtils().getUserName() ?? "",
      );
      if (mounted) {
        _showConfirmationDialog(context);
      }
    } catch (e) {
      if (mounted) {
        MahgozBottomSheet.instance.showBottomSheet(
            context: context,
            title: AppLocalizations.of(context)!.errorTitle,
            message: AppLocalizations.of(context)!.errorMessage,
            actionName: AppLocalizations.of(context)!.tryAgain,
            action: () {});
      }
    }
  }

  Future<void> _showConfirmationDialog(BuildContext context) async {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              content: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${AppLocalizations.of(context)!.messageSent1} ${AppLocalizations.of(context)!.messageSent2}",
                      style: const TextStyle(
                          color: Color.fromRGBO(6, 68, 105, 1),
                          fontFamily: 'Tajawal',
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, home,
                            arguments: true);
                      },
                      child: SizedBox(
                        width: 86,
                        height: 86,
                        child: Image.asset(
                          "assets/images/delete_profile_confirmation.png",
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        barrierDismissible: false);
  }
}
