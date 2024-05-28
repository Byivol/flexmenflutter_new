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
        backgroundColor: const Color.fromARGB(255, 228, 228, 228),
        body: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            const SizedBox(height: 10),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 485,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text('Личный кабинет',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Мои занятия',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Расписание',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Новости',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('О студии',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Сотрудники',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Мои достижения',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Стать членом студии',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Позвонить в студию',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Персональный тренинг',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
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
                height: 200,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      title: const Text('Уведомления',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Обратная связь',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                    const Divider(
                        color: Color.fromARGB(20, 0, 0, 0), height: 0),
                    ListTile(
                      onTap: () {},
                      title: const Text('Личный кабинет',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 20),
                      leading: const Icon(Icons.person, size: 30),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
