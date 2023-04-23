import 'package:example/models/component_model.dart';
import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  const ButtonsPage({super.key});

  @override
  State<ButtonsPage> createState() => _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  final List<ComponentModel> buttons = ComponentModel.buttons;

  List<Widget> _buildComponent() {
    buttons.sort((ComponentModel a, ComponentModel b) =>
        a.example.name.compareTo(b.example.name));
    return buttons
        .where((a) => a.visible)
        .map(
          (e) => Visibility(
            visible: e.visible,
            child: ExpansionTile(
              title: Text(e.example.name),
              children: e
                  .widgets()
                  .entries
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            e.key,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          e.value,
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        )
        .toList();
  }

  Widget _searchField() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (s) {
          for (var element in buttons) {
            if (element.example.name.toLowerCase().contains(s.toLowerCase())) {
              element.visible = true;
            } else {
              element.visible = false;
            }
            setState(() {});
          }
        },
        keyboardType: TextInputType.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _searchField(),
        ..._buildComponent(),
        const SizedBox(
          height: 300,
        )
      ],
    );
  }
}
