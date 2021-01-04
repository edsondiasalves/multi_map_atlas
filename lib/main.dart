import 'package:atlas/atlas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_maps_atlas/google_atlas.dart';
import 'package:here_maps_atlas/here_atlas.dart';
import 'package:mapbox_atlas/mapbox_atlas.dart';
import 'package:multi_map_atlas/bloc/multi_map_bloc.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';
import 'package:multi_map_atlas/widgets/settings_side_menu.dart';

MapProvider currentMapProvider = MapProvider.Here;

void main() {
  runApp(
    Phoenix(
      child: BlocProvider(
        create: (BuildContext context) => MultiMapBloc()
          ..add(ChangeMapProviderEvent(provider: currentMapProvider)),
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

    switch (currentMapProvider) {
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
        body: BlocListener<MultiMapBloc, MultiMapState>(
          listener: (context, state) {
            if (state is MapProviderChanged &&
                state.provider != currentMapProvider) {
              currentMapProvider = state.provider;
              Phoenix.rebirth(context);
            }
          },
          child: Atlas(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                latitude: 38.74412794727255,
                longitude: -9.148597681706798,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
