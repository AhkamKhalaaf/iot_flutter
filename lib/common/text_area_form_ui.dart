import 'package:flutter/material.dart';
import 'package:iotappexam/controllers/app_config.dart';
class textAreaFormUi extends StatelessWidget {
  const textAreaFormUi(
      {Key? key,
        this.rightIcon,
        this.leftIcon,
        required this.textEditingController,
        required this.hintText,
        required this.ownFocusNode,
        required this.nextFocusNode,
        required this.textInputType,
        required this.errorText,
        required this.security,
        this.maxLines,
        this.minLines,
        this.paddingValue
      })
      : super(key: key);
  final Widget? rightIcon;
  final Widget? leftIcon;
  final TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final FocusNode ownFocusNode;
  final FocusNode nextFocusNode;
  final TextInputType textInputType;
  final bool security;
  final int? maxLines;
  final int? minLines;
  final  double? paddingValue ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return errorText;
        }
        return null;
      },
      keyboardType: textInputType,
      onFieldSubmitted: (_) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      maxLines: maxLines,
      minLines: minLines,
      autocorrect: true,controller: textEditingController,
      obscureText: security,
      focusNode: ownFocusNode,      decoration: InputDecoration(
        prefixIcon: rightIcon,
        suffixIcon: leftIcon,
        contentPadding: const EdgeInsets.only(left:0.0,right: 0.0,bottom: 10.0,top: 20.0),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide:
            BorderSide(color: appConfig.colorText.withOpacity(0.5))),
        hintText: hintText),
      style: TextStyle(
          color: appConfig.colorText,
          fontSize: 12.0,
          fontWeight: FontWeight.w500),
    );
  }
}
