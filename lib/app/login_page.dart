import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:routefly/routefly.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _isLoading
            ? Center(
            child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary))
            : SingleChildScrollView(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(40.0),
                      child: Image.asset("assets/image_educar.png")),
                  _generateField(_controllerEmail, "Insira seu email",
                      "example@gmail.com"),
                  _generateField(
                    _controllerPassword,
                    "Insira sua senha",
                    "",
                    obscureText: true,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                          Theme.of(context).colorScheme.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                            fontSize: 16,
                            color:
                            Theme.of(context).colorScheme.onPrimary),
                      ),
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _generateField(
      TextEditingController controller, String label, String placeholder,
      {TextInputType type = TextInputType.text,
        bool obscureText = false,
        String? text,
        bool mandatory = true}) {
    if (text != null && controller.text.isEmpty) controller.text = text;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty && mandatory) {
            return "Por favor, preencha esse campo";
          }
          if (label == "Insira seu email" && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return "Por favor, insira um email válido";
          }
          if (label == "Insira sua senha" && value.length < 6) {
            return "A senha deve ter pelo menos 6 caracteres";
          }
          return null;
        },
        keyboardType: type,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        obscureText: _obscureText && obscureText,
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
            icon: Icon(
              // Alterna os ícones baseado na visibilidade
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              // Atualizar o estado para alternar a visibilidade
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          counterText: '',
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
          contentPadding: EdgeInsets.all(12),
          hintText: placeholder,
          hintStyle:
          TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).focusColor.withOpacity(0.2))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).focusColor.withOpacity(0.5))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).focusColor.withOpacity(0.2))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          errorStyle: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Routefly.navigate('/home');
    }
  }
}
