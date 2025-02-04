import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:happybash/utility/colors.dart';
import 'package:happybash/utility/styles.dart';
//Common TextField...............
Widget commonTextFiled(
    {String? title,
      required String hintText,
      bool isPassword = false,
      bool isMandatory = false,
      bool isRequired = true,
      Color? borderColor,
      required TextEditingController textEditingController,
      Function? validationFunction,
      int? maxLength,
      Function? onSavedFunction,
      Function? onFieldSubmit,
      TextInputType? keyboardType,
      Function? onTapFunction,
      Function? onChangedFunction,
      List<TextInputFormatter>? inputFormatter,
      bool isEnabled = true,
      bool isReadOnly = false,
      int? errorMaxLines,
      int? maxLine,
      FocusNode? textFocusNode,
      GlobalKey<FormFieldState>? key,
      TextAlign align = TextAlign.start,
      Widget? suffixIcon,
      Widget? preFixIcon,
      OutlineInputBorder? border,
      OutlineInputBorder? focusBorder,
      bool isShowTitle = true,
      Color? bgColor,
      TextStyle? hintStyle,
      UnderlineInputBorder? underlineInputBorder,
      EdgeInsetsGeometry? contentPadding,
      TextInputAction?   textInputAction,}) {
  RxBool passwordVisible = isPassword.obs;
  BorderRadius commonButtonBorderRadius = BorderRadius.circular(10);
  OutlineInputBorder textFieldBorderOnFocus =  OutlineInputBorder(borderSide: BorderSide(color: color34A853),borderRadius: commonButtonBorderRadius);
  OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(borderSide: const BorderSide(color: color969AA4), borderRadius: commonButtonBorderRadius);
  return Obx(() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      title == null ? Container() : Text(title, ),
      title == null ? Container() :  const SizedBox(height: 10),
      TextFormField(
        enabled: !isEnabled ? false : true,
        textAlign: align,

        showCursor: !isReadOnly,
        readOnly: isReadOnly,
        onTap: () {
          if (onTapFunction != null) {
            onTapFunction();
          }
        },
        key: key,
        focusNode: textFocusNode,
        onChanged: (value) {
          if (onChangedFunction != null) {
            onChangedFunction(value);
          }
        },
        validator: (value) {
          return validationFunction != null ? validationFunction(value) : null;
        },
        // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
        onSaved: (value) {
          return onSavedFunction != null ? onSavedFunction(value) : null;
        },
        onFieldSubmitted: (value) {
          return onFieldSubmit != null ? onFieldSubmit(value) : null;
        },
        maxLines: maxLine ?? 1,
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorColor: color2A9DA0,
        obscuringCharacter: "•",
        obscureText: passwordVisible.value,
        style: color969AA4w40016,
        inputFormatters: inputFormatter,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          errorMaxLines: errorMaxLines ?? 10,
          filled: true,
          fillColor: bgColor ?? colorFFFFFF,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          focusedBorder: focusBorder ?? textFieldBorderOnFocus,
          disabledBorder: border ?? textFieldBorderStyle,
          enabledBorder: border ?? textFieldBorderStyle,
          errorBorder: border ?? textFieldBorderStyle,
          border: InputBorder.none,
          focusedErrorBorder: border ?? textFieldBorderStyle,
          hintText: hintText,
          prefixIcon: preFixIcon,
           errorStyle:const TextStyle(color: Colors.red),
          // prefix: preFixIcon ?? const SizedBox(),
          hintStyle: hintStyle ?? color969AA4w40016.copyWith(color: color969AA4.withOpacity(0.5)),
          suffixIcon: isPassword
              ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                passwordVisible.value = !passwordVisible.value;
              },
              child: passwordVisible.value ? Image.asset("assets/icon/visibility_off.png", scale: 3) : Image.asset("assets/icon/visibility_off.png", scale: 3))
              : suffixIcon,
        ),
      ),
    ],
  ));
}

