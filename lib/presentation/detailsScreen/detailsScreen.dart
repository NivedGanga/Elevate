import 'package:elevate/presentation/detailsScreen/widgets/submitButton_widget.dart';
import 'package:elevate/presentation/detailsScreen/widgets/textField.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _genreController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            TextWidget(
              controller: _genreController,
              name: 'Horror, Comedy....',
              keyboardType: TextInputType.text,
            ),
            height,
            SubmitButton(
              function: () {},
              name: 'Submit',
            )
          ],
        ),
      ),
    );
  }
}
