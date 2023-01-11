import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
Duration position = Duration.zero;
Duration duration = Duration.zero;
GlobalKey<FormState> loginKey = GlobalKey<FormState>();
int musicIndex = 0;
String password = "12345678", userPassword = "", username = "";
bool isLogin = false, intro = false;
List<Map<String,dynamic>> song = [
  {
    'name': 'Bandeya',
    'des': 'Arijit Singh',
    'path': 'build/song/bandeya.mp3',
    'image': 'build/song/bandeya.jpg',
    'height': 1.3,
    'play': false,
  },
  {
    'name': 'Dhun Lagi',
    'des': 'Sachin Jigar',
    'path': 'build/song/dhun.mp3',
    'image': 'build/song/dhun.jpg',
    'height': 1,
    'play': false,
  },
  {
    'name': 'Jaan Nisaar',
    'des': 'Arijit Singh',
    'path': 'build/song/jaan.mp3',
    'image': 'build/song/jaan.jpg',
    'height': 1.2,
    'play': false,
  },
  {
    'name': 'Kesariya',
    'des': 'Arijit Singh',
    'path': 'build/song/kesariya.mp3',
    'image': 'build/song/kesariya.jpg',
    'height': 1.5,
    'play': false,
  },
  {
    'name': 'Maan Meri Jaan',
    'des': 'King',
    'path': 'build/song/maan.mp3',
    'image': 'build/song/maan.jpg',
    'height': 1,
    'play': false,
  },
  {
    'name': 'Jingle Bell',
    'des': 'Yo Yo Honey Singh',
    'path': 'build/song/bell.mp3',
    'image': 'build/song/bell.jpg',
    'height': 1.2,
    'play': false,
  },
  {
    'name': 'Tu Aake Dekhle',
    'des': 'King',
    'path': 'build/song/dekhle.mp3',
    'image': 'build/song/dekhle.jpg',
    'height': 1.4,
    'play': false,
  },
  {
    'name': 'Kehndi Hundi Si',
    'des': 'Fazilpuria',
    'path': 'build/song/hundi.mp3',
    'image': 'build/song/hundi.jpg',
    'height': 1.2,
    'play': false,
  },
  {
    'name': 'Jhoome Jo Pathaan',
    'des': 'Arijit Singh',
    'path': 'build/song/jhoome.mp3',
    'image': 'build/song/jhoome.jpg',
    'height': 1.5,
    'play': false,
  },
  {
    'name': 'Oops',
    'des': 'King',
    'path': 'build/song/oops.mp3',
    'image': 'build/song/oops.jpg',
    'height': 1.4,
    'play': false,
  },
  {
    'name': 'Meethy Paan Di Galori',
    'des': 'Nooran Sisters',
    'path': 'build/song/paan.mp3',
    'image': 'build/song/paan.jpg',
    'height': 1.4,
    'play': false,
  },
  {
    'name': 'Apna Bana Le',
    'des': 'Arijit Singh',
    'path': 'build/song/sooraj.mp3',
    'image': 'build/song/sooraj.jpg',
    'height': 1.5,
    'play': false,
  },
];
List video = [
  {
    'image': 'https://i.vimeocdn.com/video/1563215409-c4b17e53882a74d06e9a0b8c9fe22de7e4773899a17b9c7554bd40d87237cce3-d_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/778907198/Christmas%20-%20141964.mp4?width=640&hash=85c931219de800ff2e651bf0e82b092b6f6cc1f4',
  },
  {
    'image': 'https://i.vimeocdn.com/video/1271763344-f891ebbcaa1456fda074e32457c1e1b975fa2048494bc92b0_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/629483574/Aurora%20Borealis%20-%2090877.mp4?width=960&hash=e3b680ed14a44dd77b91f4c628e775f546501865',
  },
  {
    'image': 'https://i.vimeocdn.com/video/1278052549-1ca5bb7344b9674770d53ce6061d5840c402618741745a536_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/635675488/Mountains%20-%2091545.mp4?width=1280&hash=583fb2d1b01533ce77d3febc67a34b076a8d2d76',
  },
  {
    'image': 'https://i.vimeocdn.com/video/1534871554-04395a9a937e020640cb9cf101527b1d647bfa4703fe35d55e9ccfc25a086f28-d_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/764361528/Ocean%20-%20135658.mp4?width=1280&hash=f64da4baec74c288939381fc4993230aa8589c80',
  },
  {
    'image': 'https://i.vimeocdn.com/video/1008844994-6476435f2dcb0ec69f4dd8fa355fb3eb11d86420d0b985ebf6b26e7916172ba7-d_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/487508532/Woman%20-%2058142.mp4?width=640&hash=0d04483bca070b3a8567ac4120a2af09038319ab',
  },
  {
    'image': 'https://i.vimeocdn.com/video/1279120270-b54608ac25c4d13ee159592a32ec7667545dcf4f5b88a6d00_640x360.jpg',
    'video': 'https://cdn.pixabay.com/vimeo/636709154/Skyscrapers%20-%2091744.mp4?width=1280&hash=85febefab25ea65c28efc2a65df07ac41c8a35c0',
  },
];