//Common TextField with icon...............
Widget commonTextFiledWithIcon(
    {String? title,
      required String hintText,
      bool isPassword = false,
      bool isMandatory = false,
      bool isRequired = true,
      Color? borderColor,
      required TextEditingController textEditingController,
      Function? validationFunction,
      int? maxLength,
      Function? onSavedFunction,
      Function? onFieldSubmit,
      TextInputType? keyboardType,
      Function? onTapFunction,
      Function? onChangedFunction,
      List<TextInputFormatter>? inputFormatter,
      bool isEnabled = true,
      bool isReadOnly = false,
      int? errorMaxLines,
      int? maxLine,
      FocusNode? textFocusNode,
      GlobalKey<FormFieldState>? key,
      TextAlign align = TextAlign.start,
      Widget? suffixIcon,
      Widget? preFixIcon,
      OutlineInputBorder? border,
      OutlineInputBorder? focusBorder,
      bool isShowTitle = true,
      Color? bgColor,
      TextStyle? hintStyle,
      UnderlineInputBorder? underlineInputBorder,
      EdgeInsetsGeometry? contentPadding,
      TextInputAction?   textInputAction,}) {
  RxBool passwordVisible = isPassword.obs;
  BorderRadius commonButtonBorderRadius = BorderRadius.circular(4);
  OutlineInputBorder textFieldBorderOnFocus =  OutlineInputBorder(borderSide: BorderSide(color: color34A853),borderRadius: commonButtonBorderRadius);
  OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(borderSide: const BorderSide(color: colorDDDDDD), borderRadius: commonButtonBorderRadius);
  return Obx(() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      title == null ? Container() : Text(title, ),
      title == null ? Container() :  const SizedBox(height: 10),
      TextFormField(
        enabled: !isEnabled ? false : true,
        textAlign: align,

        showCursor: !isReadOnly,
        readOnly: isReadOnly,
        onTap: () {
          if (onTapFunction != null) {
            onTapFunction();
          }
        },
        key: key,
        focusNode: textFocusNode,
        onChanged: (value) {
          if (onChangedFunction != null) {
            onChangedFunction(value);
          }
        },
        validator: (value) {
          return validationFunction != null ? validationFunction(value) : null;
        },
        // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
        onSaved: (value) {
          return onSavedFunction != null ? onSavedFunction(value) : null;
        },
        onFieldSubmitted: (value) {
          return onFieldSubmit != null ? onFieldSubmit(value) : null;
        },
        maxLines: maxLine ?? 1,
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorColor: color2A9DA0,
        obscuringCharacter: "•",
        obscureText: passwordVisible.value,
        style: color969AA4w40016,
        inputFormatters: inputFormatter,
        textInputAction: textInputAction ?? TextInputAction.next,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(minWidth: 32, minHeight: 32),
          errorMaxLines: errorMaxLines ?? 1,
          filled: true,
          fillColor: bgColor ?? colorFFFFFF,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          focusedBorder: focusBorder ?? textFieldBorderOnFocus,
          disabledBorder: border ?? textFieldBorderStyle,
          enabledBorder: border ?? textFieldBorderStyle,
          errorBorder: border ?? textFieldBorderStyle,
          border: InputBorder.none,
          focusedErrorBorder: border ?? textFieldBorderStyle,
          hintText: hintText,
          prefixIcon: preFixIcon,
          errorStyle:const TextStyle(color: Colors.red),
          // prefix: preFixIcon ?? const SizedBox(),
          hintStyle: hintStyle ?? color555555w40014,
          suffixIcon: isPassword
              ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                passwordVisible.value = !passwordVisible.value;
              },
              child: passwordVisible.value ? Image.asset("assets/icon/visibility_off.png", scale: 3) : Image.asset("assets/icon/visibility_off.png", scale: 3))
              : suffixIcon,
        ),
      ),
    ],
  ));
}


