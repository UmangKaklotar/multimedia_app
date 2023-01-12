import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:multimedia_app/video.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildSegment(String text) => Container(
    padding: const EdgeInsets.all(8),
    child: Text(text, style: const TextStyle(fontSize: 16,),),
  );
  int? groupValue = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF3F5751),
              Color(0xFF851C51),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 70),
            CupertinoSlidingSegmentedControl<int>(
              children: {
                0: buildSegment('Music'),
                1: buildSegment('Video'),
                2: buildSegment('Grid')
              },
              groupValue: groupValue,
              onValueChanged: (val){
                setState(() {
                  groupValue = val;
                });
              },
              padding: const EdgeInsets.all(3),
              backgroundColor: Colors.white12,
            ),
            Expanded(
              child: IndexedStack(
                index: groupValue,
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: song.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        onTap: () {
                          musicIndex = i;
                          Navigator.pushNamed(context, 'music');
                        },
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(song[i]['image']),
                        ),
                        title: Text(
                          song[i]['name'],
                          style: const TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 0.8,
                          ),
                        ),
                        subtitle: Text(
                          song[i]['des'],
                          style: const TextStyle(
                            color: Color(0xFFFFC2E0),
                            fontSize: 14,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if(song[i]['play'] == false) {
                              assetsAudioPlayer.open(
                                Audio('${song[i]['path']}'),
                                showNotification: true,
                              );
                            }
                            setState(() {
                              for(int no = 0 ; no < song.length ; no++) {
                                if(no == i) {
                                  continue;
                                }
                                else {
                                  song[no]['play'] = false;

                                }
                              }
                              song[i]['play'] = !song[i]['play'];
                              assetsAudioPlayer.playOrPause();
                            });
                          },
                          child: Icon(
                            song[i]['play'] == true
                                ? CupertinoIcons.stop_fill
                                : CupertinoIcons.play_arrow_solid,
                            color: CupertinoColors.white,
                            size: 25,
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: video.map((e) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, 
                                MaterialPageRoute(builder: (context) {
                                  return Video(videoIndex: video.indexOf(e),);
                                })
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 200,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(e['image'], fit: BoxFit.cover,),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          StaggeredGrid.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            children: song.map((e) {
                              return StaggeredGridTile.count(
                                crossAxisCellCount: 1,
                                mainAxisCellCount: e['height'],
                                child: GestureDetector(
                                  onTap: () {
                                    musicIndex = song.indexOf(e);
                                    Navigator.pushNamed(context, 'music');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(child: Image.asset(e['image'], fit: BoxFit.cover,),),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Text(e['name'],style: const TextStyle(fontWeight: FontWeight.bold),),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
