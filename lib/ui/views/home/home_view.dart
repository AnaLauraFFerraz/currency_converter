import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: viewModel.isBusy
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
            buildTextField("Reais", "R\$", viewModel.realController,
                viewModel.realChanged),
            Divider(),
            buildTextField("Dólares", "US\$", viewModel.dolarController,
                viewModel.dolarChanged),
            Divider(),
            buildTextField("Euros", "€", viewModel.euroController,
                viewModel.euroChanged),
          ],
        ),
      ),
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


  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
