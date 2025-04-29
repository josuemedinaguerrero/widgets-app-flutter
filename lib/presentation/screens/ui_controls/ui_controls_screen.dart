import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: Text('Vehículo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: Text('By Submarine'),
              subtitle: Text('Viajar por submarino'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.car;
                });
              },
            ),
            RadioListTile(
              title: Text('By Boat'),
              subtitle: Text('Viajar por barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.boat;
                });
              },
            ),
            RadioListTile(
              title: Text('By Plane'),
              subtitle: Text('Viajar por avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.plane;
                });
              },
            ),
            RadioListTile(
              title: Text('By Submarine'),
              subtitle: Text('Viajar por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) {
                setState(() {
                  selectedTransportation = Transportation.submarine;
                });
              },
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) {
            setState(() {
              wantsBreakfast = !wantsBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) {
            setState(() {
              wantsLunch = !wantsLunch;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Cena?'),
          value: wantsDinner,
          onChanged: (value) {
            setState(() {
              wantsDinner = !wantsDinner;
            });
          },
        ),
      ],
    );
  }
}
