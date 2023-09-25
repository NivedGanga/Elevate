import 'package:elevate/application/user_details/user_details_bloc.dart';
import 'package:elevate/domain/user_details/genre.dart';
import 'package:elevate/domain/user_details/model/user_model.dart';
import 'package:elevate/presentation/detailsScreen/widgets/multiSelectFomr_widget.dart';
import 'package:elevate/presentation/detailsScreen/widgets/submitButton_widget.dart';
import 'package:elevate/presentation/detailsScreen/widgets/textField.dart';
import 'package:elevate/presentation/shared/constants.dart';
import 'package:elevate/presentation/shared/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        state.postFailureorSuccess.fold(() => null, (either) {
          either.fold((failure) {
            displaySnackbar(context: context, message: failure.toString());
          }, (_) {
            //if user details entered successfully then navigate to home screen
            Navigator.of(context).pushReplacementNamed('/home');
          });
        });
      },
      child: Scaffold(
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
                  function: () {
                    //checking whether fields are empty or not
                    if (_nameController.text.isEmpty ||
                        _ageController.text.isEmpty) {
                      displaySnackbar(
                          context: context, message: "Fields cannot be empty");
                      return;
                    }
                    final gn = UserModel.instance.genres.toString();
                    final tags = gn
                        .replaceFirst('[', "")
                        .replaceFirst("]", "")
                        .replaceAll("Genre.", '');
                    //adding user details to backend
                    context.read<UserDetailsBloc>().add(UserDetailsEvent(
                        name: _nameController.text,
                        age: int.parse(_ageController.text),
                        email: UserModel.instance.email!,
                        genres: tags,
                        uid: UserModel.instance.email!));
                  },
                  name: 'Submit',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
