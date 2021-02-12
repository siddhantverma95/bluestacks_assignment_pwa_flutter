import 'package:bluestack_assignment_pwa_flutter/core/app_stateful_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/model/tournaments.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/home_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class UserDetailsWidget extends AppStatefulWidget {
  @override
  _UserDetailsWidgetState createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState
    extends AppStatefulWidgetState<UserDetailsWidget> {
  @override
  Widget setView(BuildContext context) {
    return StateBuilder<HomeViewModel>(
      observe: () =>
          RM.get<HomeViewModel>()..setState((s) => s.fetchUserDetails()),
      builder: (context, model) {
        if (model.connectionState == ConnectionState.done) {
          return ScreenTypeLayout.builder(
            mobile: (context) => Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _getProfilePicWidget(model),
                      SizedBox(
                        width: 16.width,
                      ),
                      _getUserNameRatings(model),
                    ],
                  ),
                ),
                _getScoreCards(
                    model.state.getUserDetails.tournamentsPlayed.toString(),
                    model.state.getUserDetails.tournamentsWon.toString(),
                    model.state.getUserDetails.winningPercentage.toString()),
              ],
            ),
            desktop: (context) => Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _getProfilePicWidget(model),
                  SizedBox(
                    width: 16.width,
                  ),
                  _getUserNameRatings(model),
                  SizedBox(
                    height: 4.height,
                  ),
                  Expanded(
                    child: _getScoreCards(
                        model.state.getUserDetails.tournamentsPlayed.toString(),
                        model.state.getUserDetails.tournamentsWon.toString(),
                        model.state.getUserDetails.winningPercentage
                            .toString()),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getScoreCards(String played, String won, String success) {
    return ScreenTypeLayout(
      mobile: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 8.width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getTournamentsPlayed(played),
            SizedBox(width: 2.width),
            _getTournamentsWon(won),
            SizedBox(width: 2.width),
            _getWinningPercentage(success),
          ],
        ),
      ),
      desktop: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getTournamentsPlayed(played),
            SizedBox(width: 2.width),
            _getTournamentsWon(won),
            SizedBox(width: 2.width),
            _getWinningPercentage(success),
          ],
        ),
      ),
    );
  }

  Widget _getWinningPercentage(String success) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xffed5b4f), Color(0xffef804f)]),
        ),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$success%\n",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                children: [
                  TextSpan(
                    text: '${getString('winning')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: '${getString('percentage')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ])));
  }

  Container _getTournamentsWon(String won) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                children: [
                  TextSpan(
                    text: '${getString('tournaments')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: '${getString('won')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ])));
  }

  Container _getTournamentsPlayed(String played) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xffe37603), Color(0xffeea802)]),
        ),
        child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "$played\n",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                children: [
                  TextSpan(
                    text: '${getString('tournaments')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  TextSpan(
                    text: '${getString('played')}\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ])));
  }

  Column _getUserNameRatings(ReactiveModel<HomeViewModel> model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          model.state.getUserDetails.name,
          style: textTheme.s26w600,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 4.height,
        ),
        Container(
            padding:
                EdgeInsets.symmetric(vertical: 4.height, horizontal: 24.width),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.height),
                border: Border.all(color: appColors.accentColor)),
            child: RichText(
                text: TextSpan(
                    text: "${model.state.getUserDetails.rating.toString()}  ",
                    style: textTheme.s26w700
                        .copyWith(color: appColors.accentColor),
                    children: [
                  TextSpan(
                      text: 'Elo rating',
                      style: textTheme.s20w600.copyWith(color: Colors.grey))
                ])))
      ],
    );
  }

  Container _getProfilePicWidget(ReactiveModel<HomeViewModel> model) {
    return Container(
      height: 120.fontSize,
      width: 120.fontSize,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(model.state.getUserDetails.profileUrl))),
    );
  }
}

class RecommendedCardList extends AppStatefulWidget {
  @override
  _RecommendedCardListState createState() => _RecommendedCardListState();
}

class _RecommendedCardListState
    extends AppStatefulWidgetState<RecommendedCardList> {
  @override
  Widget setView(BuildContext context) {
    var _refreshIndicatorKey;
    var _scrollController;
    return StatefulWrapper(
      onInit: () {
        _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
        _scrollController = ScrollController();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          _refreshIndicatorKey.currentState?.show();
        });
        _scrollController.addListener(() {
          var maxScroll = _scrollController.position.maxScrollExtent;
          var currentScroll = _scrollController.position.pixels;
          var delta = 200.0; // or something else...
          //print("$maxScroll");
          if (maxScroll - currentScroll <= delta) {
            // At the bottom it will load for new content.
            _refreshIndicatorKey.currentState.show(atTop: false);
          }
        });
      },
      child: StateBuilder<HomeViewModel>(
          observe: () => RM.get<HomeViewModel>()
            ..setState((s) => s.fetchTournaments(false)),
          builder: (context, model) {
            if (model.connectionState == ConnectionState.done) {
              var tournamentList = model.state.getTournaments;
              print("SIZE :${tournamentList.length}");
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.height, left: 24.width),
                    child: Text(
                      '${getString('recommended')}',
                      style: textTheme.s26w600,
                    ),
                  ),
                  SizedBox(height: 4.height),
                  Expanded(
                    child: ScreenTypeLayout.builder(
                      mobile: (context) => RefreshIndicator(
                          key: _refreshIndicatorKey,
                          onRefresh: () async {
                            model.setState((s) => s.fetchTournaments(
                                (_scrollController.position.maxScrollExtent -
                                        _scrollController.position.pixels <=
                                    200)));
                          },
                          child: ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: tournamentList.length,
                              itemBuilder: (context, index) =>
                                  _getRecommendedCard(
                                      tournamentList.elementAt(index)))),
                      tablet: (context) => RefreshIndicator(
                          key: _refreshIndicatorKey,
                          onRefresh: () async {
                            model.setState((s) => s.fetchTournaments(
                                (_scrollController.position.maxScrollExtent -
                                        _scrollController.position.pixels <=
                                    200)));
                          },
                          child: GridView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: tournamentList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.9),
                              itemBuilder: (context, index) =>
                                  _getRecommendedCard(
                                      tournamentList.elementAt(index)))),
                      desktop: (context) => RefreshIndicator(
                          key: _refreshIndicatorKey,
                          onRefresh: () async {
                            model.setState((s) => s.fetchTournaments(
                                (_scrollController.position.maxScrollExtent -
                                        _scrollController.position.pixels <=
                                    200)));
                          },
                          child: GridView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: tournamentList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3, childAspectRatio: 1.0),
                              itemBuilder: (context, index) =>
                                  _getRecommendedCard(
                                      tournamentList.elementAt(index)))),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Card _getRecommendedCard(Tournament obj) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenTypeLayout(
              desktop: CachedNetworkImage(
                  imageUrl: obj.coverUrl,
                  fadeInCurve: Curves.easeIn,
                  fadeInDuration: Duration(milliseconds: 500),
                  fit: BoxFit.cover,
                  height: 40.height,
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
              mobile: CachedNetworkImage(
                  imageUrl: obj.coverUrl,
                  fadeInCurve: Curves.easeIn,
                  fadeInDuration: Duration(milliseconds: 500),
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
                      ))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        obj.name,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.s18w600,
                      ),
                      SizedBox(height: 8),
                      Text(
                        obj.gameName,
                        style: textTheme.s14w600.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Flexible(flex: 1, child: Icon(Icons.chevron_right)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
