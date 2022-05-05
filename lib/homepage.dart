import 'package:currency_2/bloc/app_bloc.dart';
import 'package:currency_2/widgets/custom_dropdown_buttom.dart';
import 'package:currency_2/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _dropdownValue = 'first';

  @override
  Widget build(BuildContext context) {
    context.read<AppBloc>().add(AppInitializeEvent());
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        // TODO: implement listener
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
                  const CustomTextfield(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomDropdownButtom(
                        selectedValue: _dropdownValue,
                        items: state is AppInitialized ? state.items : [],
                      ),
                      CustomDropdownButtom(
                        selectedValue: _dropdownValue,
                        items: state is AppInitialized ? state.items : [],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
