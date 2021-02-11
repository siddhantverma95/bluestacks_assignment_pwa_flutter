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
    return ScreenTypeLayout.builder(
      mobile: (context) => StateBuilder<HomeViewModel>(
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
                        height: 100,
                        width: 100,
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
                                  borderRadius:
                                      BorderRadius.circular(16.height),
                                  border:
                                      Border.all(color: appColors.accentColor)),
                              child: RichText(
                                  text: TextSpan(
                                      text:
                                          "${model.state.getUserDetails.rating.toString()}  ",
                                      style: textTheme.s26w700.copyWith(
                                          color: appColors.accentColor),
                                      children: [
                                    TextSpan(
                                        text: 'Elo rating',
                                        style: textTheme.s20w600
                                            .copyWith(color: Colors.grey))
                                  ])))
                        ],
                      ),
                    ],
                  ),
                ),
                // _getScoreCards(
                //     model.state.getUserDetails.tournamentsPlayed.toString(),
                //     model.state.getUserDetails.tournamentsWon.toString(),
                //     model.state.getUserDetails.winningPercentage.toString()),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
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
                          child: ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: tournamentList.length,
                              // gridDelegate:
                              //     SliverGridDelegateWithFixedCrossAxisCount(
                              //         crossAxisCount: 2),
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
                                      crossAxisCount: 3),
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
                      SizedBox(height: 16),
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
