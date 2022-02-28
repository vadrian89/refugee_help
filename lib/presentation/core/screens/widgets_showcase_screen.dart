import 'package:flutter/material.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_elevated_buton.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_icon_button.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_outlined_buton.dart';
import 'package:refugee_help/presentation/core/widgets/buttons/base_text_buton.dart';
import 'package:refugee_help/presentation/core/widgets/text/body1_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/body2_text%20.dart';
import 'package:refugee_help/presentation/core/widgets/text/head1_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/head2_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/head3_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/head4_text%20.dart';
import 'package:refugee_help/presentation/core/widgets/text/head5_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/head6_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub1_text.dart';
import 'package:refugee_help/presentation/core/widgets/text/sub2_text.dart';

class WidgetsShowcaseScreen extends StatelessWidget {
  const WidgetsShowcaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Widgets showcase"),
        ),
        body: ListView(
          children: [
            const Head1Text(text: "Heading 1 text"),
            const Head2Text(text: "Heading 2 text"),
            const Head3Text(text: "Heading 3 text"),
            const Head4Text(text: "Heading 4 text"),
            const Head5Text(text: "Heading 5 text"),
            const Head6Text(text: "Heading 6 text"),
            const Sub1Text(text: "Subtitle 1 text"),
            const Sub2Text(text: "Subtitle 2 text"),
            const Body1Text(text: "Body 1 text"),
            const Body2Text(text: "Body 2 text"),
            BaseElevatedButton(
              child: const Text("Elevated button"),
              onPressed: () {},
            ),
            BaseElevatedButton.icon(
              icon: const Icon(Icons.android_outlined),
              label: const Text("Elevated button with icon"),
              onPressed: () {},
            ),
            BaseOutlinedButton(
              child: const Text("Outlined button"),
              onPressed: () {},
            ),
            BaseOutlinedButton.icon(
              icon: const Icon(Icons.android_outlined),
              label: const Text("Outlined button with icon"),
              onPressed: () {},
            ),
            BaseTextButton(
              child: const Text("Text button"),
              onPressed: () {},
            ),
            BaseTextButton.icon(
              icon: const Icon(Icons.android_outlined),
              label: const Text("Text button with icon"),
              onPressed: () {},
            ),
            BaseIconButton(
              icon: const Icon(Icons.touch_app),
              onPressed: () {},
            ),
            Switch.adaptive(
              value: true,
              onChanged: (_) {},
            ),
            ListTile(title: const Text("List tile"), onTap: () {}),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
            BottomNavigationBarItem(icon: Icon(Icons.flag), label: "Flag"),
          ],
        ),
      );
}
