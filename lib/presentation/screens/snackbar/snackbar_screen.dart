import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            title: Text('¿Estás seguro?'),
            content: Text(
              'Nostrud laborum ullamco adipisicing duis amet pariatur adipisicing non velit est labore. Anim consectetur cillum officia excepteur aute mollit eu culpa sint sint mollit. Anim ex elit sunt duis deserunt excepteur laborum pariatur duis exercitation excepteur ut aliquip reprehenderit. Deserunt eiusmod qui minim commodo officia qui consequat elit ut consequat reprehenderit est. Eiusmod ea reprehenderit adipisicing aute ea mollit do laboris voluptate consectetur et.',
            ),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => context.pop(),
                child: Text('Aceptar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    Text(
                      'Aliqua est cillum reprehenderit et laboris laboris. Dolore incididunt do eu enim excepteur. Est ipsum mollit laboris eu tempor veniam officia excepteur pariatur ipsum nisi. Sunt eiusmod consequat nulla fugiat id consequat aute. Anim veniam dolore occaecat tempor anim nulla duis aliqua do non pariatur aute. Aute eu ut laboris dolor fugiat fugiat.',
                    ),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.remove_red_eye_outlined),
        label: Text('Snackbars y Diálogos'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
