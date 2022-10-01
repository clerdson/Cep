import 'package:cep/data/dto/models.dart';
import 'package:cep/presentation/views/search.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import '../controllers/controller_home_page.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late final PoController _controller;

  bool favorite = false;
  late String cep;
  late String logradouro;
  var maskFormatter = new MaskTextInputFormatter(
      mask: ' #####-###',
      //filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);
  TextEditingController _editingController = TextEditingController();
  @override
  void initState() {
    super.initState();

    _controller = GetIt.I.get<PoController>();
    _controller.fetchData("61645060");
    cep = '61645060';
    logradouro = 'Ceara';
    _editingController.text = "";

    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return AlertDialog(
            title: new Text("Favorito"),
            content: new Text("Favorite um cep para ir para proxima pagina"),
            actions: <Widget>[
              Lottie.asset(
                'assets/client-gallery.json',
                repeat: true,
                reverse: true,
                animate: true,
              ),
              // define os botões na base do dialogo
              TextButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'CEP',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            TextField(
                inputFormatters: [maskFormatter],
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Busque seu cep",
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
                controller: _editingController),
            GestureDetector(
              onTap: () {
                _controller.fetchData(maskFormatter.getUnmaskedText());
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "SEARCH",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            _controller.inLoader == false
                ? CircularProgressIndicator()
                : ValueListenableBuilder(
                    valueListenable: _controller.posts,
                    builder: (context, value, child) => Card(
                      color: Colors.amber,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(40),
                          child: Visibility(
                            visible: value != null,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value!.cep,
                                ),
                                Text(
                                  value.logradouro,
                                ),
                                Text(
                                  value.complemento,
                                ),
                                Text(
                                  value.bairro,
                                ),
                                Text(
                                  value.localidade,
                                ),
                                Text(
                                  value.uf,
                                ),
                                Text(
                                  value.ibge,
                                ),
                                Text(
                                  value.gia,
                                ),
                                Text(
                                  value.ddd,
                                ),
                                Text(
                                  value.siafi,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      favorite = !favorite;
                                    });
                                  },
                                  child: favorite
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favorite = !favorite;
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Search(
                                                            cep: _controller
                                                                .posts
                                                                .value!
                                                                .cep,
                                                            logradouro:
                                                                _controller
                                                                    .posts
                                                                    .value!
                                                                    .logradouro,
                                                          )));
                                            });
                                          },
                                          icon: Icon(Icons.favorite))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              favorite = !favorite;
                                            });
                                          },
                                          icon: Icon(Icons.favorite_outline)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      /*
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Search(
                              cep: _controller.posts.value['cep'],
                              logradouro: _controller.posts.value['logradouro'],
                            )));
              },
            ),
          ],
        ),
      ),*/
    );
  }
}
