// ignore_for_file: avoid_print, must_be_immutable, unnecessary_question_mark, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_en_1/utils/styles.dart';

typedef FieldValidator = String? Function(String? data);

class SvgViewer extends StatelessWidget {
  final String svgPath;
  final double? height;
  final double? width;
  final Color? color;

  const SvgViewer(
      {Key? key, required this.svgPath, this.height, this.width, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      color: color,
      height: height ?? 18,
      width: width ?? 18,
    );
  }
}

class MyTextField extends StatelessWidget {
  final Color? fillColor;
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final Color? labelColor;
  final String? prefixIcon;
  final String? suffixIcon;
  final Color? focusBorderColor;
  final Color? unfocusBorderColor;
  final double? contentPadding;
  final bool? enable;
  final String? text;
  final String? sufixLabel;

  final onChanged;
  final double? leftPadding;
  final double? rightPadding;
  final TextEditingController? controller;
  final Function? focusListner;
  late FocusNode focusNode;
  final FieldValidator? validator;
  final TextInputType? keyboardType;
  final inputFormatters;
  final Color textColor;
  final bool? obsecureText;
  final Widget? suffixIconWidet;
  int minLines = 1;
  int maxLines = 1;
  TextDirection? textDirection;

  MyTextField(
      {Key? key,
      this.textDirection,
      this.textColor = AppColor.blackColor,
      this.obsecureText,
      this.fillColor,
      this.labelText,
      this.maxLines = 1,
      this.minLines = 1,
      this.hintText,
      this.hintColor = AppColor.blackColor,
      this.labelColor = AppColor.blackColor,
      this.prefixIcon,
      this.inputFormatters,
      this.suffixIcon,
      this.focusBorderColor,
      this.unfocusBorderColor,
      this.onChanged,
      this.contentPadding,
      this.enable = true,
      this.text,
      this.sufixLabel,
      this.leftPadding,
      this.rightPadding,
      this.controller,
      this.focusListner,
      this.validator,
      this.suffixIconWidet,
      this.keyboardType})
      : super(key: key) {
    focusNode = FocusNode();
    if (focusListner != null) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          focusListner!();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding ?? 100.w,
        right: rightPadding ?? 100.w,
      ),
      child: TextFormField(
        obscureText: obsecureText ?? false,
        style:
            Theme.of(context).textTheme.subtitle1?.copyWith(color: textColor),
        controller: controller ?? TextEditingController(),
        initialValue: text,
        minLines: minLines,
        maxLines: maxLines,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType ?? TextInputType.text,
        enabled: enable,
        //onFieldSubmitted: onChanged,
        focusNode: focusNode,
        validator: validator,
        onChanged: onChanged,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(contentPadding ?? 25.h),
          fillColor: fillColor,
          labelText: hintText ?? "",
          hintText: hintText,
          filled: fillColor != null,
          hintStyle:
              Theme.of(context).textTheme.subtitle1?.copyWith(color: hintColor),
          labelStyle: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: labelColor),
          prefixIcon: (prefixIcon != null)
              ? Padding(
                  padding: EdgeInsets.all(contentPadding ?? 100.w),
                  child: SvgViewer(
                    svgPath: prefixIcon!,
                    width: 20.w,
                    height: 20.h,
                  ),
                )
              : null,
          suffixIcon: sufixLabel != null
              ? Padding(
                  padding: EdgeInsets.all(25.h),
                  child: Text(
                    sufixLabel ?? '',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                )
              : (suffixIcon != null)
                  ? Padding(
                      padding: EdgeInsets.all(25.h),
                      child: SvgViewer(
                        svgPath: suffixIcon!,
                        width: 20.w,
                        height: 20.h,
                      ),
                    )
                  : (suffixIconWidet != null)
                      ? suffixIconWidet
                      : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide:
                BorderSide(color: focusBorderColor ?? AppColor.alphaGrey),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide:
                BorderSide(color: focusBorderColor ?? AppColor.alphaGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide:
                BorderSide(color: unfocusBorderColor ?? AppColor.alphaGrey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: const BorderSide(color: AppColor.redColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.r),
            borderSide: BorderSide(
                color: focusBorderColor ?? AppColor.primaryBlueColor),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String buttonText;
  final onTap;
  final double? padding;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final Widget? prefixIcon;
  final Widget? postFixIcon;
  final double? height;
  final double? cornerRadius;
  final TextStyle? textStyle;
  final double? leftPadding;
  final double? rightPading;

  const Button(
      {Key? key,
      required this.buttonText,
      this.onTap,
      this.prefixIcon,
      this.postFixIcon,
      this.padding,
      this.color,
      this.textColor,
      this.cornerRadius,
      this.borderColor,
      this.textStyle,
      this.width,
      this.height,
      this.leftPadding,
      this.rightPading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
            left: leftPadding == null ? 100.w : leftPadding!,
            right: rightPading == null ? 100.w : rightPading!),
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(padding ?? 80.w),
          decoration: BoxDecoration(
              border: borderColor == null
                  ? null
                  : Border.all(
                      color: borderColor!,
                    ),
              borderRadius:
                  BorderRadius.all(Radius.circular(cornerRadius ?? 50.r)),
              color: color ?? AppColor.primaryBlueColor),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefixIcon ?? const IgnorePointer(),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        Theme.of(context)
                            .textTheme
                            .subtitle1
                            ?.copyWith(color: textColor),
                  ),
                ),
              ),
              postFixIcon ?? const IgnorePointer(),
            ],
          )),
        ),
      ),
    );
  }
}

