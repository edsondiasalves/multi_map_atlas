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
  final City city;

  ChangeInitialPositionStarted({this.city});
}

class ChangeCameraPositionStarted extends ConfigurationEvent {
  final City city;

  ChangeCameraPositionStarted({this.city});
}
