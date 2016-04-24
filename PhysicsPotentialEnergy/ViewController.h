//
//  ViewController.h
//  PhysicsPotentialEnergy
//
//  Created by austin crane on 4/24/16.
//  Copyright © 2016 Coffee House. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_weight;
@property (weak, nonatomic) IBOutlet UILabel *txt_output;

@end

