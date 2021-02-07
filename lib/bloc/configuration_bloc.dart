import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';
import 'package:multi_map_atlas/utils/constants.dart';

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
        initialPosition: event.city,
      );
    } else if (event is ChangeCameraPositionStarted) {
      yield CameraChangedState(
        provider: state.provider,
        initialPosition: state.initialPosition,
        currentPosition: event.city,
      );
    }
  }
}
