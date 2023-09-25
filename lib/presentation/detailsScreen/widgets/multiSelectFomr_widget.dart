import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class MultiSelectFormWidget extends StatefulWidget {
  MultiSelectFormWidget({super.key});

  @override
  State<MultiSelectFormWidget> createState() => _MultiSelectFormWidgetState();
}

class _MultiSelectFormWidgetState extends State<MultiSelectFormWidget> {
  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: MultiSelectFormField(
        autovalidate: AutovalidateMode.disabled,
        validator: (value) {
          //validating genre
          if (value == null || value.length == 0) {
            return 'Please select one or more options';
          }
          return null;
        },
        chipBackGroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        checkBoxActiveColor: Colors.white,
        checkBoxCheckColor: Colors.green,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        dialogShapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Text(
          "Genre",
          style: TextStyle(fontSize: 16),
        ),
        //generating list of genres
        dataSource: List.generate(
            Genre.values.length,
            (index) => {
                  "display": Genre.values[index].name,
                  "value": Genre.values[index],
                }),
        textField: 'display',
        valueField: 'value',
        okButtonLabel: 'OK',
        cancelButtonLabel: 'CANCEL',
        hintWidget: Text('Please select one or more options'),
        initialValue: UserModel.instance.genres,
        onSaved: (value) {
          if (value == null) return;
          //saving genre
          setState(() {
            UserModel.instance.genres = value;
          });
        },
      ),
    );
  }
}
