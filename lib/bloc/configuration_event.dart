part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationEvent {
  final MapProvider provider;

  ConfigurationEvent({this.provider});
}

class ChangeMapProviderStarted extends ConfigurationEvent {
  ChangeMapProviderStarted({MapProvider provider}) : super(provider: provider);
}

class ChangeInitialPositionStarted extends ConfigurationEvent {
  final City initialCity;

  ChangeInitialPositionStarted({this.initialCity});
}

class ChangeCameraPositionStarted extends ConfigurationEvent {
  final City currentCity;

  ChangeCameraPositionStarted({this.currentCity});
}

class AddMarkersStarted extends ConfigurationEvent {
  final MarkerPlace placePosition;

  AddMarkersStarted({this.placePosition});
}
