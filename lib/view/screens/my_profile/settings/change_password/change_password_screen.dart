import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themikg/gen/fonts.gen.dart';
import 'package:themikg/view/widgets/custom_button.dart';
import 'package:themikg/view/widgets/custom_global_app_bar.dart';
import 'package:themikg/view/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmNewPasswordTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomGlobalAppBar(
        title: 'Change Boarding Code',
        centerTitle: false,
        titleStyle: TextStyle(
          fontFamily: FontFamily.helvetica,
          fontSize: 18.sp,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              CustomTextField(
                controller: _passwordTEController,
                hintText: 'Current Boarding code',
                isObscureText: true,
                isPassword: true,
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
              ),
              SizedBox(height: 24.h,),
              CustomTextField(
                controller: _newPasswordTEController,
                hintText: 'New Boarding code',
                isObscureText: true,
                isPassword: true,
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
              ),
              SizedBox(height: 24.h,),
        
              CustomTextField(
                controller: _confirmNewPasswordTEController,
                hintText: 'Confirm Boarding code',
                isObscureText: true,
                isPassword: true,
                validator: ( value){
                  if(value !=_newPasswordTEController.text){
                    return "New Boarding code do not match";
                  }
                  return null;
                },
                prefixIcon: Icon(Icons.lock,color: Colors.white,),
              ),
              Spacer(),
              CustomButton(onPressed: (){},label: 'Update',fontWeight: FontWeight.w700,fontSize: 20.sp,)
            ],
          ),
        ),
      ),
    );
  }
}
