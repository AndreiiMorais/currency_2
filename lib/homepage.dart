import 'package:currency_2/bloc/app_bloc.dart';
import 'package:currency_2/helpers/loading/loading_screen.dart';
import 'package:currency_2/widgets/dialogs/show_converted_value_dialog.dart';
import 'package:currency_2/widgets/dropdown/custom_dropdown_buttom.dart';
import 'package:currency_2/widgets/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  String _fromDropdownValue = 'USD';
  String _toDropdonValue = 'BRL';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(AppInitializeEvent());
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) async {
        if (state.isLoading == true) {
          context.showLoader(context);
        } else {
          context.hideLoader(context);
        }
        if (state is AppConvertedState) {
          await showGenericDialog(
            context: context,
            title: 'Conversion From ${state.from} to ${state.to}',
            content:
                'the amount of ${state.amount} ${state.from} was converted in ${state.result?.toStringAsFixed(2)} ${state.to}',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.webp'),
                fit: BoxFit.fitHeight,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
              child: Column(
                children: [
                  CustomTextfield(
                    controller: _controller,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomDropdownButtom(
                        key: const ValueKey('fromDropdownButton'),
                        selectedValue: _fromDropdownValue,
                        onChange: (value) {
                          if (value is String) {
                            setState(() {
                              _fromDropdownValue = value;
                            });
                          }
                        },
                        items: state is AppInitialized ? state.items : [],
                      ),
                      CustomDropdownButtom(
                        key: const ValueKey('toDropdownButton'),
                        selectedValue: _toDropdonValue,
                        onChange: (value) {
                          if (value is String) {
                            setState(() {
                              _toDropdonValue = value;
                            });
                          }
                        },
                        items: state is AppInitialized ? state.items : [],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                          Size(
                            MediaQuery.of(context).size.width,
                            50,
                          ),
                        ),
                      ),
                      child: const Icon(Icons.refresh),
                      onPressed: () => context.read<AppBloc>().add(
                            AppConvertEvent(
                                amountToConvert: _controller.text,
                                convertedFrom: _fromDropdownValue,
                                toBeConverted: _toDropdonValue),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
