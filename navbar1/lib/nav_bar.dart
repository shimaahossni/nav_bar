import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'nav_bar_items_model.dart';

class NavBar extends StatefulWidget {
  final List<NavBarItemsModel> items;
  final Color navBarBgColor;
  final Color selectedColor;
  final Color unselectedColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final double selectedIconSize;
  final double unselectedIconSize;
  final double selectedlabelFontSize;
  final double unselectedlabelFontSize;
  final int initialIndex;
  final double navbarheight;

  const NavBar({
    super.key,
    required this.items,
    this.navBarBgColor = Colors.indigo,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.grey,
    this.selectedLabelColor = Colors.white,
    this.unselectedLabelColor = Colors.grey,
    this.selectedIconSize = 25.0,
    this.unselectedIconSize = 18.0,
    this.selectedlabelFontSize = 20.0,
    this.unselectedlabelFontSize = 10.0,
    this.initialIndex = 0,
    this.navbarheight = 50.0,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  // Calculate indicator position based on selected index
  double _calculateIndicatorPosition(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 8; // Subtract padding
    final itemWidth = screenWidth / widget.items.length;
    final indicatorWidth = 60.w;
    final centerOffset = (itemWidth - indicatorWidth) / 2;
    return (_currentIndex * itemWidth) + centerOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.navBarBgColor,
              boxShadow: [
                BoxShadow(
                  color: widget.selectedColor.withValues(alpha: 0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: widget.navbarheight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(widget.items.length, (index) {
                final item = widget.items[index];
                final isSelected = _currentIndex == index;

                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                      item.onPressed();
                    },
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              item.icon,
                              size: isSelected
                                  ? widget.selectedIconSize
                                  : widget.unselectedIconSize,
                              color: isSelected
                                  ? widget.selectedColor
                                  : widget.unselectedColor,
                            ),
                            if (item.label != null) ...[
                              Text(
                                item.label!,
                                style: TextStyle(
                                  fontSize: isSelected
                                      ? widget.selectedlabelFontSize
                                      : widget.unselectedlabelFontSize,
                                  color: isSelected
                                      ? widget.selectedLabelColor
                                      : widget.unselectedLabelColor,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 4.h),
          // Animated indicator using Stack and AnimatedPositioned
          Stack(
            children: [
              Container(
                height: 6.h,
                width: double.infinity,
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: _calculateIndicatorPosition(context),
                child: Container(
                  height: 6.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: widget.selectedColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
