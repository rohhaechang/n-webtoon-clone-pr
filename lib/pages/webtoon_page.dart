import 'package:flutter/material.dart';
import 'package:naver_webtoon_clone/widgets/custom_appbar.dart';
import 'package:naver_webtoon_clone/widgets/day_item.dart';
// ignore_for_file: prefer_const_constructors

class WebtoonPage extends StatefulWidget {
  const WebtoonPage({super.key});

  @override
  State<WebtoonPage> createState() => _WebtoonPageState();
}

class _WebtoonPageState extends State<WebtoonPage> {
  double customScrollViewHeight = 0;
  double _scrollOffset = 0;
  double _opacity = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      // 제네릭으로 ScrollUpdateNotification을 줘서 onNotification이 scroll event에 대한 콜백 함수가 되도록 하였다.
      onNotification: (notification) {
        setState(
          () {
            _scrollOffset += notification
                .scrollDelta!; // 스크롤 변화의 양이다. 위로 스크롤하면 -, 아래로 스크롤하면 +가 되기 때문에 이 변화량을 scrollOffset에 더했다.
            _opacity = ((_scrollOffset /
                        (MediaQuery.of(context).size.height / 8)) -
                    0.3)
                .clamp(0.0,
                    1.0); // opacity는 밝기. 0~1까지이다. 스크롤이 0보다 위로 갈 수도 있으므로 clamp를 이용해서 최솟값과 최댓값을 제한했다.
          },
        );
        return true; // true를 반환하면 해당 콜백 함수가 처리되었음을 나타낸다.
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 53, 53),
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(opacity: _opacity),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.21),
                    Container(
                      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),
                      child: GridView.builder(
                        itemCount: 36,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.6),
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.blue,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '제목',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '작가',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      '평점',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.amber,
              ),
              Positioned(
                top: _scrollOffset <
                        MediaQuery.of(context).size.height * 0.3 -
                            (kToolbarHeight * 2 + 2)
                    ? MediaQuery.of(context).size.height * 0.3
                    : _scrollOffset + kToolbarHeight * 2 + 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 53, 53, 53),
                      border: BorderDirectional(
                        bottom: BorderSide(color: Colors.grey, width: 0.3),
                      ),
                    ),
                    height: 38.5,
                    child: Row(
                      children: [
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 0,
                            text: '신작'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 1,
                            text: '매일'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 2;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 2,
                            text: '월'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 3;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 3,
                            text: '화'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 4;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 4,
                            text: '수'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 5;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 5,
                            text: '목'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 6;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 6,
                            text: '금'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 7;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 7,
                            text: '토'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 8;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 8,
                            text: '일'),
                        DayItem(
                            onTap: () {
                              setState(() {
                                selectedIndex = 9;
                              });
                            },
                            selectedIndex: selectedIndex,
                            index: 9,
                            text: '완결'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
