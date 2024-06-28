import 'package:flutter/material.dart';
import 'package:taskwave/config/texts/strings.dart';
import 'package:taskwave/config/ui/assets.dart';

class HeaderNav extends StatelessWidget {
  final user;

  const HeaderNav({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 33,
          backgroundImage: user != null && user.imgProfile != null
              ? NetworkImage('${user.imgProfile}')
              : const AssetImage(AppAssets.noFound) as ImageProvider,
          child: user != null && user.imgProfile == null
              ? const Image(image: AssetImage(AppAssets.noFound))
              : null,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${user?.username ?? ''}${AppStrings.profileIcon}',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              AppStrings.subTitle,
              style: TextStyle(fontSize: 10.5, color: Colors.grey[600]),
            ),
          ],
        ),
        const SizedBox(
          width: 50,
        ),
        GestureDetector(
          onTap: () {
            print('Menu Clicked');
          },
          child: const Image(
            image: AssetImage(AppAssets.menuBar),
            height: 40,
            width: 40,
            // color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
