
import 'package:co_worky/presentation/widgets/auth_widgets/login_form.dart';
import 'package:co_worky/presentation/widgets/auth_widgets/signup_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          alignment: const AlignmentDirectional(0, -1),
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0, 0.5],
              begin: const AlignmentDirectional(0, 1),
              end: const AlignmentDirectional(0, -1),
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.blueGrey
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: const AlignmentDirectional(0, 0),
                  //child: Image.asset('assets/sec_logo.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height + 22,
                    constraints: const BoxConstraints(
                      maxWidth: 570,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const Alignment(0, 0),
                            child: TabBar(
                              tabAlignment: TabAlignment.center,
                              labelColor: Theme.of(context).primaryColor,
                              unselectedLabelColor:
                                  Theme.of(context).colorScheme.tertiary,
                              labelPadding:
                                  const EdgeInsetsDirectional.fromSTEB(
                                      32, 0, 32, 0),
                              indicatorColor: Colors.blueGrey,
                              labelStyle:
                                  const TextStyle(fontSize: 20),
                              unselectedLabelStyle:
                                  const TextStyle(fontSize: 20),
                              indicatorWeight: 3,
                              isScrollable: true,
                              dividerHeight: 0,
                              tabs: const [
                                Tab(
                                  text: 'Create Account',
                                ),
                                Tab(
                                  text: 'Log In',
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: TabBarView(
                              children: [
                                SignupForm(),
                                LoginForm()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
