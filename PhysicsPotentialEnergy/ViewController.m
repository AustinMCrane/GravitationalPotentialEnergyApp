//
//  ViewController.m
//  PhysicsPotentialEnergy
//
//  Created by austin crane on 4/24/16.
//  Copyright © 2016 Coffee House. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocationManager *location_manager;
    long calibrated_alt;
    long calibrated_weight;
    long calculated_alt;
    CLLocation *current_location;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  setup location manager so we can get our location data from the users device
    location_manager = [[CLLocationManager alloc] init];
    location_manager.delegate = self;
    location_manager.distanceFilter = kCLDistanceFilterNone;
    location_manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//        Ask for permission
        [location_manager requestWhenInUseAuthorization];
//    Start updating location
    [location_manager startUpdatingLocation];

    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
//    Get current location
    current_location = newLocation;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calibrate:(id)sender {
    NSLog(@"%@", self.txt_weight.text);
//    Set current altitude for calibartion
    calibrated_alt = current_location.altitude;
    calibrated_weight = self.txt_weight.text.longLongValue;
    
    
}


- (IBAction)calculate:(id)sender {
    calculated_alt = current_location.altitude;
//    Delta x
    long delta_alt = calculated_alt - calibrated_alt;
//    Little G for gravity
    long gravity = 9.81;
//    convert lbs to kg
    long weight_in_kg = calibrated_weight/2.2;
    long potential_energy = gravity * delta_alt * weight_in_kg;
    NSLog(@"delta_alt: %ld", delta_alt);
    NSLog(@"weight_in_kg: %ld", weight_in_kg);
    NSLog(@"potential energy %ld", potential_energy);
    dispatch_async(dispatch_get_main_queue(), ^{
//        Show output on screen
        self.txt_output.text = [NSString stringWithFormat:@"%ld N", potential_energy];
    });

    
}

@end
