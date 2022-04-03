import 'package:flutter/material.dart';

class Content {
  Content(this.movieName);

  String movieName;
  bool isSelected = false;
}

class SingleSelectionPage extends StatefulWidget {
  List<String> sortFilter;
  Color? color;

  SingleSelectionPage(this.sortFilter, this.color);

  @override
  _SingleSelectionPageState createState() => _SingleSelectionPageState();
}

class _SingleSelectionPageState extends State<SingleSelectionPage> {
  String selectedValue = "";

  @override
  void initState() {
    super.initState();

    selectedValue = widget.sortFilter.first;
  }

  var selected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            setState(() {
              selectedValue = widget.sortFilter[index];
              toggle(index);
              selected[index] = true;
            });
          },
          child: Container(
            color:
                selectedValue == widget.sortFilter[index] ? Colors.white : null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: (widget.color),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: (selected[index] == true)
                            ? Colors.orangeAccent
                            : Colors.black26)),
                child: Row(
                  children: <Widget>[
                    Radio(
                        fillColor: MaterialStateColor.resolveWith((states) =>
                            (selected[index] == true)
                                ? Colors.orangeAccent
                                : Colors.black26),
                        value: widget.sortFilter[index],
                        groupValue: selectedValue,
                        onChanged: (s) {
                          print(s);
                          setState(() {});
                        }),
                    Text(widget.sortFilter[index])
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: widget.sortFilter.length,
    );
  }

  void toggle(pos) {
    for (var i = 0; i < selected.length; i++) {
      if (i != pos) selected[i] = false;
    }
  }
}

class MultiSelectionExample extends StatefulWidget {
  List<Content> favoriteMovies;

  MultiSelectionExample(this.favoriteMovies);

  @override
  _MultiSelectionExampleState createState() => _MultiSelectionExampleState();
}

class _MultiSelectionExampleState extends State<MultiSelectionExample> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      primary: false,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            widget.favoriteMovies[index].isSelected =
                !widget.favoriteMovies[index].isSelected;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black26)),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      side: BorderSide(color: Colors.black26),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      checkColor: Colors.white,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.orangeAccent),
                      value: widget.favoriteMovies[index].isSelected,
                      onChanged: (s) {
                        widget.favoriteMovies[index].isSelected =
                            !widget.favoriteMovies[index].isSelected;
                        setState(() {});
                      }),
                  Text(widget.favoriteMovies[index].movieName)
                ],
              ),
            ),
          ),
        );
      },
      itemCount: widget.favoriteMovies.length,
    );
  }
}
