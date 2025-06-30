import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LoadingButton extends StatefulWidget {
  final Function() onPressed;
  final Widget child;
  final bool autoDisable;
  final ButtonStyle style;
  final Color? indicatorColor;

  const LoadingButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.autoDisable = true,
    this.style = const ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(MyColors.primaryColor),
      padding: MaterialStatePropertyAll(
        EdgeInsets.fromLTRB(30, 0, 30, 0),
      ),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      )),
    ),
    this.indicatorColor,
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool _isLoading = false;

  void _handlePress() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    try {
      await widget.onPressed();
    } finally {
      if (widget.autoDisable) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: widget.style,
        child: _isLoading
            ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: widget.indicatorColor),
              )
            : widget.child);
  }
}
