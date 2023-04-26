import 'package:flutter/material.dart';

class CircleAvatarImg extends StatelessWidget {
  const CircleAvatarImg({
    super.key,
    required this.img,
    required this.status,
  });

  final String img;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        CircleAvatar(
          backgroundColor: getStatusColor(status: status),
          radius: 114,
          child: CircleAvatar(
            backgroundImage: NetworkImage(img),
            radius: 110,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: getStatusColor(status: status),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                )
              ],
            ),
            child: Center(
                child: Text(
              status.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium,
            )),
          ),
        ),
      ],
    );
  }
}

Color getStatusColor({required String status}) {
  Color colorStatus;
  switch (status) {
    case 'Alive':
      colorStatus = const Color(0xFF55CB44);
      break;
    case 'Dead':
      colorStatus = Colors.red;
      break;
    case 'unknown':
      colorStatus = const Color(0xFFFF9800);
      break;
    default:
      colorStatus = Colors.black;
  }
  return colorStatus;
}
