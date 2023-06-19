import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login_heb/login/bloc/login/login_bloc.dart';

class SeachHeb extends StatefulWidget {
  const SeachHeb({Key? key}) : super(key: key);

  @override
  _SeachHebState createState() => _SeachHebState();
}

class _SeachHebState extends State<SeachHeb> {
  TextEditingController controllerSeatch = TextEditingController();

  bool isSearch = false;

  late String textSearch = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: TextFormField(
                    controller: controllerSeatch,
                    onChanged: (value) {
                      setState(() {
                        textSearch = value;

                        if (value.length > 2) {
                          context
                              .read<LoginBloc>()
                              .add(LoginHebEvent(email: value));
                          isSearch = false;
                          print(value);
                        }
                        print(value);
                      });
                    },
                    style: const TextStyle(color: Colors.black),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.qr_code_scanner_outlined),
                      ),
                      prefixIcon: Icon(Icons.search_outlined),
                      isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Buscandor',
                      // hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              !isSearch
                  ? textSearch.length > 2
                      ? ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 12,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    controllerSeatch.clear();
                                    isSearch = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(Icons.search),
                                    Text(
                                      'Buscando persona',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Icon(Icons.arrow_outward_outlined),
                                  ],
                                ));
                          },
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Column(
                            children: [
                              SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Tus búsquedas  recientes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 12),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      controllerSeatch.clear();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.close_outlined),
                                      Text(
                                        'Buscando persona',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      Icon(Icons.arrow_outward_outlined),
                                    ],
                                  )),
                            ],
                          ),
                        )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}
