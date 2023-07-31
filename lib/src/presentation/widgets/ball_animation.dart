import 'package:bola_app/src/presentation/bloc/shake_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BallAnimation extends StatefulWidget {
  const BallAnimation({
    super.key,
  });

  @override
  State<BallAnimation> createState() => _BallAnimationState();
}

class _BallAnimationState extends State<BallAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() async {
    _controller.reset();
    await _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: GestureDetector(
        onTap: () {
          _startAnimation();
          context.read<ShakeCubit>().imageClicked();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final animationValue = CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            ).value;

            final rotationValue = (1 - animationValue) * 6.28319 * 4; //

            return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateZ(rotationValue),
                child: Image.asset('assets/bola.png'));
          },
        ),
      ),
    );
  }
}
