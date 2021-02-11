import 'package:bluestack_assignment_pwa_flutter/core/app_stateful_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/localization/app_localization.dart';
import 'package:bluestack_assignment_pwa_flutter/model/tournaments.dart';
import 'package:bluestack_assignment_pwa_flutter/view/home/home_widgets.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/home_view_model.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/localization_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Home extends AppStatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends AppStatefulWidgetState {
  @override
  Widget setView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flyingwolf',
          style: textTheme.s26w600,
        ),
        elevation: 0,
        leading: Icon(Icons.menu),
      ),
      body: _getResponsiveHome(),
    );
  }

  Widget _getResponsiveHome() {
    return ScreenTypeLayout(
      mobile: _getHomeMobile(),
      tablet: _getHomeTablet(),
      desktop: _getHomeDesktop(),
    );
  }

  Widget _getHomeMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getUserDetailsWidget(),
        Expanded(child: RecommendedCardList()),
      ],
    );
  }

  Widget _getHomeTablet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getUserDetailsWidget(),
        RecommendedCardList(),
      ],
    );
  }

  Widget _getHomeDesktop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getUserDetailsWidget(),
        RecommendedCardList(),
      ],
    );
  }

  Widget _getScoreCards(String played, String won, String success) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16.width),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: 6.height, horizontal: 32.width),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xffe37603), Color(0xffeea802)]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.height),
                    bottomLeft: Radius.circular(8.height),
                  )),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "$played\n",
                      style: textTheme.s24w600.copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: '${getString('tournaments')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: '${getString('played')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                      ]))),
          SizedBox(width: 2.width),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: 6.height, horizontal: 32.width),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xff442497), Color(0xffae64c3)]),
              ),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "$won\n",
                      style: textTheme.s24w600.copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: '${getString('tournaments')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: '${getString('won')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                      ]))),
          SizedBox(width: 2.width),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: 6.height, horizontal: 32.width),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xffed5b4f), Color(0xffef804f)]),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.height),
                    bottomRight: Radius.circular(8.height),
                  )),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "$success%\n",
                      style: textTheme.s24w600.copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: '${getString('winning')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                        TextSpan(
                          text: '${getString('percentage')}\n',
                          style:
                              textTheme.s18w500.copyWith(color: Colors.white),
                        ),
                      ]))),
        ],
      ),
    );
  }

  Widget _getRecommendedText() {
    return Padding(
      padding: EdgeInsets.only(top: 16.height, left: 24.width),
      child: Text(
        'Recommended For You',
        style: textTheme.s26w600,
      ),
    );
  }

  Widget _getUserDetailsWidget() {
    return StateBuilder<HomeViewModel>(
      observe: () =>
          RM.get<HomeViewModel>()..setState((s) => s.fetchUserDetails()),
      builder: (context, model) {
        if (model.connectionState == ConnectionState.done) {
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 120.fontSize,
                      width: 120.fontSize,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  model.state.getUserDetails.profileUrl))),
                    ),
                    SizedBox(
                      width: 16.width,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          model.state.getUserDetails.name,
                          style: textTheme.s26w600,
                        ),
                        SizedBox(
                          height: 4.height,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4.height, horizontal: 24.width),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.height),
                                border:
                                    Border.all(color: appColors.accentColor)),
                            child: RichText(
                                text: TextSpan(
                                    text:
                                        "${model.state.getUserDetails.rating.toString()}  ",
                                    style: textTheme.s26w700
                                        .copyWith(color: appColors.accentColor),
                                    children: [
                                  TextSpan(
                                      text: '${getString('rating')}',
                                      style: textTheme.s20w600
                                          .copyWith(color: Colors.grey))
                                ])))
                      ],
                    ),
                  ],
                ),
              ),
              _getScoreCards(
                  model.state.getUserDetails.tournamentsPlayed.toString(),
                  model.state.getUserDetails.tournamentsWon.toString(),
                  model.state.getUserDetails.winningPercentage.toString()),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getRecommendedCard(Tournament obj) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24.width, vertical: 8.height),
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
              imageUrl: obj.coverUrl,
              fit: BoxFit.cover,
              height: 60.height,
              width: double.infinity,
              placeholder: (context, text) => Center(
                    child: CircularProgressIndicator(),
                  ),
              errorWidget: (_, link, ___) => Center(
                    child: Image.asset(
                      '${imagePath}img_not_found.png',
                      width: double.infinity,
                    ),
                  )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300.width,
                      child: Text(
                        obj.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      obj.gameName,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