class MyDropDown extends StatefulWidget {
  Color? fillColor;
  Function(dynamic? value)? onChange;
  dynamic value;
  Color? borderColor;
  final Color? labelColor;
  final Color? textColor;
  final String? prefixIcon;
  final String? suffixIcon;
  List<dynamic>? items = [];
  final String? labelText;
  final String? hintText;
  final Color? hintColor;
  final double? leftPadding;
  final double? rightPadding;
  final FormFieldValidator<dynamic>? validator;
  final List<DropdownMenuItem<Object>>? itemFuntion;
  bool isDense;
  bool isItalicHint;

  MyDropDown(
      {Key? key,
      this.fillColor,
      required this.onChange,
      this.textColor = AppColor.blackColor,
      this.value,
      this.items,
      this.borderColor,
      this.labelColor = AppColor.blackColor,
      this.prefixIcon,
      this.suffixIcon,
      this.labelText,
      this.hintText,
      this.hintColor = AppColor.blackColor,
      this.leftPadding,
      this.rightPadding,
      this.validator,
      this.itemFuntion,
      this.isDense = true,
      this.isItalicHint = false})
      : super(key: key);

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget.leftPadding ?? 0.w,
        right: widget.rightPadding ?? 0.w,
      ),
      child: DropdownButtonFormField(
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: true,
        validator: widget.validator,
        onTap: () {
          print("on tap");
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
            labelText: widget.labelText,
            hintText: widget.hintText,
            labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontStyle:
                    widget.isItalicHint ? FontStyle.italic : FontStyle.normal,
                color: AppColor.blackColor),
            hintStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontStyle:
                    widget.isItalicHint ? FontStyle.italic : FontStyle.normal,
                color: AppColor.blackColor),
            prefixIcon: (widget.prefixIcon != null)
                ? Padding(
                    padding: EdgeInsets.all(100.w),
                    child: SvgViewer(svgPath: widget.prefixIcon!),
                  )
                : null,
            contentPadding: EdgeInsets.all(20.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide:
                  BorderSide(color: widget.borderColor ?? AppColor.alphaGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide:
                  BorderSide(color: widget.borderColor ?? AppColor.alphaGrey),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: const BorderSide(color: AppColor.orangeColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.r),
              borderSide:
                  BorderSide(color: widget.borderColor ?? AppColor.alphaGrey),
            ),
            filled: true,
            fillColor: widget.fillColor ?? Colors.transparent),
        onChanged: widget.onChange,
        value: widget.value,
        isDense: widget.isDense,
        hint: Text(
          "",
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: widget.hintColor,
              fontStyle:
                  widget.isItalicHint ? FontStyle.italic : FontStyle.normal),
        ),
        items: widget.items != null
            ? widget.items?.map((dynamic value) {
                return DropdownMenuItem<dynamic>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        color: widget.textColor,
                      ),
                    ));
              }).toList()
            : widget.itemFuntion,
      ),
    );
  }
}

class ExpandableCardContainer extends StatefulWidget {
  bool isExpanded;
  Widget collapsedChild;
  Widget expandedChild;

  ExpandableCardContainer(
      {Key? key,
      required this.isExpanded,
      required this.collapsedChild,
      required this.expandedChild})
      : super(key: key);

  @override
  _ExpandableCardContainerState createState() =>
      _ExpandableCardContainerState();
}

class _ExpandableCardContainerState extends State<ExpandableCardContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 4000),
        curve: Curves.easeInOut,
        child: widget.isExpanded ? widget.expandedChild : widget.collapsedChild,
      ),
    );
  }
}

class NetworkCircularImage extends StatefulWidget {
  String url;
  double radius;
  double? width;
  double? height;
  BoxFit? fit;

  NetworkCircularImage(
      {Key? key,
      required this.url,
      this.radius = 34,
      this.width,
      this.height,
      this.fit})
      : super(key: key);

  @override
  _NetworkCircularImageState createState() => _NetworkCircularImageState();
}

class _NetworkCircularImageState extends State<NetworkCircularImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: widget.radius,
      ),
      placeholder: (context, url) => CircleAvatar(
        child: const CircularProgressIndicator(
          color: AppColor.primaryBlueColor,
        ),
        radius: widget.radius,
      ),
      errorWidget: (context, url, error) {
        return CircleAvatar(
          backgroundImage:
              const AssetImage('assets/images/place_your_image.png'),
          radius: widget.radius,
        );
      },
    );
  }
}

class NetworkPlainImage extends StatefulWidget {
  String url;

  double? width;
  double? height;
  BoxFit? fit;

  NetworkPlainImage(
      {Key? key, required this.url, this.width, this.height, this.fit})
      : super(key: key);

  @override
  _NetworkPlainImageState createState() => _NetworkPlainImageState();
}

class _NetworkPlainImageState extends State<NetworkPlainImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      key: UniqueKey(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(Icons.error)),
    );
  }
}
