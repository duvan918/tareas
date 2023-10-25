/*
* Aplicaciones Híbridas
* Proyecto final - Lista de Tareas
* Desarrollado por Yeison Duvan Franco Rojas
* c.c. 1128452868
* */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lista de Tareas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> tareas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tareas[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _deleteTodo(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTarea,
        tooltip: 'Agregar tarea',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addTarea() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String task = "";
        return AlertDialog(
          title: const Text('Nueva Tarea'),
          content: TextField(
            onChanged: (value) {
              task = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Guardar'),
              onPressed: () {
                if (task.isNotEmpty) {
                  setState(() {
                    tareas.add(task);
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      tareas.removeAt(index);
    });
  }

}
