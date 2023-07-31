import 'package:bola_app/src/presentation/bloc/shake_cubit.dart';
import 'package:bola_app/src/presentation/widgets/ball_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ShakeCubit, String>(
        builder: (context, message) {
          return Stack(
            children: [
              // Background Image
              Image.asset(
                'assets/luna.gif',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              BallAnimation(),
              message != ''
                  ? Center(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const Center(
                      child: _QuestionForm(),
                    )
            ],
          );
        },
      ),
    );
  }
}

class _QuestionForm extends StatelessWidget {
  const _QuestionForm();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Ingrese su pregunta aqui',
            contentPadding: EdgeInsets.all(10.0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
