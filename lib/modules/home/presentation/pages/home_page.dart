import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_practical/di/dependency_injection.dart';
import 'package:mi_practical/modules/home/presentation/bloc/home_bloc.dart';
import 'package:mi_practical/modules/home/presentation/views/mobile_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<HomeBloc>(),
        ),
      ],
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: HomeMobileView(),
      ),
    );
  }
}
