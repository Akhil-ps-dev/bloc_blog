part of './bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: _loginClick,
        child: Column(
          children: [
            Text("Login Page"),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LoginEvent.onLoginClicked(
                      email: emailController.text,
                      password: passwordController.text));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }

  void _loginClick(BuildContext context, LoginState state) {
    if (state is _Loading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );
    } else if (state is _LoginSuccess) {
      Navigator.of(context).pop(); // Close the progress indicator dialog
      context.go('/home'); // Navigate to home page
    } else if (state is _LoginFail) {
      Navigator.of(context).pop(); // Close the progress indicator dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  }
}
