import 'package:diplom/constant/import_const.dart';
import 'package:flutter/material.dart';

class MakeScreen extends StatefulWidget {
  const MakeScreen({super.key});

  @override
  State<MakeScreen> createState() => _MakeScreenState();
}

class _MakeScreenState extends State<MakeScreen> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        title: const Text('WORK ME',
        style: TextStyle(
            color: AppColors.blue,
            fontFamily: 'Jojo',
            fontSize: 30,
          ),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: const Row(
        children: [
          NavigationPane(),
          Expanded(
            child: ContentArea(),
          ),
        ],
      ),
    );
  }
}

class NavigationPane extends StatelessWidget {
  const NavigationPane({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.24,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.linerTop, AppColors.linerBottom],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            'Папки',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const TaskItem('Учёба'),
          const TaskItem('Список покупок'),
          const TaskItem('Работа'),
          const TaskItem('Планы на неделю'),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Действие при нажатии на кнопку "плюс"
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;

  const TaskItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.linerTop, AppColors.linerBottom],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class ContentArea extends StatelessWidget {
  const ContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.linerTop, AppColors.linerBottom],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'Учёба/Долги',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 6,
      ),
    );
  }
}
