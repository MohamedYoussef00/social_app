import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/home_layout/cubit/home_cubit.dart';
import 'package:social_app/modules/home_layout/cubit/home_states.dart';
import 'package:social_app/modules/login/login-Screan/login_screan.dart';
import 'package:social_app/network/cach_helper/cach_helper.dart';
import 'package:social_app/shared/components/blocobserver.dart';
import 'package:social_app/shared/conestantes/conestantes.dart';
import 'package:social_app/shared/stayles/theams.dart';

import 'modules/home_layout/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CashHelper.init();

  uId=CashHelper.getData(key: 'uId');
  Widget widget;

  if(uId==null){
    widget=LoginScrean();
  }else{
    widget=HomeLayout();
  }
  runApp( MyApp(widget));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key key}) : super(key: key);
  final Widget startPage;
  MyApp(this.startPage);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:(context) => SocialCubit()..getUserData()..getPosts(),
    child: BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:lightTheam(),
          home: startPage,
        );
      },
    ),);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
