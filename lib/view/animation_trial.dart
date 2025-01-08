import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class ScaleTransitionDemo extends StatefulWidget {
  @override
  _ScaleTransitionDemoState createState() => _ScaleTransitionDemoState();
}

class _ScaleTransitionDemoState extends State<ScaleTransitionDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleAnimation() {
    setState(() {
      if (isExpanded) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ScaleTransition Example'),
      ),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: toggleAnimation,
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/sample_image.jpg'), // Your image path
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}