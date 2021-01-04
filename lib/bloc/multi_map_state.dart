part of 'multi_map_bloc.dart';

@immutable
abstract class MultiMapState {
  final MapProvider provider;
  MultiMapState({this.provider});
}

class MultiMapInitial extends MultiMapState {}

class MapProviderChanged extends MultiMapState {
  MapProviderChanged({MapProvider provider}) : super(provider: provider);
}
