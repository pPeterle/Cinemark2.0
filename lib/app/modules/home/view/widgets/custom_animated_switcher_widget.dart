import 'package:cinemark_2/app/shared/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomAnimatedSwitcher extends StatefulWidget {
  final PageController pageController;
  const CustomAnimatedSwitcher({Key? key, required this.pageController})
      : super(key: key);

  @override
  State<CustomAnimatedSwitcher> createState() => _CustomAnimatedSwitcherState();
}

class _CustomAnimatedSwitcherState extends State<CustomAnimatedSwitcher> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 100),
        () => {
              widget.pageController.animateTo(1,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn)
            });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (widget.pageController.page == 0) {
          widget.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          widget.pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
      },
      onHorizontalDragUpdate: (val) {
        widget.pageController.jumpTo(
          (widget.pageController.page! *
                  widget.pageController.position.maxScrollExtent) +
              val.primaryDelta! * 2,
        );
      },
      onHorizontalDragEnd: (val) {},
      child: Builder(builder: (context) {
        return Container(
          height: 40,
          decoration: BoxDecoration(
            color: CustomColors.background,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: CustomColors.gray),
          ),
          child: AnimatedBuilder(
            animation: widget.pageController,
            builder: (context, snapshot) {
              if (_width == 0 || widget.pageController.positions.isEmpty) {
                return Container();
              }

              final page = widget.pageController.page ?? 0;
              return Stack(
                children: <Widget>[
                  Transform.translate(
                    child: _buildButton(context),
                    offset: Offset(
                        widget.pageController.page! * (_width / 2 - 24), 0),
                  ),
                  SizedBox(
                    height: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Em Cartaz",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.lerp(
                                  CustomColors.white, CustomColors.gray, page),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Em Breve",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.lerp(
                                  CustomColors.gray, CustomColors.white, page),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }

  Widget _buildButton(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: CustomColors.red,
        borderRadius: BorderRadius.circular(25),
      ),
      width: _width * 0.5,
    );
  }
}
