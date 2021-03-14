import 'dart:convert';
import 'package:flutter_amlak/Model/Customer.dart';
import 'package:http/http.dart' as http;

class HttpTeammate{


  static var url = Uri.https('www.pkup.ir', '/get_persons/get_teammate.php', {'q': '{http}'});

  static Future<List<Persons>> getData() async {

    List<Persons> persons = [];

    var response = await http.get(url);
    var responseBody = json.decode(response.body);

    Persons person = new Persons();


    responseBody.forEach((item) {
      print(item);
      print(item['id']);
      person.id = item['id'];
      person.name = item['name'];
      person.mobile_phone = item['mobile_phone'];
      person.note = item['note'];
      person.date = item['date'];

      persons.add(person);
    });

    return persons;
  }

}
