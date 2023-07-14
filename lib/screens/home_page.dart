import 'package:capitals_app/main_provider.dart';
import 'package:capitals_app/widgets/word_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  bool _isDark = false;
  String searchQuery = "Search query";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: const Color(0xFFFAFAFA),
        leading: _isSearching ? const BackButton() :  const Icon(Icons.dehaze,color:  Color(0xFF424242)),
        title: _isSearching
            ? _buildSearchField()
            : const Text("States and cities",
                style: TextStyle(
                    color:  Color(0xFF424242), fontWeight: FontWeight.bold,fontSize: 22)),
        actions:_buildActions(),
      ),
      body: const WordList(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      cursorColor: Colors.black,
      controller: _searchQueryController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search Data...",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black54),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 24.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear, color: Colors.black),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search, color:  Color(0xFF424242)),
        onPressed: _startSearch,
      ),
      // IconButton(
      //   onPressed: () {
      //     final mainProvider =
      //     Provider.of<MainProvider>(context, listen: false);
      //     mainProvider.change();
      //     _isCity = !_isCity;
      //   },
      //   icon: const Icon(Icons.switch_access_shortcut_rounded),
      // ),

    ];
  }

  void _startSearch() {
    ModalRoute.of(context)?.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    searchQuery = newQuery;
    updateQuery(word: searchQuery);
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }

  void updateQuery({String? word}) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    mainProvider.initList(word: word);
  }
}
