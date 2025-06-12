import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/app/utils/app_color.dart';
import 'package:themikg/app/utils/app_constant.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscure;
  final Color? filColor;
  final Color? borderColor;
  final Color? hintextColor;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final double? contentPaddingHorizontal;
  final double? contentPaddingVertical;
  final int? maxLine;
  final double? hintextSize;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final bool isPassword;
  final bool? isEmail;
  final bool? readOnly;
  final double? borderRadio;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;


  const CustomTextField(
      {super.key,
        this.contentPaddingHorizontal,
        this.contentPaddingVertical,
        this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.maxLine,
        this.validator,
        this.hintextColor,
        this.borderColor,
        this.isEmail,
        required this.controller,
        this.keyboardType = TextInputType.text,
        this.isObscureText = false,
        this.obscure = '*',
        this.filColor,
        this.hintextSize,
        this.labelText,
        this.isPassword = false,
        this.readOnly = false, this.borderRadio, this.onTap, this.onChanged});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      onTap:widget. onTap,
      readOnly: widget.readOnly!,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscuringCharacter: widget.obscure!,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLines: widget.maxLine ?? 1,
      // validator: widget.validator,
      validator: widget.validator ?? (value) {
        final val = value?.trim() ?? ''; // Safe null handling
        final hint = widget.hintText?.toLowerCase() ?? ''; // Safe fallback

        if (widget.isEmail == true) {
          if (val.isEmpty) {
            return "Please enter $hint";
          } else if (!AppConstants.emailValidate.hasMatch(val)) {
            return "Please enter a valid email";
          }
        }
        else if (widget.isPassword) {
          if (val.isEmpty) {
            return "Please enter $hint";
          } else if (AppConstants.validatePassword(val)) {
            return "Insecure password detected";
          }
        }
        else {
          if (val.isEmpty) {
            return "Please enter $hint";
          }
        }
        return null;
      },

      cursorColor: Colors.black,
      obscureText: widget.isPassword ? obscureText : false,
      style: TextStyle(color: widget.hintextColor ?? Color(0xFF999999), fontSize: widget.hintextSize ?? 14.h),
      decoration: InputDecoration(
        constraints: BoxConstraints(minHeight: 50.h,maxHeight: 51.h),
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.contentPaddingHorizontal ?? 20.w,
              vertical: widget.contentPaddingVertical ?? 10.h),
          fillColor: AppColors.secondaryColor,
          filled: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 16,right: 16),
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.isPassword
              ? GestureDetector(
            onTap: toggle,
            child: _suffixIcon(
                obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined),
          )
              : widget.suffixIcon,
          prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.hintextColor ?? Color(0xFF999999), fontSize: widget.hintextSize ?? 14.h,fontWeight: FontWeight.w400),
          focusedBorder: focusedBorder(),
          enabledBorder: enabledBorder(),
          errorBorder: errorBorder(),
          border: focusedBorder(),
          errorStyle: TextStyle(fontSize: 12.h, fontWeight: FontWeight.w400)
      ),
    );
  }

  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon,color:Colors.white));
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular( widget.borderRadio?.r ?? 16.r),
      borderSide:BorderSide(
          color: widget.borderColor ??AppColors.borderColor.withOpacity(.5)
      ),
    );
  }

  OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 16.r),
      borderSide:BorderSide(
          color: widget.borderColor ?? AppColors.borderColor.withOpacity(.5)
      ),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadio?.r ?? 16.r),
      borderSide: const BorderSide(
          color: Colors.red,width: 0.5
      ),
    );
  }
}