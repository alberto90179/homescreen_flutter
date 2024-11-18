import 'package:flutter/material.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _synopsisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Película'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campo para el título
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título de la Película',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el título.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo para el año
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  labelText: 'Año',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el año.';
                  }
                  if (int.tryParse(value) == null || value.length != 4) {
                    return 'Ingresa un año válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo para el director
              TextFormField(
                controller: _directorController,
                decoration: const InputDecoration(
                  labelText: 'Director',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre del director.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo para el género
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(
                  labelText: 'Género',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el género.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Campo para la sinopsis
              TextFormField(
                controller: _synopsisController,
                decoration: const InputDecoration(
                  labelText: 'Sinopsis',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la sinopsis.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Botón para guardar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Muestra los datos ingresados
                      print('Título: ${_titleController.text}');
                      print('Año: ${_yearController.text}');
                      print('Director: ${_directorController.text}');
                      print('Género: ${_genreController.text}');
                      print('Sinopsis: ${_synopsisController.text}');

                      // Limpiar campos después de guardar
                      _titleController.clear();
                      _yearController.clear();
                      _directorController.clear();
                      _genreController.clear();
                      _synopsisController.clear();

                      // Mostrar mensaje de confirmación
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Película agregada con éxito.'),
                        ),
                      );
                    }
                  },
                  child: const Text('Guardar Película'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    _directorController.dispose();
    _genreController.dispose();
    _synopsisController.dispose();
    super.dispose();
  }
}
