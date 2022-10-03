import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_sats/components/custom_button.dart';
import 'package:send_sats/services/webln_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final weblnService = Provider.of<WeblnService>(context, listen: false);
    return AppBar(
      title: const Text(
        'Send Me Some Sats',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [
        Row(
          children: [
            CustomButton(
              buttonText: 'Enable',
              callback: () => weblnService.enable(),
            ),
            const SizedBox(
              width: 15,
            ),
            CustomButton(
              buttonText: 'Get Info',
              callback: () => weblnService.getInfo(),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        )
      ],
    );
  }
}
