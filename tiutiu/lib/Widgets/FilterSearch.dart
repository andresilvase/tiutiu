import 'package:flutter/material.dart';

class FilterSearch extends StatefulWidget {
  FilterSearch({
    this.filterNames,
    this.filterValues,
    this.isFiltering,
    this.showFilter,
  });

  final List<String> filterNames;
  final List<List<String>> filterValues;
  final Function() isFiltering;
  final Function() showFilter;


  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  List<String> filterNames = ['Distância', 'Tamanho'];
  List<List<String>> filterValues = [
    ['Até 1Km', 'Até 10Km', 'Até 100Km', 'Até 500Km'],
    ['Pequeno-porte', 'Médio-porte', 'Grande-porte']
  ];
  List<String> initialValues = [];
  List filters;
  Function() isFiltering;
  Function() showFilter;

  @override
  void initState() {
    super.initState();

    initializesDropdownValues();
    isFiltering = widget.isFiltering;
    showFilter = widget.showFilter;
  }

  @override
  Widget build(BuildContext context) {
    return isFiltering()
        ? Card(
            elevation: 8,
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: mountFilter().toList()),
            ),
          )
        : SizedBox();
  }

  List<Widget> mountFilter() {
    var filters = [];
    filterNames.asMap.call().forEach((index, name) {
      filters.add(
        Row(
          children: <Widget>[
            Text(name, style: Theme.of(context).textTheme.headline2),
            SizedBox(width: 10),            
            DropdownButton<String>(
                value: initialValues[index],
                onChanged: (String newValue) {
                  setState(() {
                    initialValues[index] = newValue;
                  });
                },
                style: TextStyle(color: Colors.black, fontSize: 16),
                selectedItemBuilder: (BuildContext context) {
                  return filterValues[index].map((String value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(value,
                          style: Theme.of(context).textTheme.headline2),
                    );
                  }).toList();
                },
                items: filterValues[index]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList()),
          ],
        ),
      );
    });
    filters.add(ButtonBar(
      alignment: MainAxisAlignment.end,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            showFilter();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            'OK',
            style: Theme.of(context).textTheme.button,
          ),
          color: Theme.of(context).accentColor,
        )
      ],
    ));
    return filters;
  }

  void initializesDropdownValues() {
    widget.filterNames != null
        ? filterNames = [...widget.filterNames]
        : filterNames = filterNames;

    widget.filterValues != null
        ? filterValues = [...widget.filterValues]
        : filterValues = filterValues;

    filterValues.asMap.call().forEach((index, element) {
      initialValues.add(element[0]);
    });
  }
}
