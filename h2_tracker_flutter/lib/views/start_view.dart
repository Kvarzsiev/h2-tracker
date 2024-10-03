import 'package:flutter/material.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/page_indicator.dart';
import 'package:h2_tracker_flutter/main.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();

  bool _isLogin = true;
  int _currentPageIndex = 0;

  final _pageViewController = PageController();
  late TabController _tabController;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();

  void _login() {
    client.pessoa.login('', '');
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
                      height: MediaQuery.sizeOf(context).height * .3,
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: PageView(
                        controller: _pageViewController,
                        onPageChanged: _handlePageViewChanged,
                        children: [
                          _registerEmailAndPassword(),
                          _physiologicData(context),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: PageIndicator(
                        tabController: _tabController,
                        currentPageIndex: _currentPageIndex,
                        onUpdateCurrentPageIndex: _updateCurrentPageIndex,
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
                        label: 'Email', controller: _emailController),
                    BasicFormField(
                        label: 'Senha', controller: _passwordController),
                    Padding(
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
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Carregando')),
                                  );
                                }
                              },
                              child: const Text('Realizar Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  _registerEmailAndPassword() {
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
        BasicFormField(label: 'Email', controller: _emailController),
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
              label: 'Altura',
              controller: _heightController,
              textInputType: TextInputType.number,
            )),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: BasicFormField(
                label: 'Peso',
                controller: _weightController,
                textInputType: TextInputType.number,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .144,
          child: BasicFormField(
            label: 'Idade',
            controller: _ageController,
            textInputType: TextInputType.number,
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
                    _handlePageViewChanged(1);
                    _updateCurrentPageIndex(1);
                  }
                },
                child: const Text('Próxima etapa'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
