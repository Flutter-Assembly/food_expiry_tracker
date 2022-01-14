import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_expiry_tracker/providers/user_provider.dart';
import 'package:food_expiry_tracker/ui/core/styles.dart';
import 'package:food_expiry_tracker/ui/router/router.gr.dart';
import 'package:provider/provider.dart';

import 'app_title.dart';

class AppScaffold extends StatefulWidget {
  final Widget title;
  final Widget? leading;
  final Widget body;
  final PreferredSizeWidget? tabBar;
  final Widget? footer;
  final Widget? fab;
  final Widget? drawer;
  final FloatingActionButtonLocation? fabLocation;

  const AppScaffold(
      {Key? key,
      required this.body,
      required this.title,
      this.leading,
      this.tabBar,
      this.footer,
      this.fab,
      this.fabLocation,
      this.drawer})
      : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation:
                defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
            centerTitle: true,
            bottom: widget.tabBar != null ? widget.tabBar : null,
            title:
                widget.title != null ? widget.title : AppTitle(innerApp: true),
            leading: widget.leading != null
                ? widget.leading
                : IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xFF878787),
                      size: 32,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                  ),
            actions: [
              InkResponse(
                child: Container(
                  child: Icon(
                    Icons.search,
                    color: Color(0xFF878787),
                    size: 32,
                  ),
                ),
                onTap: () {
                  context.router.push(SearchScreenRoute());
                },
              ),
              SizedBox(
                width: 10.0,
              ),
              InkResponse(
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: auth.user.photoURL != null
                          ? NetworkImage(auth.user.photoURL!) as ImageProvider
                          : ExactAssetImage('assets/images/user.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                onTap: () {
                  // _scaffoldKey.currentState.openDrawer();
                  context.router.push(ProfileSettingScreenRoute());
                },
              )
            ],
          ),
          body: widget.body,
          drawer: widget.drawer != null ? widget.drawer : null,
          bottomNavigationBar: widget.footer != null ? widget.footer : null,
          floatingActionButtonLocation: widget.fabLocation != null
              ? widget.fabLocation
              : FloatingActionButtonLocation.endFloat,
          floatingActionButton: widget.fab != null ? widget.fab : null,
        ),
      ),
    );
  }
}
