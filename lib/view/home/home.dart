import 'package:bluestack_assignment_pwa_flutter/core/app_stateless_widget.dart';
import 'package:bluestack_assignment_pwa_flutter/model/tournaments.dart';
import 'package:bluestack_assignment_pwa_flutter/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class Home extends AppStatelessWidget {
  @override
  Widget setView(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _getHomeMobile(),
      tablet: _getHomeTablet(),
      desktop: _getHomeDesktop(),
    );
  }

  Widget _getHomeMobile() {
    return WhenRebuilder<HomeViewModel>(
      observe: () =>
          RM.get<HomeViewModel>()..setState((s) => s.fetchTournaments()),
      onData: (HomeViewModel state) {
        var tournamentList = state.getTournaments.data.tournaments;
        return ListView.builder(
            itemCount: tournamentList.length,
            itemBuilder: (context, index) =>
                _getRecommendedCard(tournamentList.elementAt(index)));
      },
      onIdle: () => Center(
        child: CircularProgressIndicator(),
      ),
      onWaiting: () => Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error) => Center(child: Text(error)),
    );
  }

  Widget _getHomeTablet() {
    return Center(
      child: Text("Hello Tablet"),
    );
  }

  Widget _getHomeDesktop() {
    return Center(
      child: Text("Hello Desktop"),
    );
  }

  Widget _getRecommendedText() {
    return Text('Recommended For You');
  }

  Widget _getRecommendedCard(Tournament obj) {
    return Card(
      margin: EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            obj.coverUrl,
            width: double.infinity,
            height: 120,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
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
