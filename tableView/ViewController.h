//
//  ViewController.h
//  tableView
//
//  Created by JAY on 2015/9/18.
//  Copyright (c) 2015年 Huijun.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *sevenDaysBtn;

@property  (copy, nonatomic) NSMutableArray *greekLetters;
@property  (copy, nonatomic) NSArray *cityWeather;
@property  (nonatomic, retain) NSString *response;
@property  (nonatomic, strong) NSMutableArray * json;
@property  (nonatomic, strong) NSMutableArray * citiesArray;
@property (weak, nonatomic) IBOutlet UITableView *_tableView;
@property (weak, nonatomic) IBOutlet UITextField *cityText;

//@property (strong, nonatomic) NSMutableArray *json_array;

-(IBAction)sevedaysweatherBtn:(id)sender;


@end

