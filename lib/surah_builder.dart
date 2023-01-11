import 'package:flutter/material.dart';
import 'package:quran_app/constant.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

bool floatingActionBtnIsClicked = true;

class SurahBuilder extends StatefulWidget {
  final surah;
  final arabic;
  final surahName;
  int? ayah;

  SurahBuilder(
      {super.key, this.surah, this.arabic, this.surahName, required this.ayah});
  @override
  State<SurahBuilder> createState() => _SurahBuilderState();
}

class _SurahBuilderState extends State<SurahBuilder> {
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumToAyahMethod());
    super.initState();
  }

  jumToAyahMethod() {
    if (floatingActionBtnIsClicked) {
      itemScrollController.scrollTo(
        index: widget.ayah!,
        duration: const Duration(
          seconds: 2,
        ),
        curve: Curves.easeInOutCubic,
      );
    }
    floatingActionBtnIsClicked = false;
  }

  saveBookMarkMethod(surah, ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("surah", surah);
    await prefs.setInt("ayah", ayah);
  }

  Row verseBuilder(int index, pre) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Text(
                widget.arabic[index + pre]["aya_text"],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: const Color.fromARGB(
                    196,
                    0,
                    0,
                    0,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ReturnBasmalaa extends StatelessWidget {
  const ReturnBasmalaa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
