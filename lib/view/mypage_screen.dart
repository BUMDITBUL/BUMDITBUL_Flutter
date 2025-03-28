import 'package:bumditbul_flutter/component/backarrow.dart';
import 'package:bumditbul_flutter/const/bumditbul_colors.dart';
import 'package:bumditbul_flutter/const/bumditbul_text_style.dart';
import 'package:bumditbul_flutter/widget/mypage_button.dart';
import 'package:bumditbul_flutter/const/routes.dart';
import 'package:flutter/material.dart';

class MypageScreen extends StatefulWidget {
  const MypageScreen({super.key});

  @override
  State<MypageScreen> createState() => _MypageScreenState();
}

class _MypageScreenState extends State<MypageScreen>
    with TickerProviderStateMixin {
  // 데이터 연동
  final List<Map<String, String>> todayStudies = [
    {'subject': '수학', 'pages': '96 ~ 106p'},
    {'subject': '영어', 'pages': '81 ~ 85p'},
    {'subject': '과학', 'pages': '95 ~ 106p'},
    {'subject': '과목명', 'pages': '페이지 범위'},
  ];

  final List<Map<String, String>> remainingStudies = [
    {'subject': '영어', 'pages': '81 ~ 85p'},
    {'subject': '과학', 'pages': '95 ~ 106p'},
    {'subject': '과목명', 'pages': '페이지 범위'},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: BumditbulColors.black900,
          leading: BackArrow(),
        ),
        backgroundColor: BumditbulColors.black900,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '마이페이지',
                    style: BumditbulTextStyle.MyPageMyPage(
                        color: BumditbulColors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.account_circle_rounded,
                        color: BumditbulColors.green400,
                        size: 60,
                      ),
                      Column(
                        children: [
                          MypageButton(text: '로그아웃', onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.login, (route) => false)),
                          MypageButton(text: '프로필 수정', onTap: () => Navigator.pushNamed(context, Routes.editProfile)),
                          MypageButton(text: '일정 수정', onTap: () => Navigator.pushNamed(context, Routes.editPlan)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '정지윤',
                      style: BumditbulTextStyle.MypageName(
                          color: BumditbulColors.white),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              labelColor: BumditbulColors.green400,
              unselectedLabelColor: BumditbulColors.black600,
              indicatorColor: BumditbulColors.white,
              overlayColor: MaterialStatePropertyAll(
                BumditbulColors.white.withOpacity(0.4),
              ),
              tabs: const [
                Tab(text: '!!오늘 할 공부!!'),
                Tab(text: '!!남은 공부!!'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildStudyGrid(todayStudies),
                  _buildStudyGrid(remainingStudies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudyGrid(List<Map<String, String>> studies) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          childAspectRatio: 1.6,
        ),
        itemCount: studies.length,
        itemBuilder: (context, index) {
          return _buildStudyCard(
              studies[index]['subject']!, studies[index]['pages']!);
        },
      ),
    );
  }

  Widget _buildStudyCard(String subject, String pages) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: BumditbulColors.black600,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: BumditbulTextStyle.TodoList(color: BumditbulColors.white),
          ),
          const SizedBox(height: 5),
          Text(
            pages,
            style: BumditbulTextStyle.RemainToDo(color: BumditbulColors.white),
          ),
        ],
      ),
    );
  }
}