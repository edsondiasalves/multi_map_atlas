import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_map_atlas/bloc/configuration_bloc.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';
import 'package:multi_map_atlas/utils/constants.dart';

class SettingsSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 200,
      child: ListView(
        children: <Widget>[
          Container(
            child: Text('Map Settings'),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 20),
          ),
          BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text('Map Provider:'),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 15),
                        ),
                        ..._buildMapProviderList(context, state.provider),
                        Container(
                          child: Text('Initial Position:'),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 15),
                        ),
                        ..._buildCityList(
                          context: context,
                          initialPosition: state.initialPosition,
                          onChangeCity: onChangeInitialPosition,
                        ),
                        Container(
                          child: Text('Move Camera'),
                        ),
                        ..._buildCityList(
                          context: context,
                          initialPosition: state.currentPosition,
                          onChangeCity: onChangeCameraPosition,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  List<Widget> _buildMapProviderList(
    BuildContext context,
    MapProvider groupValue,
  ) {
    final mapProviders = List<Widget>();
    MapProvider.values.forEach((provider) {
      final radioTile = RadioListTile<MapProvider>(
        title: Text(provider.toString().split('.')[1]),
        dense: true,
        value: provider,
        groupValue: groupValue,
        onChanged: (MapProvider value) {
          BlocProvider.of<ConfigurationBloc>(context).add(
            ChangeMapProviderStarted(provider: value),
          );
        },
      );
      mapProviders.add(radioTile);
    });
    return mapProviders;
  }

  List<Widget> _buildCityList({
    BuildContext context,
    City initialPosition,
    Function(BuildContext, City) onChangeCity,
  }) {
    List<Widget> cities = [];
    City.values.forEach((city) => {
          cities.add(RadioListTile<City>(
            title: Text(city.toString().split('.')[1]),
            dense: true,
            value: city,
            groupValue: initialPosition,
            onChanged: (City city) => onChangeCity(context, city),
          ))
        });
    return cities;
  }

  final Function(BuildContext, City) onChangeInitialPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeInitialPositionStarted(city: value),
    );
  };

  final Function(BuildContext, City) onChangeCameraPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeCameraPositionStarted(city: value),
    );
  };
}
