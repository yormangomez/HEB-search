import 'dart:convert';
import 'package:dio/dio.dart';

class ProviderAPI {
  final Dio dio = Dio();

  Future<dynamic> getEmail(String search) async {
    try {
      final res = await dio.get(
        'https://speedoqa.vtexcommercestable.com.br/buscaautocomplete?productNameContains=$search',
        data: jsonEncode({
          "X-VTEX-API-AppKey": "vtexappkey-speedoqa-QLTMWW",
          "X-VTEX-API-AppToken":
              "ZFEWJHNSBOAPIZCDGTTTPHPHGYTRXCFLGGWKFTPYOFIXVFXGWDMIEMSEVNDUOCYXJZXQBDOWRXPQBGEOWOAGZAEHQCKGXZQIJJIHKCZSHWMSRMVALJZAAGWRWJDEAORM",
        }),
      );
      if (res.statusCode == 200) {
        print(res.data);
      }
      return res;
    } catch (e) {
      print(e);
    }
  }
}
