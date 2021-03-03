import 'dart:async';

import 'package:atlas/atlas.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';
import 'package:multi_map_atlas/utils/constants.dart';
import 'package:multi_map_atlas/utils/extensions.dart';
import 'package:multi_map_atlas/utils/markers_configuration.dart';

part 'configuration_event.dart';
part 'configuration_state.dart';

class ConfigurationBloc extends Bloc<ConfigurationEvent, ConfigurationState> {
  MapProvider currentMapProvider;
  ConfigurationBloc({MapProvider mapProvider})
      : super(ConfigurationInitial(mapProvider: mapProvider));

  @override
  Stream<ConfigurationState> mapEventToState(
    ConfigurationEvent event,
  ) async* {
    if (event is ChangeMapProviderStarted) {
      yield MapProviderChangedState(
        provider: event.provider,
      );
    } else if (event is ChangeInitialPositionStarted) {
      yield InitialPositionState(
        provider: state.provider,
        initialCity: event.initialCity,
        initialCameraPosition: event.initialCity.toCameraPosition(),
      );
    } else if (event is ChangeCameraPositionStarted) {
      yield CameraChangedState(
        provider: state.provider,
        initialCity: state.initialCity,
        currentCity: event.currentCity,
        currentCameraPosition: event.currentCity.toCameraPosition(),
      );
    } else if (event is AddMarkersStarted) {
      final result = ResultEngine().getResult(event.placePosition);

      yield MarkerLoadedState(
        provider: state.provider,
        initialCameraPosition: result.cameraPosition,
        currentMarkersPlace: event.placePosition,
        markers: result.markers,
      );
    }
  }
}
