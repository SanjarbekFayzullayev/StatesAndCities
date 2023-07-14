import 'package:capitals_app/database/database_helper.dart';
import 'package:capitals_app/main_provider.dart';
import 'package:capitals_app/moduls/words.dart';
import 'package:capitals_app/widgets/word_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  @override
  void initState() {
    loadDB();
    super.initState();
  }

  Future<void> loadDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLOad = prefs.getBool("save") ?? false;
    if (!isLOad) {
      await DatabaseHelper.instance.loadDB(context);
    }
    updateQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, data, child) {
        return ListView.builder(
            itemCount: data.words.length,
            itemBuilder: (context, index) {
              return WordItem(data.words[index]);
            });
      },
    );
  }

  void updateQuery({String? word}) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.initList(word: word);
  }
}
