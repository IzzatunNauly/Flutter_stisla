import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stisla_application_with_flutter/api/crud_helper.dart';
import 'package:stisla_application_with_flutter/model/kategori_model.dart';
import 'package:stisla_application_with_flutter/pages/deleteKategoriPage.dart';
import 'package:stisla_application_with_flutter/pages/editKategoriPage.dart';
import 'package:stisla_application_with_flutter/pages/tambahKategoriPage.dart';

class MainKategori extends StatefulWidget {
  const MainKategori({
    super.key,
  });

  @override
  State<MainKategori> createState() => _MainKategoriState();
}

class _MainKategoriState extends State<MainKategori> {
  List listCategory = [];
  String name = '';
  List<String> user = [];
  List<Category> categories = [];
  int selectedIndex = 0;
  int currentPage = 1;
  int lastPage = 0;
  bool isLoading = true;
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  fetchData() {
    CrudHelper.getCategories(currentPage.toString()).then((resultList) {
      setState(() {
        categories = resultList[0];
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  addMoreData() {
    CrudHelper.getCategories(currentPage.toString()).then((resultList) {
      setState(() {
        categories.addAll(resultList[0]);
        lastPage = resultList[1];
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < lastPage) {
          setState(() {
            isLoading = true;
            currentPage++;
            addMoreData();
          });
        }
      }
    });

    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Kategori',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 148, 67, 67),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 181, 197, 38),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const TambahKategori();
              });
        },
        child: const Icon(
          Icons.new_label,
          size: 35,
          color: Color.fromARGB(255, 148, 67, 67),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Container(
        color: Color.fromARGB(255, 148, 67, 67),
        child: <Widget>[
          ListView.builder(
              controller: scrollController,
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 30.0,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.create_rounded, color: Colors.yellow),
                          Text('Edit',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 148, 67, 67),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const <Widget>[
                          Icon(Icons.delete, color: Colors.black),
                          Text('Hapus',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 148, 67, 67),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  onDismissed: (DismissDirection direction) {
                    if (direction == DismissDirection.startToEnd) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return EditKategori(category: categories[index]);
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteCategori(category: categories[index]);
                          });
                    }
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Color.fromARGB(255, 148, 67, 67),
                      width: 1,
                    )),
                    child: ListTile(
                      title: Text(
                        categories[index].name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.yellow),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
        ][currentPageIndex],
      ),
    );
  }
}

int currentPageIndex = 0;
