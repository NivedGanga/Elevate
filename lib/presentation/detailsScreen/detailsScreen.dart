import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/presentation/detailsScreen/widgets/multiSelectFomr_widget.dart';
import 'package:elevate/presentation/detailsScreen/widgets/submitButton_widget.dart';
import 'package:elevate/presentation/detailsScreen/widgets/textField.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image(
                  height: 900.h,
                  image: AssetImage('assets/detailsPage_image-removebg.png')),
              height,
              TextWidget(
                controller: _nameController,
                name: 'Name',
                keyboardType: TextInputType.name,
              ),
              height,
              TextWidget(
                controller: _ageController,
                name: 'Age',
                keyboardType: TextInputType.number,
              ),
              height,
              MultiSelectFormWidget(),
              height,
              SubmitButton(
                function: () {},
                name: 'Submit',
              )
            ],
          ),
        ),
      ),
    );
  }
}
