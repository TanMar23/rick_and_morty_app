import 'package:flutter/material.dart';
import 'package:rick_and_morty_provider/utils/utils.dart';

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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.5,
            maxHeight: MediaQuery.of(context).size.width * 0.5,
          ),
          child: CircleAvatar(
            backgroundColor: UiUtils.getStatusColor(status: status),
            radius: 80,
            child: CircleAvatar(
              backgroundImage: NetworkImage(img),
              radius: 77,
            ),
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
              color: UiUtils.getStatusColor(status: status),
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
