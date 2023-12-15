import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  String _idDoctor = "";
  String _name = "";
  String _lastName = "";
  String _birthdate = "";
  String _address = "";
  String _sex = "";
  String _bloodType = "";
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'ID Doctor',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa el ID del doctor.';
                  }
                  if (!isNumeric(value)) {
                    return 'Ingresa solo números.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _idDoctor = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu nombre.';
                  }
                  if (!isAlphabetic(value)) {
                    return 'Ingresa solo letras.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu apellido.';
                  }
                  if (!isAlphabetic(value)) {
                    return 'Ingresa solo letras.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _lastName = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Fecha de Nacimiento',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu fecha de nacimiento.';
                  }
                  if (!isDate(value)) {
                    return 'Ingresa una fecha válida.';
                  }
                  if (!isAgeInRange(value)) {
                    return 'La edad debe estar entre 22 y 90 años.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _birthdate = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  prefixIcon: Icon(Icons.home),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu dirección.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _address = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Sexo',
                  prefixIcon: Icon(Icons.accessibility),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu sexo.';
                  }
                  if (!isAlphabetic(value)) {
                    return 'Ingresa solo letras.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _sex = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tipo de Sangre',
                  prefixIcon: Icon(Icons.local_hospital),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa tu tipo de sangre.';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bloodType = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300,
                height: 60.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_sex.isEmpty || _bloodType.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Por favor, completa todos los campos.'),
                          ),
                        );
                      } else {
                        // TODO: Realizar el registro con los datos ingresados
                        // Aquípuedes agregar tu código para enviar los datos a un servidor o almacenarlos localmente.
                        print('Registro exitoso');
                      }
                    }
                  },
                  child: Text(
                    "Registrar",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "FredokaOne",
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isNumeric(String value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  bool isAlphabetic(String value) {
    final alphabeticRegex = RegExp(r'^[a-zA-Z]+$');
    return alphabeticRegex.hasMatch(value);
  }

  bool isDate(String value) {
    try {
      DateTime.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isAgeInRange(String value) {
    final birthdate = DateTime.parse(value);
    final now = DateTime.now();
    final age = now.difference(birthdate).inDays ~/ 365;
    return age >= 22 && age <= 90;
  }
}
