import 'package:bola_app/src/config/themes/app_theme.dart';
import 'package:bola_app/src/presentation/bloc/shake_cubit.dart';
import 'package:bola_app/src/presentation/views/home_page.dart';
import 'package:bola_app/src/presentation/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ShakeCubit())],
      child: MaterialApp(
        title: 'Material App',
        routes: {
          '/home': (_) => const HomePage(),
          '/welcome': (_) => const WelcomePage(),
        },
        initialRoute: '/home',
        theme: AppTheme.light,
      ),
    );
  }
}
