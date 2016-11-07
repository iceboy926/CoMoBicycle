//
//  COBMView.m
//  CoMoBicycle
//
//  Created by 金玉衡 on 16/11/2.
//  Copyright © 2016年 AutoMo. All rights reserved.
//

#import "COBMCustomView.h"

#define MIN_DISTANCE  5.0

@interface COBMCustomView() <BMKLocationServiceDelegate, BMKMapViewDelegate>
{
    CLLocation *preLocation;
    BMKPolyline *polyLine;
}

@property (nonatomic, strong)BMKMapView *mapView;
@property (nonatomic, strong)BMKLocationService *locationService;
@property (nonatomic, strong)CLLocationManager *locationManager;
@property (nonatomic, strong)NSMutableArray *locationPointArray; //记录用户经过的点

@end

@implementation COBMCustomView

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.backgroundColor = backGroundColor;
        [self addSubview:self.mapView];
        [self addUIConstraints];
        [self startlocationService];
    }
    
    return self;
}

#pragma mark ui layout

- (void)addUIConstraints
{
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.bottom.equalTo(self);
        
    }];
}

#pragma mark init service
- (void)startlocationService
{
    if(ISIOS8)
    {
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    [self.locationService startUserLocationService];
  
}

#pragma mark lazy load

- (BMKMapView *)mapView
{
    if(_mapView == nil)
    {
        CGRect rect = CGRectMake(0, 0, MAX_WIDTH, MAX_HEIGHT-NavBarHeight);
        _mapView = [[BMKMapView alloc] initWithFrame:rect];
        
        _mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        _mapView.userTrackingMode = BMKUserTrackingModeFollow;
        _mapView.rotateEnabled = YES;
        
        [_mapView setZoomEnabled:YES];
        
        _mapView.zoomLevel = 15;
    }
    
    return _mapView;
}

- (BMKLocationService *)locationService
{
    if(_locationService == nil)
    {
        _locationService = [[BMKLocationService alloc] init];
        _locationService.delegate = self;
        
        [BMKLocationService setLocationDistanceFilter:6.0];
        [BMKLocationService setLocationDesiredAccuracy:kCLLocationAccuracyBest];
    }
    
    return _locationService;
}

- (CLLocationManager *)locationManager
{
    if(_locationManager == nil)
    {
        _locationManager = [[CLLocationManager alloc] init];
    }
    
    return _locationManager;
}

- (NSMutableArray *)locationPointArray
{
    if(_locationPointArray == nil)
    {
        _locationPointArray = [[NSMutableArray alloc] init];
    }
    
    return _locationPointArray;
}


#pragma mark custom function

- (void)drawUserRoutes
{
    NSInteger pointCount = [self.locationPointArray count];
    
    BMKMapPoint *mapPoints = new BMKMapPoint[pointCount];
    
    [self.locationPointArray enumerateObjectsUsingBlock:^(CLLocation *UserLocation, NSUInteger idx, BOOL * _Nonnull stop) {
        
        BMKMapPoint locationPoint = BMKMapPointForCoordinate(UserLocation.coordinate);
        
        mapPoints[idx] = locationPoint;
    }];
    
    polyLine = [BMKPolyline polylineWithPoints:mapPoints count:pointCount];
    
    if(polyLine)
    {
        [self.mapView addOverlay:polyLine];
    }
    
    if(mapPoints)
    {
        free(mapPoints);
        mapPoints = NULL;
    }
}


#pragma mark BMKLocationService Delegate

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [self.mapView updateLocationData:userLocation];
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    if(preLocation)
    {
        CGFloat distance = [userLocation.location distanceFromLocation:preLocation];
        if(distance < MIN_DISTANCE)
        {
            return ;
        }
    }
    
    [self.locationPointArray addObject:userLocation.location];
    
    preLocation = userLocation.location;
    
    [self.mapView updateLocationData:userLocation];
    
    [self drawUserRoutes];
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    
}


#pragma mark BMKViewDelegate

/**
 *根据overlay生成对应的View
 *@param mapView 地图View
 *@param overlay 指定的overlay
 *@return 生成的覆盖物View
 */
- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id <BMKOverlay>)overlay
{
    if([overlay isKindOfClass:[BMKPolyline class]])
    {
        BMKPolylineView *polyLineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
        polyLineView.strokeColor = [orangeViewColor colorWithAlphaComponent:0.5];
        polyLineView.fillColor = [orangeViewColor colorWithAlphaComponent:0.8];
        polyLineView.lineWidth = 5.0;
        
        return polyLineView;
    }
    else
    {
        return nil;
    }
}


@end
