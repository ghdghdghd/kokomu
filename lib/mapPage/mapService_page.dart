import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:group_chat_app/services/database_service.dart';

class MapService extends StatefulWidget {
  final String groupId;
  final String userName;
  final String groupName;

  const MapService({
    required this.groupId,
    required this.userName,
    required this.groupName});
     // : super(key: key);

  @override
  _MapServiceState createState() => _MapServiceState();
}



class _MapServiceState extends State<MapService> with AutomaticKeepAliveClientMixin {



  // 애플리케이션에서 지도를 이동하기 위한 컨트롤러
  GoogleMapController? _controller;

  // 이 값은 지도가 시작될 때 첫 번째 위치입니다.
  final CameraPosition _initialPosition =
  CameraPosition(
      target: LatLng(37.520555375455, 127.11505129348),
      zoom: 15);

  // 지도 클릭 시 표시할 장소에 대한 마커 목록
  final List<Marker> markers = [];

  Future<Position> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return position;
  }

  addMarker(cordinate) {
    int id = Random().nextInt(1);

    setState(() {
      markers
          .add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }



  _locateMe() async {
    var gps = await getCurrentLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(gps.latitude, gps.longitude);
    print(placemarks[0].administrativeArea.toString());


    _controller?.animateCamera(
      CameraUpdate.newLatLngZoom(
          LatLng(gps.latitude, gps.longitude), 15)
    );

    print('여기 위도경도');
    print(gps.latitude);
    print(gps.latitude);

  }

  Future<List<Marker>> getmarkers() async {

    // List latLogi = List.generate(50, (i) => List.filled(2, null, growable: false));
    //latLogi = [[37.510555, 127.1150512],[37.510555, 127.1080512],[37.513555, 127.1000],[39.9035, 116.388],
    //                                    [35.68288, 139.76991],[35.684879, 139.508178],[35.720863, 139.293221],[35.00088, 138.99991],[35.436081, 139.103529],[37.404704734328, 127.10535530866]];


      var gps = await getCurrentLocation();
      List<Placemark> mCityInfo = await placemarkFromCoordinates(gps.latitude, gps.longitude); //좌표값으로 도시정보 가져오기
      var mCityArea = mCityInfo[0].administrativeArea.toString();                              //도시정보주에 administrativeArea값만 가져오기

      List latlogiArea = [];



    //위치 정보 가져오기
    List<dynamic> userInfo = await DatabaseService(uid: '').selectUserLatLong(mCityArea, widget.userName);
    print("여기보세요");
    print(userInfo);

    for(int y=0; y<userInfo.length; y++){
      List<Placemark> info = await placemarkFromCoordinates(userInfo[y][1], userInfo[y][2]);
      var CityArea = info[0].administrativeArea.toString();
      if(mCityArea == CityArea){
        latlogiArea.add([userInfo[y][0] , userInfo[y][1], userInfo[y][2]]);
      }
    };

    print(latlogiArea);

    if( latlogiArea != null) {   //현재 같은 도시에 있는 회원이 있다면  마커추가 폼을 반복문을 실행 한다
      markers.addAll([
        for(int a = 0; a < latlogiArea.length; a++)
          Marker(
            markerId: MarkerId('who${a}'),                           //마커 아이디
            position: LatLng(latlogiArea[a][1], latlogiArea[a][2]),  //마커의 위도경도
            infoWindow: InfoWindow(
              title: latlogiArea[a][0],                                  //마커 정보
              snippet: '',                                        //마커 정보 부제
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(             //마커 아이콘 색지정
                BitmapDescriptor.hueRose),

          )
      ]);
    }

    // if( latlogiArea != null) {   //현재 같은 도시에 있는 회원이 있다면  마커추가 폼을 반복문을 실행 한다
    //   markers.addAll([
    //     for(int a = 0; a < latlogiArea.length; a++)
    //       Marker(
    //         markerId: MarkerId('who${a}'),                           //마커 아이디
    //         position: LatLng(latlogiArea[a][0], latlogiArea[a][1]),  //마커의 위도경도
    //         infoWindow: InfoWindow(
    //           title: '회원${a + 1}',                                  //마커 정보
    //           snippet: '부제',                                        //마커 정보 부제
    //         ),
    //         icon: BitmapDescriptor.defaultMarkerWithHue(             //마커 아이콘 색지정
    //             BitmapDescriptor.hueRose),
    //
    //       )
    //
    //
    //   ]);
    // }

    setState(() {
      markers;
    });

    return markers;
  }

  Future<List<Marker>> getRestaurantMarkers() async {

    List foodLatLogi = List.generate(
        0, (i) => List.filled(3, null, growable: false));

    //List foodLatLogi = List.generate(50, (i) => List.filled(2, null, growable: false));
    foodLatLogi = [["카도식당", 37.516990, 127.112130],["산들해", 37.516833, 127.113083],["몽중헌 방이점", 37.516722, 127.113528],["토키야두번째이야기",37.516444, 127.113250],
                                       ["미미충무김밥", 37.515990, 127.112330],["어양", 37.516556, 127.113972],["버거킹", 37.516972, 127.112583],["가일", 37.515556, 127.113500], ["차고버거", 37.515500, 127.114000],["청치킨", 37.515361, 127.113194],["할머니포장마차", 37.51524, 127.11356] ];


   // List latlogiArea = [];
    print("foodLatLogifoodLatLogifoodLatLogifoodLatLogifoodLatLogi");
    print(foodLatLogi.length);

      //현재 같은 도시에 있는 회원이 있다면  마커추가 폼을 반복문을 실행 한다
      markers.addAll([
        for(int x = 0; x < foodLatLogi.length; x++)
          Marker(
            markerId: MarkerId('who${x}'),                           //마커 아이디
            position: LatLng(foodLatLogi[x][1], foodLatLogi[x][2]),  //마커의 위도경도
            infoWindow: InfoWindow(
              title: foodLatLogi[x][0],                                  //마커 정보
              snippet: '',                                        //마커 정보 부제
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(             //마커 아이콘 색지정
                BitmapDescriptor.hueGreen),

          )
      ]);

    setState(() {
      markers;
    });

    return markers;
  }


    List<Marker> getmarkerClear() {
      print("마커 삭제");
      markers.clear();

      setState(() {
        markers;
      });

      return  markers;
    }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("google map")
      // ),

        body: GoogleMap(
          myLocationEnabled: true,  //내위치 지도에 표시
          myLocationButtonEnabled: false,   //내위치 찾기 버튼
          initialCameraPosition: _initialPosition,  //지도 시작시 처음 보여지는 화면 값
          mapType: MapType.normal,  //표시할 지도 유형(일반,위성,하이브리드)
          onMapCreated: (controller) {    //맵생성
            setState(() {
              _controller = controller;
            });
          },
          markers: Set.from(markers),
          //markers.toSet(),

          //클릭한 위치가 중앙에 표시
          onTap: (cordinate) {
            _controller?.animateCamera(CameraUpdate.newLatLng(cordinate));
            addMarker(cordinate);
          },
        ),


        // floatingActionButton
      floatingActionButton: Stack(
        children: <Widget> [
          Align(
            alignment: Alignment(
                Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y),  //버튼 위치 지정
            child: FloatingActionButton.small(
              onPressed: () => _locateMe(),    //버튼 눌렀을때 동작 함수
              tooltip: '내위치',                //버튼동작 설명 툴팁
              child: Icon(
                Icons.my_location,             //버튼 아이콘 지정
                color: Colors.black,           //버튼 아이콘색 지정
              ),
              backgroundColor: Colors.white,   //버튼 배경색 지정
            ),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y - 0.2), //보튼 위치 지정
            child: FloatingActionButton.small(
              onPressed: () => getmarkers(),    //버튼 눌렀을때 동작 함수
              tooltip: '회원위치공유',            //버튼동작 설명 툴팁
              child: Icon(
                Icons.emoji_people,             //버튼 아이콘 지정
                color: Colors.black,            //버튼 아이콘색 지정
              ),
              backgroundColor: Colors.white,    //버튼 배경색 지정
            ),
          ),
          Align(
            alignment: Alignment(
                Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y - 0.4), //보튼 위치 지정
            child: FloatingActionButton.small(
              onPressed: () => getRestaurantMarkers(),    //버튼 눌렀을때 동작 함수
              tooltip: '근처 식당',            //버튼동작 설명 툴팁
              child: Icon(
                Icons.restaurant_menu
                ,             //버튼 아이콘 지정
                color: Colors.black,            //버튼 아이콘색 지정
              ),
              backgroundColor: Colors.white,    //버튼 배경색 지정
            ),
          ),
          // Align(
          //   alignment: Alignment(
          //       Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y - 0.6), //보튼 위치 지정
          //   child: FloatingActionButton.small(
          //
          //     onPressed: () => getmarkers(),    //버튼 눌렀을때 동작 함수
          //     tooltip: '근처 마트',            //버튼동작 설명 툴팁
          //     child: Icon(
          //       Icons.shopping_cart
          //       ,             //버튼 아이콘 지정
          //       color: Colors.black,            //버튼 아이콘색 지정
          //     ),
          //     backgroundColor: Colors.white,    //버튼 배경색 지정
          //   ),
          // ),
          Align(
            alignment: Alignment(
                Alignment.bottomLeft.x + 0.2, Alignment.bottomLeft.y - 0.6), //보튼 위치 지정
            child: FloatingActionButton.small(

              onPressed: () => getmarkerClear(),    //버튼 눌렀을때 동작 함수
              tooltip: '초기화',
              //icon: Icon(Icons.restart_alt),            //버튼동작 설명 툴팁
              child: Icon(
                Icons.restart_alt
                ,             //버튼 아이콘 지정
                color: Colors.black,            //버튼 아이콘색 지정
              ),
               backgroundColor: Colors.white,    //버튼 배경색 지정
            ),
          ),
        ],
      ),


    );
  }


}