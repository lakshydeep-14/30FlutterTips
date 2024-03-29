import 'package:flutter/material.dart';
import 'package:flutter_30_tips/home.dart';

class SearchSuggestion extends StatefulWidget {
  const SearchSuggestion({Key? key}) : super(key: key);

  @override
  State<SearchSuggestion> createState() => _SearchSuggestionState();
}

class _SearchSuggestionState extends State<SearchSuggestion> {
  String? selected;
  final List<String> _suggestion = [
    "Follow GO WITH FLUTTER",
    "Like",
    "Share",
    "Subscribe",
    'Lakshydeep',
    'Vikram',
    'Rishi',
    'Medium',
    "30FlutterTips"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Tips 6"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Autocomplete(
            
            fieldViewBuilder:
                ((context, textEditingController, focusNode, onFieldSubmitted) {
              return TextFormField(
                controller: textEditingController,
                focusNode: focusNode,
                style: const TextStyle(color: Colors.black),
                onFieldSubmitted: (value) => onFieldSubmitted,
                decoration: InputDecoration(
                    hintText: "Search and see suggestion",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor))),
              );
            }),
            optionsBuilder: (TextEditingValue textEditingValue) async {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }

              final List<String> result = [];
              for (var e in _suggestion) {
                if (e
                    .toString()
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase())) {
                  result.add(e.toString());
                }
              }

              return result;
            },
            onSelected: (selection) {
              //debugPrint('You just selected $selection');
            },
          ),
        ),
      ),
    );
  }
}
