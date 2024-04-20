import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_flutter/task/model/TaskModel.dart';

class ManageTask extends StatelessWidget {
  final TaskModel model;

  ManageTask({super.key, required this.model});

  RxBool onSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 25, left: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: Text(
                  'Scrollable Tasks',
                  style: GoogleFonts.roboto(fontSize: 25),
                ),
              ),
              Container(
                width: 631,
                height: 450,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: _createDataTable(),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 8),
                      child: Text(
                        'Select to Delete or Update the Task!',
                        style: GoogleFonts.roboto(fontSize: 18),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 130, top: 5),
                    child:
                        FilledButton(onPressed: () {}, child: Text('DELETE')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:
                        FilledButton(onPressed: () {}, child: Text('UPDATE')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
      dividerThickness: 2,
      headingTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      headingRowColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
      border: const TableBorder(
        left: BorderSide(width: 2, color: Colors.black),
        right: BorderSide(width: 2, color: Colors.black),
        top: BorderSide(width: 2, color: Colors.black),
        bottom: BorderSide(width: 2, color: Colors.black),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return const [
      DataColumn(label: Text('Title')),
      DataColumn(label: Text('Description')),
      DataColumn(label: Text('Status')),
    ];
  }

  List<DataRow> _createRows() {
    List<DataRow> dataRowList = List.empty(growable: true);
    for (TaskModel m in model.listModel) {
      List<DataCell> listCell = List.empty(growable: true);
      DataCell title = DataCell(Text(m.title));
      DataCell description = DataCell(SizedBox(
          width: 200,
          child: TextFormField(
              controller: TextEditingController(text: m.description))));
      DataCell status = DataCell(SizedBox(
          width: 200,
          child: TextFormField(
              controller: TextEditingController(text: m.status))));
      listCell.add(title);
      listCell.add(description);
      listCell.add(status);
      DataRow dataRow = DataRow(
        cells: listCell,
        selected: onSelected.value,
        onSelectChanged: (value) {
          onSelected.value = value!;
        },
      );
      dataRowList.add(dataRow);
    }
    return dataRowList;
  }
}
