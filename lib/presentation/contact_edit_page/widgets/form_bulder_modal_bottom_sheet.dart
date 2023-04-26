import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormBuilderModalBottomSheet<T> extends ConsumerWidget {
  final String name;
  final T? initialValue;
  final String? Function(T?)? validator;
  final List<T> values;

  const FormBuilderModalBottomSheet({
    super.key,
    required this.name,
    required this.values,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormBuilderField<T>(
      name: name,
      initialValue: initialValue,
      validator: validator,
      builder: (field) {
        return InputDecorator(
          decoration: InputDecoration(
            label: const Text("method"),
            errorText: field.errorText,
          ),
          child: GestureDetector(
            child: Text(field.value?.toString() ?? ""),
            onTap: () async {
              final value = await showModalBottomSheet<T>(
                context: context,
                builder: ((context) {
                  return ListView.builder(
                    itemCount: values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(values[index].toString()),
                        onTap: () {
                          Navigator.of(context).pop(values[index]);
                        },
                      );
                    },
                  );
                }),
              );
              field.didChange(value);
            },
          ),
        );
      },
    );
  }
}
