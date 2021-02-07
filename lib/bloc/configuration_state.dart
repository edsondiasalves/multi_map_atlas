part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState extends Equatable {
  final MapProvider provider;
  final City initialPosition;
  final City currentPosition;

  ConfigurationState({
    this.provider,
    this.initialPosition,
    this.currentPosition,
  });

  @override
  List<Object> get props => [
        provider,
        initialPosition,
        currentPosition,
      ];
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial({MapProvider mapProvider})
      : super(
          provider: mapProvider,
          initialPosition: City.Lisbon,
          currentPosition: City.Lisbon,
        );
}

class MapProviderChangedState extends ConfigurationState {
  MapProviderChangedState({MapProvider provider}) : super(provider: provider);
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({
    MapProvider provider,
    City initialPosition,
  }) : super(
          provider: provider,
          initialPosition: initialPosition,
          currentPosition: initialPosition,
        );
}

class CameraChangedState extends ConfigurationState {
  CameraChangedState({
    MapProvider provider,
    City currentPosition,
    City initialPosition,
  }) : super(
          provider: provider,
          currentPosition: currentPosition,
          initialPosition: initialPosition,
        );
}
