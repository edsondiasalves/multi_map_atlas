import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';

part 'multi_map_event.dart';
part 'multi_map_state.dart';

class MultiMapBloc extends Bloc<MultiMapEvent, MultiMapState> {
  MultiMapBloc() : super(MultiMapInitial());

  @override
  Stream<MultiMapState> mapEventToState(
    MultiMapEvent event,
  ) async* {
    if (event is ChangeMapProviderEvent) {
      yield MapProviderChanged(provider: event.provider);
    }
  }
}
