import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_map_atlas/bloc/multi_map_bloc.dart';
import 'package:multi_map_atlas/enums/map_provider.dart';

class SettingsSideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 320,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Map Settings'),
            onTap: () => {},
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
            ),
            child: Text('Map Provider:'),
          ),
          BlocBuilder<MultiMapBloc, MultiMapState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Checkbox(
                          value: state.provider == MapProvider.Here,
                          onChanged: (_) {
                            BlocProvider.of<MultiMapBloc>(context).add(
                              ChangeMapProviderEvent(
                                provider: MapProvider.Here,
                              ),
                            );
                          },
                        ),
                        Text('Here'),
                        Checkbox(
                          value: state.provider == MapProvider.Google,
                          onChanged: (_) {
                            BlocProvider.of<MultiMapBloc>(context).add(
                              ChangeMapProviderEvent(
                                  provider: MapProvider.Google),
                            );
                          },
                        ),
                        Text('Google'),
                        Checkbox(
                          value: state.provider == MapProvider.MapBox,
                          onChanged: (_) {
                            BlocProvider.of<MultiMapBloc>(context).add(
                              ChangeMapProviderEvent(
                                  provider: MapProvider.MapBox),
                            );
                          },
                        ),
                        Text('MapBox'),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
