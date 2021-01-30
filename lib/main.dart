import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_maps_atlas/google_atlas.dart';
import 'package:here_maps_atlas/here_atlas.dart';
import 'package:mapbox_atlas/mapbox_atlas.dart';
import 'package:multi_map_atlas/bloc/configuration_bloc.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';
import 'package:multi_map_atlas/utils/constants.dart';
import 'package:multi_map_atlas/widgets/settings_side_menu.dart';

var currentMapProvider = MapProvider.Here;

void main() {
  runApp(
    Phoenix(
      child: BlocProvider(
        create: (BuildContext context) => ConfigurationBloc(
          mapProvider: currentMapProvider,
        ),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();

    final state = BlocProvider.of<ConfigurationBloc>(context).state;

    switch (state.provider) {
      case MapProvider.Google:
        AtlasProvider.instance = GoogleAtlas();
        break;
      case MapProvider.MapBox:
        AtlasProvider.instance = MapBoxAtlas();
        break;
      default:
        AtlasProvider.instance = HereAtlas();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Multi Map Provider'),
        ),
        drawer: SettingsSideMenu(),
        body: BlocListener<ConfigurationBloc, ConfigurationState>(
          listenWhen: (previous, current) =>
              current is MapProviderChanged &&
              previous.provider != current.provider,
          listener: (context, state) {
            currentMapProvider = state.provider;
            Phoenix.rebirth(context);
          },
          child: BlocBuilder<ConfigurationBloc, ConfigurationState>(
            builder: (context, state) {
              return Atlas(
                key: UniqueKey(),
                initialCameraPosition: CameraPosition(
                  target: getCityCoordinates(state.city),
                  zoom: 13,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  LatLng getCityCoordinates(City city) {
    switch (city) {
      case City.Lisbon:
        return LisbonCoordinates;
        break;
      case City.SaoPaulo:
        return SaoPauloCoordinates;
        break;
      case City.Tokyo:
        return TokyoCoordinates;
        break;
      default:
        return LisbonCoordinates;
        break;
    }
  }
}
