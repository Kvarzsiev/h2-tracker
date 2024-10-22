import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/page_indicator.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  bool _isLogin = true;
  bool _isLoading = false;
  int _currentPageIndex = 0;
  bool _obscureText = true; // Inicialmente, a senha está oculta

  final _pageViewController = PageController();
  late TabController _tabController;

  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  String dropdownValue = 'PERDA_DE_PESO';
  final _dateController = TextEditingController();

  final UserStateService _userStateService = UserStateService();

  void _showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _login() async {
    try {
      final pessoaLogada = await client.pessoa
          .login(_emailController.text, _passwordController.text);

      if (pessoaLogada != null) {
        Navigator.pushReplacementNamed(
          context,
          '/home',
          arguments: pessoaLogada,
        );
      } else {
        _showErrorMessage('Email ou senha inválidos. Tente novamente.');
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      _showErrorMessage('Erro ao fazer login. Tente novamente.');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _registerUser() async {
    final user = Pessoa(
        nome: _nameController.text,
        altura: double.parse(_heightController.text),
        idade: int.parse(_ageController.text),
        email: _emailController.text,
        objetivo: dropdownValue,
        senha: _passwordController.text,
        cpf: _cpfController.text);

    final registeredUser = await client.pessoa.insert(user);

    _userStateService.user = registeredUser;

    await _registerWeight(registeredUser.id!);
  }

  Future<void> _registerWeight(int userId) async {
    final weight = Peso(
        peso: double.parse(_weightController.text),
        dataPesagem: DateTime.now(),
        pessoaId: userId,
        imc: 0);

    await client.peso.insert(weight, _userStateService.user!.altura);
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime.now(), // Minimum date
      lastDate: DateTime(2100), // Maximum date
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const CircularProgressIndicator()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_isLogin)
                  _loginWidget(context)
                else
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: Form(
                      key: _registerFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * .6,
                            width: MediaQuery.sizeOf(context).width * .3,
                            child: PageView(
                              controller: _pageViewController,
                              onPageChanged: _handlePageViewChanged,
                              children: [
                                _registerEmailAndPassword(),
                                _physiologicData(context),
                                _objectiveAndTime(context)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Container(
                    width: MediaQuery.sizeOf(context).width * .5,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[100],
                    ))
              ],
            ),
    );
  }

  SizedBox _loginWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .3,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue[400],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Entrar',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 16), // Espaço entre o título e o campo de email
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16), // Espaço entre email e senha
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // Espaço entre senha e botões
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FilledButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = false;
                            });
                          },
                          child: const Text('Realizar Cadastro'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FilledButton(
                          onPressed: () async {
                            // Validate returns true if the form is valid
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              await _login();
                            }
                          },
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Realizar Login'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _registerEmailAndPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue[400],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Dados Cadastrais',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        BasicFormField(
          label: 'CPF',
          controller: _cpfController,
          textInputType: InputType.cpf,
        ),
        BasicFormField(
          label: 'Nome Completo',
          controller: _nameController,
          textInputType: InputType.text,
        ),
        BasicFormField(
          label: 'Email',
          controller: _emailController,
          textInputType: InputType.email,
        ),
        BasicFormField(
            label: 'Senha', controller: _passwordController, obscureText: true),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_registerFormKey.currentState!.validate()) {
                    _handlePageViewChanged(1);
                    _updateCurrentPageIndex(1);
                  }
                },
                child: const Text('Próxima etapa'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }

  _physiologicData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue[400],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Dados Cadastrais',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: BasicFormField(
              label: 'Altura (cm)',
              controller: _heightController,
              textInputType: InputType.height,
            )),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: BasicFormField(
                label: 'Peso (Kg)',
                controller: _weightController,
                textInputType: InputType.weigth,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .144,
          child: BasicFormField(
            label: 'Idade',
            controller: _ageController,
            textInputType: InputType.age,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_registerFormKey.currentState!.validate()) {
                    _handlePageViewChanged(2);
                    _updateCurrentPageIndex(2);
                  }
                },
                child: const Text('Próxima etapa'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }

  _objectiveAndTime(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue[400],
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Dados Cadastrais',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: DropdownButton<String>(
                  value: dropdownValue,
                  padding: const EdgeInsets.all(8),
                  isExpanded: true,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  focusColor: Colors.lightBlueAccent[100]?.withOpacity(0.1),
                  items: const [
                    DropdownMenuItem<String>(
                      key: Key('PERDA_DE_PESO'),
                      value: 'PERDA_DE_PESO',
                      child: Text('Perda de Peso'),
                    ),
                    DropdownMenuItem<String>(
                      key: Key('GANHO_DE_PESO'),
                      value: 'GANHO_DE_PESO',
                      child: Text('Ganho de Peso'),
                    ),
                    DropdownMenuItem<String>(
                      key: Key('GANHO_DE_MASSA_MAGRA'),
                      value: 'GANHO_DE_MASSA_MAGRA',
                      child: Text('Ganho de Massa Magra'),
                    ),
                    DropdownMenuItem<String>(
                      key: Key('MANUTENCAO_DE_PESO'),
                      value: 'MANUTENCAO_DE_PESO',
                      child: Text('Manutenção de Peso'),
                    )
                  ]),
            ),
          ],
        ),
        TextFormField(
          controller: _dateController, // Assign the controller
          decoration: InputDecoration(
            labelText: 'Select Date',
            suffixIcon: Icon(Icons.calendar_today), // Calendar icon
          ),
          readOnly: true, // Make the field read-only
          onTap: () {
            // Step 3: Show the date picker when the field is tapped
            _selectDate(context);
          },
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_registerFormKey.currentState!.validate()) {
                    setState(() {
                      _isLoading = true;
                    });

                    await _registerUser();

                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.pushReplacementNamed(
                      context,
                      '/home',
                      arguments: _userStateService.user,
                    );
                  }
                },
                child: const Text('Finalizar Cadastro'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
        ),
      ],
    );
  }
}
