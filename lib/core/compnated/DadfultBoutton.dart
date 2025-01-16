import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ican/core/utlies/color.dart';

class DadfultBoutton extends StatelessWidget {
  const DadfultBoutton(
      {super.key,
      this.icon,
      required this.title,
      this.colorBorder,
      this.onTap,
      this.fillColor = Colors.white,
      this.selacted = true,
      this.ColorSelected,
      this.isTextFormFiled = false,
      this.onChanged,
      this.keyboardType,
      this.isEndIcon = true,
      this.key1,
      this.controllerText,
      this.focusNode});
  final Widget? icon;
  final bool isTextFormFiled;
  final Function(String)? onChanged;
  final String title;
  final bool selacted;
  final bool isEndIcon;
  final Function()? onTap;
  final Color fillColor;
  final Color? ColorSelected;
  final Color? colorBorder;
  final TextEditingController? controllerText;
  final FocusNode? focusNode;
  final Key? key1;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: key1,
      onTap: isTextFormFiled ? null : onTap,
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: Stack(
          children: [
            Card(
              color: fillColor,
              elevation: 0.0,
              shape: ContinuousRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  side: BorderSide(
                      color: colorBorder ?? AppColor.Catrgray, width: 1)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: isTextFormFiled
                    ? Center(
                        child: TextFormField(
                          controller: controllerText,
                          onTap: onTap,
                          onChanged: onChanged,
                          focusNode: focusNode,
                          showCursor: false,
                          keyboardType: keyboardType,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorSelected,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: icon,
                              prefixIconConstraints:
                                  const BoxConstraints(maxHeight: 35),
                              border: InputBorder.none,
                              hintText: title,
                              hintStyle: TextStyle(
                                color: ColorSelected,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      )
                    : Row(
                        textDirection: TextDirection.ltr,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          icon ?? const SizedBox.shrink(),
                          //const Spacer(),
                          Flexible(
                            child: Center(
                              child: FittedBox(
                                child: Text(title,
                                    style: TextStyle(
                                      color: ColorSelected,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ),
                          ),
                          // CheckboxListTile(
                          //   value: true,
                          //   onChanged: (value) {},
                          // )
                          // const Spacer(),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
