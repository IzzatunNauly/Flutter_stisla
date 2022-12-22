import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/api/crud_helper.dart';
import 'package:stisla_application_with_flutter/model/kategori_model.dart';

// ignore: must_be_immutable
class EditKategori extends StatefulWidget {
  Category category;
  EditKategori({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<EditKategori> createState() => _EditKategoriState();
}

class _EditKategoriState extends State<EditKategori> {
  final TextEditingController txtEditCategory = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtEditCategory.text = widget.category!.name;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      title: const Text('Edit Category'),
      content: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: txtEditCategory,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.yellow),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.yellow),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Task',
                hintStyle: const TextStyle(
                  color: Colors.yellow,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              primary: Color.fromARGB(255, 138, 54, 54),
            ),
            onPressed: () {
              doEditCategory();
            },
            child: const Text(
              'Change',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  doEditCategory() async {
    final name = txtEditCategory.text;
    final response = await CrudHelper().editCategori(widget.category!, name);
    print(response.body);
    Navigator.pushNamed(context, "/main");
  }
}