//Common Plain TextField...............
Widget commonPlainTextFiled(
    {String? title,
      required String hintText,
      bool isPassword = false,
      bool isMandatory = false,
      bool isRequired = true,
      Color? borderColor,
      required TextEditingController textEditingController,
      Function? validationFunction,
      int? maxLength,
      Function? onSavedFunction,
      Function? onFieldSubmit,
      TextInputType? keyboardType,
      Function? onTapFunction,
      Function? onChangedFunction,
      List<TextInputFormatter>? inputFormatter,
      bool isEnabled = true,
      bool isReadOnly = false,
      int? errorMaxLines,
      int? maxLine,
      FocusNode? textFocusNode,
      GlobalKey<FormFieldState>? key,
      TextAlign align = TextAlign.start,
      Widget? suffixIcon,
      Widget? preFixIcon,
      OutlineInputBorder? border,
      OutlineInputBorder? focusBorder,
      bool isShowTitle = true,
      Color? bgColor,
      TextStyle? hintStyle,
      UnderlineInputBorder? underlineInputBorder,
      EdgeInsetsGeometry? contentPadding,
      TextInputAction textInputAction = TextInputAction.next}) {
  RxBool passwordVisible = isPassword.obs;

  //OutlineInputBorder textFieldBorderOnFocus =  OutlineInputBorder(borderSide: BorderSide(color: color34A853));

  return Obx(() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      title == null ? Container() : Text(title, ),
      title == null ? Container() :  const SizedBox(height: 10),
      TextFormField(
        enabled: !isEnabled ? false : true,
        textAlign: align,

        showCursor: !isReadOnly,
        readOnly: isReadOnly,
        onTap: () {
          if (onTapFunction != null) {
            onTapFunction();
          }
        },
        key: key,
        focusNode: textFocusNode,
        onChanged: (value) {
          if (onChangedFunction != null) {
            onChangedFunction(value);
          }
        },
        validator: (value) {
          return validationFunction != null ? validationFunction(value) : null;
        },
        // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
        onSaved: (value) {
          return onSavedFunction != null ? onSavedFunction(value) : null;
        },
        onFieldSubmitted: (value) {
          return onFieldSubmit != null ? onFieldSubmit(value) : null;
        },
        maxLines: maxLine ?? 1,
        keyboardType: keyboardType,
        controller: textEditingController,
        cursorColor: color2A9DA0,
        obscuringCharacter: "•",
        obscureText: passwordVisible.value,
        style: color969AA4w40016,
        inputFormatters: inputFormatter,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          errorMaxLines: errorMaxLines ?? 1,
          filled: true,
          fillColor: bgColor ?? colorFFFFFF,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric( vertical: 16),
          focusedBorder:focusBorder ?? const UnderlineInputBorder(borderSide: BorderSide(color: color34A853)),
          disabledBorder: border ?? const UnderlineInputBorder(borderSide: BorderSide(color: colorEDEDED)),
          enabledBorder: border ?? const UnderlineInputBorder(borderSide: BorderSide(color: colorEDEDED)),
          errorBorder: border ?? const UnderlineInputBorder(borderSide: BorderSide(color: colorEDEDED)),
          focusedErrorBorder: border ?? const UnderlineInputBorder(borderSide: BorderSide(color: colorEDEDED)),
          hintText: hintText,
          prefixIcon: preFixIcon,
          errorStyle:const TextStyle(color: Colors.red),
          hintStyle: hintStyle ?? color595959w40014.copyWith(color: color969AA4.withOpacity(0.5)),
          suffixIcon: isPassword
              ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                passwordVisible.value = !passwordVisible.value;
              },
              child: passwordVisible.value ? Image.asset("assets/icon/visibility_off.png", scale: 3) : Image.asset("assets/icon/visibility_off.png", scale: 3))
              : suffixIcon,
        ),
      ),
    ],
  ));
}
//Common Button.............
class CommonButton extends StatefulWidget {
  final String title;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? spinColor;
  final TextStyle? style;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool? isEnable;
  final LinearGradient?gradient;

  const CommonButton({Key? key, required this.isLoading, required this.title, this.icon, this.spinColor, this.isEnable, this.onPressed, this.width, this.height, this.padding, this.margin, this.decoration, this.style, this.color, this.gradient}) : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.isEnable == false
              ? () {}
              : widget.isLoading
              ? () {}
              : widget.onPressed,
          child: Container(
            width: widget.width ?? double.infinity,
            height: widget.height ?? 40.h,
            decoration: widget.decoration ?? BoxDecoration(borderRadius: BorderRadius.circular(36),color: widget.color ?? color2A9DA0, ),
            child: Container(
              width: widget.width ?? double.infinity,
              height: widget.height ?? 40.h,
              decoration: BoxDecoration(color: widget.isEnable == false ? Colors.white.withOpacity(0.5) : null),
              margin: widget.margin ?? EdgeInsets.zero,
              padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
              child: widget.isLoading
                  ?    const SizedBox(height: 20, child: SpinKitThreeBounce(color: colorFFFFFF, size: 30.0))
                  : Center(child: Text(widget.title, style: widget.style ?? colorFFFFFFw60014)),
            ),
          ),
        ));
  }
}