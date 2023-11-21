import 'package:flutter/material.dart';
import 'package:naver_webtoon_clone/widgets/custom_appbar.dart';

class WebtoonPage extends StatefulWidget {
  const WebtoonPage({super.key});

  @override
  State<WebtoonPage> createState() => _WebtoonPageState();
}

class _WebtoonPageState extends State<WebtoonPage> {
  double _scrollOffset = 0;
  double _opacity = 0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        setState(
          () {
            _scrollOffset += notification.scrollDelta!;
            _opacity = (_scrollOffset /
                    (MediaQuery.of(context).size.height /
                        6)) // 화면을 6등분해서 6분의 1에서 6분의 2로 이동할 때 변하게 함
                .clamp(0.0,
                    1.0); // clamp는 그 나눠진 공간에서 투명도를 어디부터 어디까지 할 건지. 여기서는 0부터 1까지
          },
        );
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade700,
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(opacity: _opacity),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(color: Colors.white),
              ),
              Container(
                child: Column(
                  children: [Container()],
                ),
                height: MediaQuery.of(context).size.height * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
