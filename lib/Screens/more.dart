part of '../screens.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -1,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: const Text('Ещё', style: TextStyle(fontSize: 20)),
          leadingWidth: 100,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 275,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {
                        pushWithNavBar(context,
                            MaterialPageRoute(builder: (context) => Account()));
                      },
                      title: const Text('Личный кабинет',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.person_outlined, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        persistentTabController.jumpToTab(1);
                      },
                      title: const Text('Мои занятия',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.directions_run, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        pushWithNavBar(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Schedule()));
                      },
                      title: const Text('Расписание',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.assignment_outlined, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        persistentTabController.jumpToTab(2);
                      },
                      title: const Text('О студии',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.business_outlined, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        makePhoneCall();
                      },
                      title: const Text('Позвонить в студию',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(
                        Icons.call_outlined,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 165,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        persistentTabController.jumpToTab(3);
                      },
                      title: const Text('Уведомления',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading:
                          const Icon(Icons.notifications_outlined, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        pushScreen(context,
                            screen: FeedbackTF(), withNavBar: true);
                      },
                      title: const Text('Обратная связь',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.sms_outlined, size: 25),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {
                        IconSnackBar.show(
                          context,
                          snackBarType: SnackBarType.alert,
                          snackBarStyle: const SnackBarStyle(
                            maxLines: 1,
                          ),
                          label: 'Ошибка!',
                        );
                      },
                      title: const Text('О приложении',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w300)),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 17, color: Color.fromARGB(125, 43, 43, 43)),
                      leading: const Icon(Icons.info_outlined, size: 25),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
