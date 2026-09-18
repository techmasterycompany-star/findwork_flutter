import 'package:findwork_flutter/features/candidates/business_logic/cubit/language_cubit.dart';
import 'package:findwork_flutter/features/candidates/business_logic/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("asset/images/logo.png", height: 48, width: 72),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
          padding: EdgeInsets.zero,
          icon: Icon(Icons.dark_mode_outlined, size: 24),
        ),
        IconButton(
          onPressed: () {
            context.read<LanguageCubit>().toggleLanguage();
          },
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            'asset/icons/translate.svg',
            width: 48,
            height: 48,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface,
              BlendMode.srcIn,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          icon: SvgPicture.asset(
            'asset/icons/alert.svg',
            width: 48,
            height: 48,
          ),
        ),
        EndDrawerButton(),
      ],
    );
  }
}
