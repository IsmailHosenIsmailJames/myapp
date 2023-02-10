import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List listDeposite = [];
  List listCost = [];
  void createPdf() {}

  Color colorGreen1 = Colors.lightGreenAccent;
  Color colorGreen2 = Colors.greenAccent;
  Color colorBlue1 = Colors.lightBlueAccent;
  Color colorBlue2 = Colors.blueAccent;
  Color colorGray1 = Colors.grey;
  Color colorGray2 = Colors.blueGrey;
  List<Widget> depositList = [];
  List<Widget> costList = [];
  double totalDeposite = 0;
  double totalCost = 0;
  final fromKey = GlobalKey<FormState>();
  final headingController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();
  final fromKey2 = GlobalKey<FormState>();
  final headingController2 = TextEditingController();
  final descriptionController2 = TextEditingController();
  final amountController2 = TextEditingController();
  double headingWidth = 100;
  double amaountWidth = 150;
  double descriptionWidth = 200;
  double topHeading = 450;

  Future<void> saveAsPdf(String fileName) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => const Scaffold(
        backgroundColor: Color.fromARGB(65, 0, 0, 0),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    final Uint8List fontData =
        File('extra file/NotoSansBengali-VariableFont_wdth,wght.ttf')
            .readAsBytesSync();
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    double headingWidth = 80;
    double amaountWidth = 110;
    double descriptionWidth = 150;
    double topHeading = 340;
    const green2 = PdfColor(0.411, 0.941, 0.682);
    const green1 = PdfColor(0.698, 0.999, 0.35);
    const blue1 = PdfColor(0.251, 0.769, 0.999);
    const blue2 = PdfColor(0.27, 0.541, 0.999);
    const gry1 = PdfColor(0.62, 0.62, .62);
    const gry2 = PdfColor(0.377, 0.50, 0.55);
    final pdf = pw.Document();
    List<pw.Widget> widgetDepositePDF = [];
    List<pw.Widget> widgetCostPDF = [];

    for (int i = 0; i < listDeposite.length; i++) {
      widgetDepositePDF.add(
        pw.Row(
          children: [
            pw.Container(
              color: i % 2 == 0 ? gry2 : gry1,
              height: 30,
              width: headingWidth,
              child: pw.Text(
                listDeposite[i][0],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
            pw.Container(
              color: i % 2 == 0 ? green2 : green1,
              height: 30,
              width: descriptionWidth,
              child: pw.Text(
                listDeposite[i][1],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
            pw.Container(
              color: i % 2 == 0 ? blue2 : blue1,
              height: 30,
              width: amaountWidth,
              child: pw.Text(
                listDeposite[i][2],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
          ],
        ),
      );
    }

    for (int i = 0; i < listCost.length; i++) {
      widgetCostPDF.add(
        pw.Row(
          children: [
            pw.Container(
              color: i % 2 == 0 ? gry2 : gry1,
              height: 30,
              width: headingWidth,
              child: pw.Text(
                listCost[i][0],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
            pw.Container(
              color: i % 2 == 0 ? green2 : green1,
              height: 30,
              width: descriptionWidth,
              child: pw.Text(
                listCost[i][1],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
            pw.Container(
              color: i % 2 == 0 ? blue2 : blue1,
              height: 30,
              width: amaountWidth,
              child: pw.Text(
                listCost[i][2],
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(font: ttf),
              ),
            ),
          ],
        ),
      );
    }

    final elementOfPdfDeposite = pw.Column(
      children: [
        pw.Container(
          width: headingWidth + descriptionWidth + amaountWidth,
          height: 30,
          decoration: const pw.BoxDecoration(
            color: PdfColor(.37, .49, .545),
            borderRadius: pw.BorderRadius.only(
              topLeft: pw.Radius.circular(10),
              topRight: pw.Radius.circular(10),
            ),
          ),
          child: pw.Center(
            child: pw.Text(
              'টাকা জমা',
              style: pw.TextStyle(font: ttf),
            ),
          ),
        ),
        pw.Row(
          children: [
            pw.Container(
              color: const PdfColor(.62, .62, .62),
              height: 30,
              width: headingWidth,
              child: pw.Text(
                "হেডিং",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
              ),
            ),
            pw.Container(
              color: green1,
              height: 30,
              width: descriptionWidth,
              child: pw.Text(
                "বিবরণ",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  font: ttf,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.Container(
              color: blue1,
              height: 30,
              width: amaountWidth,
              child: pw.Text(
                "টাকার পরিমাণ",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
              ),
            ),
          ],
        ),
        pw.Column(children: widgetDepositePDF),
        pw.Container(
          decoration: const pw.BoxDecoration(
            color: PdfColor(.999, .84, .251),
            borderRadius: pw.BorderRadius.only(
              bottomLeft: pw.Radius.circular(10),
              bottomRight: pw.Radius.circular(10),
            ),
          ),
          height: 30,
          width: topHeading,
          child: pw.Text(
            'মোট খরচের পরিমাণ : $totalCost',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
                fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf),
          ),
        ),
      ],
    );

    final elementOfPdfCost = pw.Column(
      children: [
        pw.Container(
          width: headingWidth + descriptionWidth + amaountWidth,
          height: 30,
          decoration: const pw.BoxDecoration(
            color: PdfColor(.38, .49, .545),
            borderRadius: pw.BorderRadius.only(
              topLeft: pw.Radius.circular(10),
              topRight: pw.Radius.circular(10),
            ),
          ),
          child: pw.Center(
            child: pw.Text(
              'খরচের পরিমাণ',
              style: pw.TextStyle(font: ttf),
            ),
          ),
        ),
        pw.Row(
          children: [
            pw.Container(
              color: const PdfColor(.62, .62, .62),
              height: 30,
              width: headingWidth,
              child: pw.Text(
                "হেডিং",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
              ),
            ),
            pw.Container(
              color: green1,
              height: 30,
              width: descriptionWidth,
              child: pw.Text(
                "বিবরণ",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
              ),
            ),
            pw.Container(
              color: blue1,
              height: 30,
              width: amaountWidth,
              child: pw.Text(
                "টাকার পরিমাণ",
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold, font: ttf),
              ),
            ),
          ],
        ),
        pw.Column(children: widgetCostPDF),
        pw.Container(
          decoration: const pw.BoxDecoration(
            color: PdfColor(.999, .84, .251),
            borderRadius: pw.BorderRadius.only(
              bottomLeft: pw.Radius.circular(10),
              bottomRight: pw.Radius.circular(10),
            ),
          ),
          height: 30,
          width: topHeading,
          child: pw.Text(
            'মোট জমা : $totalDeposite',
            textAlign: pw.TextAlign.center,
            style: pw.TextStyle(
                fontSize: 20, fontWeight: pw.FontWeight.bold, font: ttf),
          ),
        ),
      ],
    );

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a3,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Row(
              children: [
                elementOfPdfDeposite,
                pw.SizedBox(
                  width: 15,
                ),
                elementOfPdfCost
              ],
            ),
          );
        },
      ),
    );

    final file = File("$fileName.pdf");
    await file.writeAsBytes(await pdf.save());

    Navigator.pop(context);
  }

  void addInfo() {
    Widget rowDetails = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: depositList.length % 2 == 0 ? colorGray2 : colorGray1,
          height: 30,
          width: headingWidth,
          child: Text(
            headingController.text.isNotEmpty ? headingController.text : "",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: depositList.length % 2 == 0 ? colorGreen2 : colorGreen1,
          height: 30,
          width: descriptionWidth,
          child: Text(
            descriptionController.text,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: depositList.length % 2 == 0 ? colorBlue2 : colorBlue1,
          height: 30,
          width: amaountWidth,
          child: Text(
            amountController.text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
    setState(() {
      depositList.add(rowDetails);
      totalDeposite += double.parse(amountController.text);
      listDeposite.add([
        headingController.text.trim().isEmpty
            ? ""
            : headingController.text.trim(),
        descriptionController.text.trim(),
        amountController.text
      ]);
    });
  }

  void addInfo2() {
    Widget rowDetails = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: costList.length % 2 == 0 ? colorGray2 : colorGray1,
          height: 30,
          width: headingWidth,
          child: Text(
            headingController2.text.isNotEmpty ? headingController2.text : "",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: costList.length % 2 == 0 ? colorGreen2 : colorGreen1,
          height: 30,
          width: descriptionWidth,
          child: Text(
            descriptionController2.text,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          color: costList.length % 2 == 0 ? colorBlue2 : colorBlue1,
          height: 30,
          width: amaountWidth,
          child: Text(
            amountController2.text,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
    setState(() {
      costList.add(rowDetails);
      totalCost += double.parse(amountController2.text);
      listCost.add([
        headingController2.text.trim().isEmpty
            ? ""
            : headingController2.text.trim(),
        descriptionController2.text.trim(),
        amountController2.text
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('লেন-দেন হিসাব'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 96, 70, 31)),
                onPressed: () {
                  final filenmeController = TextEditingController();
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Scaffold(
                      body: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          width: 500,
                          height: 180,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                autocorrect: false,
                                autofocus: true,
                                autovalidateMode: AutovalidateMode.always,
                                controller: filenmeController,
                                decoration: InputDecoration(
                                  hintText: "Write the name of file.",
                                  labelText: "File Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Give a file name please";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (filenmeController.text.isNotEmpty) {
                                        saveAsPdf(filenmeController.text);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text("Save"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(76, 0, 0, 0),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text('Save as PDF'),
                    Icon(Icons.save),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    height: 30,
                    width: topHeading,
                    child: const Text(
                      'টাকা জমা',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 30,
                        width: headingWidth,
                        child: const Text(
                          "হেডিং",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        color: colorGreen1,
                        height: 30,
                        width: descriptionWidth,
                        child: const Text(
                          "বিবরণ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        color: colorBlue1,
                        height: 30,
                        width: amaountWidth,
                        child: const Text(
                          "টাকার পরিমাণ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Column(children: depositList),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    height: 30,
                    width: topHeading,
                    child: Text(
                      'মোট জমা : $totalDeposite',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        context: context,
                        builder: (context) => Center(
                          child: SizedBox(
                            width: 400,
                            child: Form(
                              key: fromKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "জমা",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: headingController,
                                    decoration: InputDecoration(
                                      hintText: "একটি হেডিং লিখুন।",
                                      labelText: "হেডিং",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: descriptionController,
                                    autocorrect: true,
                                    autofocus: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "বিবরণ অবশ্যই দিতে হবে।";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "একটি বিবরণ লিখুন।",
                                      labelText: "বিবরণ",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: amountController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null) {
                                        return "টাকার পরিমাণ লিখুন";
                                      }
                                      try {
                                        double.parse(value);
                                      } catch (e) {
                                        return "টাকার পরিমাণ সঠিক নয়।";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "টাকার পরিমাণ কত ?",
                                      labelText: "টাকার পরিমাণ",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 50),
                                      maximumSize: const Size(100, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (fromKey.currentState!.validate()) {
                                        addInfo();
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text('Done '),
                                        Icon(Icons.send)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                      ),
                    ),
                    height: 30,
                    width: topHeading,
                    child: const Text(
                      'খরচের পরিমাণ',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 30,
                        width: headingWidth,
                        child: const Text(
                          "হেডিং",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        color: colorGreen1,
                        height: 30,
                        width: descriptionWidth,
                        child: const Text(
                          "বিবরণ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        color: colorBlue1,
                        height: 30,
                        width: amaountWidth,
                        child: const Text(
                          "টাকার পরিমাণ",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Column(children: costList),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    height: 30,
                    width: topHeading,
                    child: Text(
                      'মোট খরচের পরিমাণ : $totalCost',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                        ),
                        context: context,
                        builder: (context) => Center(
                          child: SizedBox(
                            width: 400,
                            child: Form(
                              key: fromKey2,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "খরচ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    controller: headingController2,
                                    decoration: InputDecoration(
                                      hintText: "একটি হেডিং লিখুন।",
                                      labelText: "হেডিং",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: descriptionController2,
                                    autocorrect: true,
                                    autofocus: true,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "অবশ্যই বিবরণ দিতে হবে।";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "একটি বিবরণ দিন।",
                                      labelText: "বিবরণ",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    controller: amountController2,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null) {
                                        return "টাকার পরিমাণ দিন।";
                                      }
                                      try {
                                        double.parse(value);
                                      } catch (e) {
                                        return "টাকার পরিমাণ সঠিক নয়।";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "টাকার পরিমাণ কত ?",
                                      labelText: "টাকার পরিমাণ",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(100, 50),
                                      maximumSize: const Size(100, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (fromKey2.currentState!.validate()) {
                                        addInfo2();
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: const [
                                        Text('Done '),
                                        Icon(Icons.send)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
