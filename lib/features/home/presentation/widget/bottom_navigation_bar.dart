import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final VoidCallback onSearchTapped;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.onSearchTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 75,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  size: 28,
                  color: selectedIndex == 0
                      ? const Color(0xFF3B82F6)
                      : Colors.grey[600],
                ),
                onPressed: () => onItemTapped(0),
              ),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 26,
                      color: selectedIndex == 1
                          ? const Color(0xFF3B82F6)
                          : Colors.grey[600],
                    ),
                    onPressed: () => onItemTapped(1),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 48.w),

              IconButton(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  size: 26,
                  color: selectedIndex == 2
                      ? const Color(0xFF3B82F6)
                      : Colors.grey[600],
                ),
                onPressed: () => onItemTapped(2),
              ),

              GestureDetector(
                onTap: () => onItemTapped(3),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedIndex == 3
                          ? const Color(0xFF3B82F6)
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 14,
                    // here is the user image
                    child: Icon(Icons.person, size: 18),
                  ),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: -22,
          child: GestureDetector(
            onTap: onSearchTapped,
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6),
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF3B82F6).withOpacity(0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: const Icon(Icons.search, color: Colors.white, size: 32),
            ),
          ),
        ),
      ],
    );
  }
}
