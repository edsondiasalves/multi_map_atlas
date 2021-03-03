part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState extends Equatable {
  final MapProvider provider;
  final City initialCity;
  final CameraPosition initialCameraPosition;
  final City currentCity;
  final CameraPosition currentCameraPosition;
  final MarkerPlace currentMarkersPlace;
  final Set<Marker> markers;

  ConfigurationState({
    this.provider,
    this.initialCity,
    this.initialCameraPosition,
    this.currentCity,
    this.currentCameraPosition,
    this.currentMarkersPlace,
    this.markers,
  });

  @override
  List<Object> get props => [
        provider,
        initialCity,
        initialCameraPosition,
        currentCity,
        currentCameraPosition,
        currentMarkersPlace,
        markers,
      ];
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial({MapProvider mapProvider})
      : super(
          provider: mapProvider,
          initialCity: City.Lisbon,
          initialCameraPosition: City.Lisbon.toCameraPosition(),
          currentCity: City.Lisbon,
        );
}

class MapProviderChangedState extends ConfigurationState {
  MapProviderChangedState({MapProvider provider})
      : super(
          provider: provider,
          initialCity: City.Lisbon,
          initialCameraPosition: City.Lisbon.toCameraPosition(),
          currentCity: City.Lisbon,
        );
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({
    MapProvider provider,
    City initialCity,
    CameraPosition initialCameraPosition,
  }) : super(
          provider: provider,
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: initialCity,
          currentCameraPosition: initialCameraPosition,
        );
}

class CameraChangedState extends ConfigurationState {
  CameraChangedState({
    MapProvider provider,
    City initialCity,
    CameraPosition initialCameraPosition,
    City currentCity,
    CameraPosition currentCameraPosition,
  }) : super(
          provider: provider,
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: currentCity,
          currentCameraPosition: currentCameraPosition,
        );
}

class MarkerLoadedState extends ConfigurationState {
  MarkerLoadedState({
    MapProvider provider,
    City initialCity,
    CameraPosition initialCameraPosition,
    City currentCity,
    CameraPosition currentCameraPosition,
    MarkerPlace currentMarkersPlace,
    Set<Marker> markers,
  }) : super(
          provider: provider,
          initialCity: initialCity,
          initialCameraPosition: initialCameraPosition,
          currentCity: currentCity,
          currentCameraPosition: currentCameraPosition,
          currentMarkersPlace: currentMarkersPlace,
          markers: markers,
        );
}
