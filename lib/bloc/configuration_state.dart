part of 'configuration_bloc.dart';

@immutable
abstract class ConfigurationState {
  final MapProvider provider;
  final City city;
  ConfigurationState({this.provider, this.city});
}

class ConfigurationInitial extends ConfigurationState {
  ConfigurationInitial({MapProvider mapProvider})
      : super(provider: mapProvider, city: City.Lisbon);
}

class MapProviderChanged extends ConfigurationState {
  MapProviderChanged({MapProvider provider}) : super(provider: provider);
}

class InitialPositionState extends ConfigurationState {
  InitialPositionState({City city, MapProvider provider})
      : super(city: city, provider: provider);
}
