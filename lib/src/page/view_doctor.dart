import 'package:citas_medicav4/src/page/login.dart';
import 'package:citas_medicav4/src/page/register_doctor.dart';
import 'package:flutter/material.dart';

class ViewDoctor extends StatefulWidget {
  const ViewDoctor({Key? key}) : super(key: key);

  @override
  State<ViewDoctor> createState() => _ViewDoctorState();
}

class _ViewDoctorState extends State<ViewDoctor> {
  List<Map<String, String>> doctors = [
    {
      'id': '1',
      'nombre': 'Juan',
      'apellidos': 'Pérez',
      'direccion': 'Calle 123',
      'email': 'juan.perez@example.com',
      'telefono': '123456789',
      'sexo': 'Masculino',
    },
    // Agrega más datos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Doctores'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Registrar médico'),
              onTap: () {
                Navigator.push(
                  // Navega a la pantalla de registro de médico al dar clic
                  context,
                  MaterialPageRoute(builder: (context) => Registro()),
                );
              },
            ),
            ListTile(
              title: const Text('Ver Médicos'),
              onTap: () {
                Navigator.push(
                  // Navega a la pantalla de registro de médico al dar clic
                  context,
                  MaterialPageRoute(builder: (context) => ViewDoctor()),
                );
                // Aquí puedes agregar la lógica para abrir el formulario de registro de especialidad
              },
            ),
            ListTile(
              title: const Text('Registrar cita'),
              onTap: () {
                // Aquí puedes agregar la lógica para abrir el formulario de registro de cita
              },
            ),
            ListTile(
              title: const Text('Salir'),
              onTap: () {
                Navigator.push(
                  // Navega a la pantalla de registro de médico al dar clic
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
                // Aquí puedes agregar la lógica para cerrar la aplicación
              },
            ),
          ],
        ),
      ),
      body: DataTable(
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('Apellidos')),
          DataColumn(label: Text('Dirección')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Teléfono')),
          DataColumn(label: Text('Sexo')),
          DataColumn(label: Text('Opciones')),
        ],
        rows: doctors.map((doctor) {
          return DataRow(cells: [
            DataCell(Text(doctor['id']!)),
            DataCell(Text(doctor['nombre']!)),
            DataCell(Text(doctor['apellidos']!)),
            DataCell(Text(doctor['direccion']!)),
            DataCell(Text(doctor['email']!)),
            DataCell(Text(doctor['telefono']!)),
            DataCell(Text(doctor['sexo']!)),
            DataCell(Row(
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Acción cuando se presiona el botón Editar
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Acción cuando se presiona el botón Eliminar
                  },
                ),
              ],
            )),
          ]);
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ViewDoctor(),
  ));
}
