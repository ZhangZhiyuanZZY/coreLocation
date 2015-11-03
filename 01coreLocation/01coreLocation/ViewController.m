//
//  ViewController.m
//  01coreLocation
//
//  Created by 章芝源 on 15/11/3.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface ViewController ()<CLLocationManagerDelegate>
///创建定位管理器
@property(nonatomic, strong)CLLocationManager *manager;
@end

@implementation ViewController

#pragma mark - lazy
- (CLLocationManager *)manager
{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
    }
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ///获取用户授权
    [self.manager requestAlwaysAuthorization];
    
    ///开始定位
    [self.manager startUpdatingLocation];
    
    ///设置代理
    self.manager.delegate = self;
    
    
    //设置属性
    /*
     //导航专用的精确度
     extern const CLLocationAccuracy kCLLocationAccuracyBestForNavigation __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_0);
     extern const CLLocationAccuracy kCLLocationAccuracyBest;
     extern const CLLocationAccuracy kCLLocationAccuracyNearestTenMeters;
     extern const CLLocationAccuracy kCLLocationAccuracyHundredMeters;
     extern const CLLocationAccuracy kCLLocationAccuracyKilometer;
     extern const CLLocationAccuracy kCLLocationAccuracyThreeKilometers;
     */
    //定位精确度     这个精度, 是专门用于是, 导航的
    //设置定位精度
    self.manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
//    CLLocation *loc1 = [[CLLocation alloc]initWithLatitude:40 longitude:116];
//    CLLocation *loc2 = [[CLLocation alloc]initWithLatitude:41 longitude:116];
//    
//    //计算两个位置之间的距离
//    CLLocationDistance dis = [loc1 distanceFromLocation:loc2];
//    NSLog(@"%f", dis);
}
/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */

///代理方法更新地理位置
#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations.firstObject;
    
    //CLLocationCoordinate2D是一个结构体存储着经纬度
    CLLocationCoordinate2D coordiate = location.coordinate;
    
    NSLog(@"%f      %f", coordiate.latitude, coordiate.latitude);
}







@end
