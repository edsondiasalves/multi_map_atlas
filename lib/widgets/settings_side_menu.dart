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
      width: 180,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Map Settings'),
            onTap: null,
          ),
          BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        _groupTitle(
                          text: 'Map Provider:',
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        ..._buildMapProviderList(
                          context,
                          state.provider,
                        ),
                        _groupTitle(
                          text: 'Initial Position',
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                        ),
                        ..._buildCityList(
                          context: context,
                          city: state.initialCity,
                          onChangeCity: onChangeInitialPosition,
                        ),
                        _groupTitle(
                          text: 'Move Camera',
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                        ),
                        ..._buildCityList(
                          context: context,
                          city: state.currentCity,
                          onChangeCity: onChangeCameraPosition,
                        ),
                        _groupTitle(
                          text: 'Markers',
                          padding: EdgeInsets.only(bottom: 10, top: 10),
                        ),
                        ..._buildMarkerPlaceList(
                          context: context,
                          placePosition: state.currentMarkersPlace,
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
      mapProviders.add(Container(
        height: 35,
        child: Row(
          children: [
            Radio(
              value: provider,
              groupValue: groupValue,
              onChanged: (MapProvider value) {
                BlocProvider.of<ConfigurationBloc>(context).add(
                  ChangeMapProviderStarted(provider: value),
                );
              },
            ),
            Text(provider.toString().split('.')[1]),
          ],
        ),
      ));
    });
    return mapProviders;
  }

  Container _groupTitle({String text, EdgeInsets padding}) {
    return Container(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
      padding: padding,
    );
  }

  List<Widget> _buildCityList({
    BuildContext context,
    City city,
    Function(BuildContext, City) onChangeCity,
  }) {
    List<Widget> cities = [];
    City.values.forEach((cityValue) => {
          cities.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: cityValue,
                  groupValue: city,
                  onChanged: (City selectedCity) =>
                      onChangeCity(context, selectedCity),
                ),
                Text(cityValue.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return cities;
  }

  final Function(BuildContext, City) onChangeInitialPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeInitialPositionStarted(initialCity: value),
    );
  };

  final Function(BuildContext, City) onChangeCameraPosition = (
    BuildContext context,
    City value,
  ) {
    BlocProvider.of<ConfigurationBloc>(context).add(
      ChangeCameraPositionStarted(currentCity: value),
    );
  };

  List<Widget> _buildMarkerPlaceList({
    BuildContext context,
    MarkerPlace placePosition,
  }) {
    List<Widget> places = [];
    MarkerPlace.values.forEach((place) => {
          places.add(Container(
            height: 35,
            child: Row(
              children: [
                Radio(
                  value: place,
                  groupValue: placePosition,
                  onChanged: (MarkerPlace place) {
                    BlocProvider.of<ConfigurationBloc>(context).add(
                      AddMarkersStarted(placePosition: place),
                    );
                  },
                ),
                Text(place.toString().split('.')[1]),
              ],
            ),
          ))
        });
    return places;
  }
}
