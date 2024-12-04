import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/page_indicator.dart';
import 'package:h2_tracker_flutter/components/select_goal.dart';
import 'package:h2_tracker_flutter/extensions/show_snack_bar.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  bool _isLogin = true;
  int _currentPageIndex = 0;

  final _pageViewController = PageController();
  late TabController _tabController;

  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _sexController = TextEditingController();
  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  final UserStateService _userStateService = UserStateService();

  Future<void> _login() async {
    try {
      final user = await client.pessoa
          .login(_emailController.text, _passwordController.text);

      setState(() {
        _userStateService.user = user;
      });
    } on Exception {
      setState(() {
        _userStateService.user = null;
      });

      showSnackBar(
          context: context,
          message: 'Credenciais Inválidas!',
          status: SnackBarStatus.error);
    }
  }

  Future<void> _registerUser() async {
    final user = Pessoa(
        nome: _nameController.text,
        altura: double.parse(_heightController.text),
        idade: int.parse(_ageController.text),
        email: _emailController.text,
        senha: _passwordController.text,
        cpf: _cpfController.text,
        sex: _sexController.text.toUpperCase());

    final registeredUser = await client.pessoa.insert(user);

    _userStateService.user = registeredUser;

    final weight = Peso(
        peso: double.parse(_weightController.text),
        dataPesagem: DateTime.now(),
        pessoaId: registeredUser.id!,
        imc: 0);

    await client.peso.insert(weight, _userStateService.user!.altura);

    final diet = Dieta(
      dataFim: _selectedDate,
      pessoaId: registeredUser.id!,
      caloriasMaximasDia: 0,
      objetivo: dropdownValue,
      ativa: true,
      descricao:
          'Dieta genérica com foco em: ${dropdownValue.toReadableTitle()} (não substitui a consulta com um profissional).',
    );

    await client.dieta
        .insert(diet, weight.peso, user.altura, user.idade, user.sex);
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
        _selectedDate = picked;
      });
    }
  }

  String dropdownValue = 'PERDA_DE_PESO';

  void _updateDropdownValue(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(
                'assets/images/login.jpg',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox _loginWidget(BuildContext context) {
    final theme = Theme.of(context);

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
                    Text(
                      'Healthy Habits Tracker',
                      style: theme.textTheme.titleLarge?.copyWith(fontSize: 40),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.lightBlue[400],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Entrar',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    BasicFormField(
                      label: 'Email',
                      controller: _emailController,
                      textInputType: InputType.email,
                    ),
                    BasicFormField(
                      label: 'Senha',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    _actionButtons(context),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Padding _actionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
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
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  context.loaderOverlay.show();

                  await _login();

                  if (_userStateService.user != null) {
                    Navigator.pushReplacementNamed(
                        // ignore: use_build_context_synchronously
                        context,
                        '/home');
                  }

                  context.loaderOverlay.hide();
                }
              },
              child: const Text('Realizar Login'),
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
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Dados Fisiológicos',
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
        Row(
          children: [
            Expanded(
              child: BasicFormField(
                label: 'Idade',
                controller: _ageController,
                textInputType: InputType.age,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: BasicFormField(
                label: 'Sexo',
                controller: _sexController,
                textInputType: InputType.sex,
                hint: 'M/F',
              ),
            )
          ],
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
                'Objetivo',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
        SelectGoal(updateValue: _updateDropdownValue),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(
              labelText: 'Selecione uma Data',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            readOnly: true,
            onTap: () {
              _selectDate(context);
            },
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_registerFormKey.currentState!.validate()) {
                    context.loaderOverlay.show();

                    await _registerUser();

                    context.loaderOverlay.hide();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/home');
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
