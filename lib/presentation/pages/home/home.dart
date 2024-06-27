part of './bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeBloc>().featchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: context.read<HomeBloc>().featchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data!.data![index].title.toString());
                    });
              }
              return Container();
            })
      ],
    );
  }
}
