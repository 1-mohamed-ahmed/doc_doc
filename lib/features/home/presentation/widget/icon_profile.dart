import 'package:doc_doc/core/theming/app_images.dart';
import 'package:flutter/material.dart';

class IconProfile extends StatefulWidget {
  const IconProfile({super.key});

  @override
  State<IconProfile> createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: const CircleAvatar(
                    radius: 55,
                    backgroundColor: Color(0xFFE2D8F7), // خلفية الصورة الفاتحة
                    backgroundImage: AssetImage(AppImages.doctorAvatar), // ضع مسار صورتك
                  ),
                ),
      
  
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: () {
                      // عمل تفعيل لاختيار صورة جديدة
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        size: 16,
                        color: Color(0xFF247CFF),
                      ),
                    ),
                  ),
                ),
              ],
            );
 
  }
}