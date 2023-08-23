import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:currency_converter/app/views/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text("\$ Conversor \$"),
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
          body: model.isBusy
              ? Center(
            child: Text(
              "Carregando Dados...",
              style: TextStyle(color: Colors.amber, fontSize: 25.0),
              textAlign: TextAlign.center,
            ),
          )
              : SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.monetization_on,
                    size: 150.0, color: Colors.amber),
                buildTextField("Reais", "R\$", model.realController,
                    model.realChanged),
                Divider(),
                buildTextField("Dólares", "US\$", model.dolarController,
                    model.dolarChanged),
                Divider(),
                buildTextField("Euros", "€", model.euroController,
                    model.euroChanged),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTextField(String label, String prefix, TextEditingController c,
      Function(String) onChanged) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder(),
          prefixText: prefix),
      style: TextStyle(color: Colors.amber, fontSize: 25.0),
      onChanged: onChanged,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
