import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/widgets.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer App',
      debugShowCheckedModeBanner: false,
      home: const _ShimmerBodyExample(),
      theme: ThemeData.dark(),
    );
  }
}

class _ShimmerBodyExample extends StatelessWidget {
  const _ShimmerBodyExample();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 200.0,
          height: 100.0,
          child: Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: const Text(
              'Shimmer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iutub'),
        leading: Container(
          margin: const EdgeInsets.only(left: 12),
          child: Image.asset('assets/images/youtube_logo.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            tooltip: 'Suscríbete',
          )
        ],
      ),
      body: (isLoading)
        ? const ClassicLoadingIndicator()
        : const IutubVideoList()
    );
  }
}

class IutubVideoList extends StatelessWidget {
  const IutubVideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (_, __) => InkWell(
        onTap: () {},
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                'https://i3.ytimg.com/vi/sYYg4x1twV8/maxresdefault.jpg',
                height: 250,
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/SysTjGpT12mS_POjJM7qhVo9bQBhjCAVwrzzN78r5NwQLetCZoFiOGAlWGhYenyHJls5qku5_Q=s88-c-k-c0x00ffffff-no-rj'
                      ),
                    ),
                    SizedBox(width: 12),
                    Flexible(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('#72 ACTUALIZA tu APP de FLUTTER (Mini Apps) - Curso Flutter | César Arellano', style: TextStyle(fontWeight: FontWeight.w600),),
                        Text('César Arellano • 1M views  • 1 week ago')
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
