import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  bool hasShow = false;

  @override
    void initState() {
      super.initState();
      _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
      _offsetAnimation = Tween(begin: Offset(2, 0), end: Offset(0, 0)).animate(CurveTween(curve: Curves.easeInOut).animate(_animationController));
  }

  @override
  void dispose() {
    _animationController.dispose();
    // Add code before the super
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Text('当前是->$index'),
              );
          },
          itemCount: 50,
          ),
          Positioned(
            right: 10,
              bottom: 100,
              child:  SlideTransition(
                position: _offsetAnimation,
                child: RawMaterialButton(
                  shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                  onPressed: () {

                  },
                  child: Image(image: AssetImage("images/回到顶部.png"),),
                ),
              )
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (hasShow) {
            hasShow = false;
            _animationController.reverse();
          } else {
            hasShow = true;
            _animationController.forward();
          }
        },
        child: Text("点击"),
      ),
    );
  }
}
