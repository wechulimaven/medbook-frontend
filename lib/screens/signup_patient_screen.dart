import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../constants/dimens.dart';
import '../core/bloc/signup/signup_cubit.dart';
import '../core/data/requests_modelling/user_registration_request_model.dart';
import '../generated/l10n.dart';
import '../layout_configs/public_master_layout/public_master_layout.dart';
import '../shared/widgets/loading_widget.dart';
import '../theme/theme_extensions/app_button_theme.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "add-patient-screen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _nameTextEditingController = TextEditingController();
  final _dobTextEditingController = TextEditingController();
  DateTime? dob;

  void _onLoginSuccess(BuildContext context) {
    // Navigator.pushNamed(context, DashboardScreen.routeName);
  }

  void _onLoginError(BuildContext context, String message) {
    final dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      desc: message,
      width: kDialogWidth,
      btnOkText: 'OK',
      btnOkOnPress: () {},
    );

    dialog.show();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Lang.of(context);
    final themeData = Theme.of(context);

    return PublicMasterLayout(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: const EdgeInsets.only(top: kDefaultPadding * 5.0),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: kDefaultPadding),
                      child: Image.network(
                        "https://www.medbookafrica.com/wp-content/uploads/2022/04/xmedbook.png.pagespeed.ic.dCYlT0PA3j.png",
                        height: 80.0,
                      ),
                    ),
                    Text(
                      'Medbook',
                      // lang.appTitle,
                      style: themeData.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: kDefaultPadding * 2.0),
                      child: Text(
                        "Patients portal",
                        style: themeData.textTheme.titleMedium,
                      ),
                    ),
                    FormBuilder(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding * 1.5),
                            child: FormBuilderTextField(
                              name: 'name',
                              decoration: const InputDecoration(
                                labelText: "Patient full name ",
                                hintText: "Enter patient full name",
                                // helperText: '* Demo username: admin',
                                border: OutlineInputBorder(),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                              ),
                              enableSuggestions: false,
                              validator: FormBuilderValidators.required(),
                              controller: _nameTextEditingController,
                              onSaved: (value) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: kDefaultPadding * 2.0),
                            child: FormBuilderDateTimePicker(
                                name: 'Date of birth',
                                decoration: const InputDecoration(
                                  labelText: "Date of birth",
                                  hintText: "Enter date of birth",
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                                keyboardType: TextInputType.datetime,
                                validator: FormBuilderValidators.required(),
                                controller: _dobTextEditingController,
                                inputType: InputType.date,
                                onChanged: (value) {
                                  dob = value;
                                }),
                          ),
                          BlocConsumer<SignupCubit, SignupState>(
                            listener: (context, state) {
                              if (state is SignUpSuccessState) {
                                _onLoginSuccess(context);
                              }
                              if (state is SignupErrorState) {
                                _onLoginError(context, state.message);
                              }
                            },
                            builder: (context, state) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: kDefaultPadding),
                                child: SizedBox(
                                  height: 40.0,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: themeData
                                        .extension<AppButtonTheme>()!
                                        .primaryElevated,
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        if (state is! SignupLoadingState) {
                                          final f = DateFormat('yyyy-MM-dd');
                                          //     Fimber.d(
                                          //         "Email ${_nameTextEditingController.text}");
                                          context
                                              .read<SignupCubit>()
                                              .registerUser(PatientsModel(
                                                patientName:
                                                    _nameTextEditingController
                                                        .text,
                                                dob: f.format(dob!),
                                              ));
                                        }
                                      }
                                    },
                                    child: state is SignupLoadingState
                                        ? customCircularProgressIndicator(
                                            context)
                                        : const Text("Add"),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
