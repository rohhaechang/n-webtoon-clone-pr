import 'package:flutter/material.dart';
import 'package:naver_webtoon_clone/pages/best.dart';
import 'package:naver_webtoon_clone/pages/more_webtoon.dart';
import 'package:naver_webtoon_clone/pages/my_page.dart';
import 'package:naver_webtoon_clone/pages/recommended_done.dart';
import 'package:naver_webtoon_clone/pages/webtoon_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey,
          onTap: _movePage,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Ink(
                  child: Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.white,
                  ),
                ),
                label: '웹툰'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.access_alarm,
                  color: Colors.white,
                ),
                label: '추천완결'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.new_releases_outlined,
                  color: Colors.white,
                ),
                label: '베스트도전'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sentiment_satisfied_outlined,
                  color: Colors.white,
                ),
                label: 'MY'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_view_outlined,
                  color: Colors.white,
                ),
                label: '더보기'),
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            WebtoonPage(),
            RecommendedDone(),
            Best(),
            MyPage(),
            MoreWebtoon(),
          ],
        ));
  }

  void _movePage(int index) {
    _pageController.jumpToPage(index);
    _pageIndex = index;
    setState(() {});
  }
}
