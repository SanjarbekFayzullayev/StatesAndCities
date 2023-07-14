import 'package:capitals_app/moduls/words.dart';
import 'package:capitals_app/screens/deatlis_page.dart';
import 'package:flutter/material.dart';

class WordItem extends StatefulWidget {
  final Words word;

  const WordItem(this.word, {Key? key}) : super(key: key);

  @override
  State<WordItem> createState() => _WordItemState();
}

class _WordItemState extends State<WordItem> {
  @override
  Widget build(BuildContext context) {
    // var parts = widget.word.name.toString().split(' ');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(widget.word),
              ));
        },
        child: Card(
          color: const Color(0xFF424242),
            elevation: 12,
            shadowColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.word.name ?? "...",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20,fontStyle: FontStyle.italic,color: Colors.white)),
                  ),
                  const Icon(Icons.chevron_right_outlined,size: 40,color: Colors.white,)
                ],
              ),
            )),
      ),
    );
  }
}
