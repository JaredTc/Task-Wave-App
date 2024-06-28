import 'package:flutter/material.dart';
import 'package:taskwave/models/tasks_model.dart';

class TaskCard extends StatelessWidget {
  final Color color;
  final Tasks task;

  TaskCard({
    this.color = Colors.white,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.2), // Color de la sombra con opacidad
                  spreadRadius: 2, // Radio de difusión de la sombra
                  blurRadius: 5, // Radio de desenfoque de la sombra
                  offset: Offset(0, 3), // Desplazamiento de la sombra en x y y
                ),
              ],
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              )),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? 'No title',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        task.category ?? 'No category',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.black,
                        size: 19,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${task.porcent}%',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ));
  }
}
