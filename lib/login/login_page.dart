import 'package:flutter/material.dart';
import 'package:test_login_heb/login/widget/seach_heb.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 740,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SeachHeb()));
                      },
                      child: TextFormField(
                        validator: (value) {
                          if (value == '') return 'Este campo es requerido';
                          return value!.length < 2 ? 'Minimo de 2 letra' : null;
                        },
                        style: const TextStyle(color: Colors.white),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: Icon(Icons.qr_code_scanner_outlined),
                            prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search_outlined)),
                            enabled: false,
                            isDense: true,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'Buscandor'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
