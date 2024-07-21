import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterspotifycloneapp/common/helpers/is_dark_mode.dart';
import 'package:flutterspotifycloneapp/common/widgets/appBar/app_bar.dart';
import 'package:flutterspotifycloneapp/core/configs/assets/app_images.dart';
import 'package:flutterspotifycloneapp/core/configs/assets/app_vectors.dart';
import 'package:flutterspotifycloneapp/core/configs/theme/app_colors.dart';
import 'package:flutterspotifycloneapp/presentation/home/widgets/news_songs.dart';
import 'package:flutterspotifycloneapp/presentation/home/widgets/play_list.dart';
import 'package:flutterspotifycloneapp/presentation/profile/pages/profile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        action: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => const ProfilePage())
            );
          },
          icon: const Icon(
            Icons.person
          ),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),

            _tabs(),

            SizedBox(
              height: 260,
              child: TabBarView(
                controller: _tabController,
                children: [
                  const NewsSongs(),

                  Container(),

                  Container(),

                  Container(),
                ]
              ),
            ),

            const PlayList(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard(){
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                  AppVectors.homeTopCard
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 60
                ),
                child: Image.asset(
                    AppImages.homeArtist
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40,
      ),
      tabs: [
        const Text(
          'News',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),

        const Text(
          'Videos',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),

        const Text(
          'Artists',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),

        const Text(
          'Podcasts',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),
      ]
    );
  }
}
