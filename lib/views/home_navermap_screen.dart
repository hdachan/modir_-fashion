import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/modir.dart';
import '../utils/designSize.dart';
import '../viewmodels/map_viewmodel.dart';
import '../viewmodels/data_viewmodel.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  NaverMapController? _mapController;
  bool _showRefreshButton = false;
  String? _selectedMarkerTitle;

  // 마커를 클릭했을 때 뜨는 바텀시트
  void here(
      BuildContext context,
      String address,
      String roadAddress,
      String type,
      String title,
      double latitude,
      double longitude,
      int id,
      ) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: 360.w,
          height: 224.h,
          child: Column(
            children: [
              // 제목 영역
              Container(
                width: 360.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.w),
                    topRight: Radius.circular(25.w),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                child: Center(
                  child: Container(
                    width: 48.w,
                    height: 4.h,
                    color: Colors.white,
                  ),
                ),
              ),
              // 내용 영역
              Container(
                width: 360.w,
                height: 188.h,
                color: Color(0xFF1A1A1A),
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.h),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                      },
                      child: Container(
                        width: 328.w,
                        height: 104.h,
                        child: Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 100.h,
                              color: Colors.cyan,
                            ),
                            SizedBox(width: 12.w),
                            Container(
                              width: 216.w,
                              height: 104.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 216.w,
                                    height: 48.h,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 188.w,
                                          height: 48.h,
                                          child: Column(
                                            children: [
                                              Container(
                                                width: 188.w,
                                                height: 20.h,
                                                child: Text(
                                                  '$type',
                                                  style: TextStyle(
                                                    color: Color(0xFFE7E7E7),
                                                    fontSize: 14.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.40.h,
                                                    letterSpacing: -0.35,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 188.w,
                                                height: 28.h,
                                                child: Text(
                                                  '$title',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20.sp,
                                                    fontFamily: 'Pretendard',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.30.h,
                                                    letterSpacing: -0.50,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 28.w,
                                          height: 28.h,
                                          padding: EdgeInsets.all(2),
                                          child: IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              print("하트 버튼 클릭됨");
                                            },
                                            icon: Icon(
                                              Icons.favorite_outline,
                                              color: Colors.white,
                                              size: 24.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 216.w,
                                    height: 20.h,
                                    child: Text(
                                      '영업 중 · 20:00에 영업 종료',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 216.w,
                                    height: 20.h,
                                    child: Text(
                                      '렉토 · 벨리에 · UGG',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w600,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      width: 328.w,
                      height: 48.h,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              width: 265.w,
                              height: 48.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 265.w,
                                    height: 20.h,
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '추천  ·  ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                              height: 1.40,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '스트릿',
                                            style: TextStyle(
                                              color: Color(0xFF05FFF7),
                                              fontSize: 14.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w700,
                                              height: 1.40.h,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '을 선호하는 분들',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                              fontFamily: 'Pretendard',
                                              fontWeight: FontWeight.w500,
                                              height: 1.40.h,
                                              letterSpacing: -0.35,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Container(
                                    width: 265.w,
                                    height: 20.h,
                                    child: Text(
                                      '주소  ·  $address ',
                                      style: TextStyle(
                                        color: Color(0xFFD1D1D1),
                                        fontSize: 14.sp,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w500,
                                        height: 1.40.h,
                                        letterSpacing: -0.35,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              print("길찾기 버튼 클릭됨: $latitude, $longitude");
                            },
                            child: Container(
                              width: 55.w,
                              height: 33.h,
                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                              decoration: ShapeDecoration(
                                color: Color(0xFF3D3D3D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '길찾기',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                    height: 1.40.h,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Set<NAddableOverlay> _buildMarkersFromList(List<Modir> dataList) {
    return dataList.map<NAddableOverlay>((item) {
      final int id = item.id;
      final double latitude = item.latitude;
      final double longitude = item.longitude;
      final String title = item.title;

      // 추가 정보가 없다면 기본값 설정 (필요에 따라 Modir 모델 수정)
      final String address = '';
      final String roadAddress = '';
      final String type = '';

      // 선택된 마커면 on 이미지, 아니면 off 이미지 사용
      final String iconPath = (title == _selectedMarkerTitle)
          ? 'assets/image/maker_on.png'
          : 'assets/image/marker_off.png';

      final marker = NMarker(
        id: title,
        position: NLatLng(latitude, longitude),
        caption: NOverlayCaption(text: address),
        icon: NOverlayImage.fromAssetImage(iconPath),
        size: const Size(40, 40),
      );

      marker.setOnTapListener((overlay) {
        setState(() {
          _selectedMarkerTitle = title;
        });
        // DataViewModel로부터 데이터를 가져오기
        final dataProvider = Provider.of<DataViewModel>(context, listen: false);
        _updateMarkers(dataProvider, context);
        here(context, address, roadAddress, type, title, latitude, longitude, id);
      });

      return marker;
    }).toSet();
  }

  Future<void> _updateMarkers(DataViewModel dataProvider, BuildContext context) async {
    if (_mapController == null) return;

    try {
      // 현재 지도 영역(뷰포트) 가져오기
      final bounds = await _mapController!.getContentBounds();
      if (bounds == null) return;

      // 뷰포트 내에 있는 데이터만 필터링 (Modir 객체에 맞게 수정)
      final filteredData = dataProvider.dataList.where((modir) {
        final double lat = modir.latitude;
        final double lng = modir.longitude;
        return lat >= bounds.southWest.latitude &&
            lat <= bounds.northEast.latitude &&
            lng >= bounds.southWest.longitude &&
            lng <= bounds.northEast.longitude;
      }).toList();

      // 새로운 마커 생성
      final newMarkers = _buildMarkersFromList(filteredData);

      // 기존 마커 삭제 후 새로운 마커 추가
      _mapController!.clearOverlays();

      if (newMarkers.isEmpty) {
        _showCenteredSnackbar(context, "검색된 마커가 없습니다.");
      } else {
        _mapController!.addOverlayAll(newMarkers);
      }
    } catch (e) {
      print("마커 업데이트 중 오류 발생: $e");
    }
  }


  // 지도 새로고침 시 마커 없을 때 표시되는 스낵바
  void _showCenteredSnackbar(BuildContext context, String message) {
    OverlayEntry? overlayEntry;
    double opacity = 1.0;

    overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: AnimatedOpacity(
          opacity: opacity,
          duration: Duration(milliseconds: 500),
          child: Material(
            child: Container(
              width: 328.w,
              height: 64.h,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                color: Color(0xB2242424),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 40.h,
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Color(0xFF05FFF7),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 264.w,
                    height: 40.h,
                    child: Text(
                      '현재 지도에는 조건에 맞는 매장이 없어요\n지도 범위를 다시 설정해주세요',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 1.40.h,
                        letterSpacing: -0.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(overlayEntry);

    Future.delayed(const Duration(milliseconds: 1000), () async {
      opacity = 0.0;
      overlayEntry?.markNeedsBuild();
      await Future.delayed(const Duration(milliseconds: 1000));
      overlayEntry?.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Container(
                        width: ResponsiveUtils.getResponsiveWidth(360, 360, constraints),
                        height: 48.h,
                        padding: const EdgeInsets.only(top: 6, bottom: 6),
                        child: Container(
                          width: ResponsiveUtils.getResponsiveWidth(360, 360, constraints),
                          height: 36.h,
                          padding: const EdgeInsets.only(right: 16, left: 16),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  print("검색 클릭됨");
                                },
                                child: Container(
                                  width: ResponsiveUtils.getResponsiveWidth(284, 360, constraints),
                                  height: 36.h,
                                  padding: const EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFF3D3D3D),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: ResponsiveUtils.getResponsiveWidth(20, 360, constraints),
                                        height: 20.h,
                                        child:  Icon(
                                          Icons.search,
                                          color: Color(0xFF888888),
                                          size: 20.sp,
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Container(
                                        width: ResponsiveUtils.getResponsiveWidth(236, 360, constraints),
                                        height: 20.h,
                                        child:  Text(
                                          '매장, 위치 검색',
                                          style: TextStyle(
                                            color: Color(0xFF888888),
                                            fontSize: 14.sp,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            height: 1.40,
                                            letterSpacing: -0.35,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              InkWell(
                                onTap: () {
                                  print("필터 클릭됨");
                                },
                                child: Container(
                                  width: ResponsiveUtils.getResponsiveWidth(36, 360, constraints),
                                  height: 36.h,
                                  padding: const EdgeInsets.all(6),
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child:  Center(
                                    child: Icon(
                                      Icons.filter_list,
                                      size: 24.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  // 지도 영역
                  Container(
                    height: 600.h,
                    child: Consumer2<MapProvider, DataViewModel>(
                      builder: (context, mapProvider, dataProvider, child) {
                        return Stack(
                          children: [
                            NaverMap(
                              onMapReady: (controller) {
                                final mapProvider = Provider.of<MapProvider>(
                                    context,
                                    listen: false);
                                mapProvider.setMapController(controller);
                                _mapController = controller;
                                _updateMarkers(dataProvider, context);
                              },
                              // 카메라 이동 이벤트 (사용자 제스처 시 버튼 표시)
                              onCameraChange:
                                  (NCameraUpdateReason reason, bool animated) {
                                if (reason == NCameraUpdateReason.gesture) {
                                  if (!_showRefreshButton) {
                                    setState(() {
                                      _showRefreshButton = true;
                                    });
                                  }
                                }
                              },
                              options: const NaverMapViewOptions(
                                initialCameraPosition: NCameraPosition(
                                  target: NLatLng(36.1234229, 128.1146402),
                                  zoom: 15,
                                  bearing: 0,
                                  tilt: 0,
                                ),
                                logoAlign: NLogoAlign.rightTop,
                                logoMargin: EdgeInsets.only(top: 16, right: 16),
                              ),
                            ),
                            // 새로고침 버튼 (임시 구현)
                            if (_showRefreshButton)
                              Positioned(
                                top: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      // 🔹 버튼을 누르면 false로 설정하여 숨김
                                      setState(() {
                                        _showRefreshButton = false;
                                      });

                                      if (mounted) {
                                        setState(() {}); // UI 갱신 강제 적용
                                      }
                                      await Future.delayed(
                                          Duration(milliseconds: 100));
                                      // 현재 지도 화면 기준으로 마커 업데이트
                                      _updateMarkers(dataProvider, context);
                                    },
                                    child: Container(
                                      width: 141.w,
                                      height: 36.h,
                                      padding: EdgeInsets.only(
                                          left: 12,
                                          right: 16,
                                          top: 8,
                                          bottom: 8),
                                      decoration: ShapeDecoration(
                                        color: Color(0xB2242424),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0A000000),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20.w,
                                            height: 20.h,
                                            child: Center(
                                              child: Icon(
                                                Icons.refresh,
                                                color: Color(0xFF05FFF7),
                                                size: 20.sp,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 4.w),
                                          Container(
                                            width: 89.w,
                                            height: 20.h,
                                            child: Text(
                                              '현 지도에서 검색',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.sp,
                                                fontFamily: 'Pretendard',
                                                fontWeight: FontWeight.w700,
                                                height: 1.40.h,
                                                letterSpacing: -0.35,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
