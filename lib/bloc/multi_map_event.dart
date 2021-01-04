part of 'multi_map_bloc.dart';

@immutable
abstract class MultiMapEvent {
  final MapProvider provider;

  MultiMapEvent({this.provider});
}

class ChangeMapProviderEvent extends MultiMapEvent {
  ChangeMapProviderEvent({MapProvider provider}) : super(provider: provider);
}
