//
//  ViewController.m
//  tableView
//
//  Created by JAY on 2015/9/18.
//  Copyright (c) 2015年 Huijun.org. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "City.h"
#import "City.m"
@interface ViewController ()
{
    NSMutableArray * jsonData;
    NSMutableArray * dic;
}@end

@implementation ViewController
@synthesize response;

@synthesize json, citiesArray;


#define getdataURL @"http://api.openweathermap.org/data/2.5/forecast?id=524901"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.response;
    
    [self jsonParse];
    //[self tryJsonlistrow];
    
    
    
    
    //self.greekLetters =@[@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei"] ;

//[self retrieveData];

}


- (void)jsonParse{
    
    //set URL
    //NSString* path  = @"http://maps.googleapis.com/maps/api/geocode/json?address=nanjing&sensor=true";
    NSString* path  = @"http://api.openweathermap.org/data/2.5/weather?q=London%2Cuk";
    
    // url
    NSURL* url = [NSURL URLWithString:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //存到緩沖區
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    //自定解析，
   NSLog(@"%@", dic);
    NSArray* arrayName =[dic objectForKey:@"name"];
    NSArray* arrayid =[dic objectForKey:@"id"];
    NSDictionary* arrayCoord =[dic objectForKey:@"coord"];

    
    CGFloat lon = [[arrayCoord objectForKey: @"lon"] floatValue];
    CGFloat lat = [[arrayCoord objectForKey: @"lat"] floatValue];
    
    

    NSLog(@"lon=%f＾%f＾",lon,lat);

    
    
    NSArray* stringLat=[NSString stringWithFormat:@"%0.02f",lat];
    NSArray* stringLon=[NSString stringWithFormat:@"%0.02f",lon];
    
    
    NSMutableArray* arrayWeather = [dic objectForKey:@"weather"];
    //NSArray* main =[arrayWeather objectForKey:@"main"];
    NSLog(@"weather=%@",[arrayWeather objectAtIndex:0]);
    //[arrayWeather objectForKey:@“description”]
    NSString* weatherDescription =[[arrayWeather objectAtIndex:0] objectForKey:@"description"];
    //NSArray* weatherMain =[arrayWeather objectForKey:@"main"];
    //NSArray* stringMain =[NSString stringWithFormat:@"main=%@",main];
    //NSLog(@"Description=%@",weatherDescription);
    NSArray* stringDescription =[NSString stringWithFormat:@"Descripton=%@",weatherDescription];
    //NSLog(@"Description=%@",stringDescription);
    self.greekLetters = [[NSMutableArray alloc]initWithObjects:@"City List ",arrayName,stringLat,stringLon,weatherDescription,stringDescription,nil];
    // 宣告dictionary
    //NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                         // @"Title 01", @"title",
                         // @"Explain 01", @"explain",
                         // nil];
    
    // 將dict新增至array裡
    //[self.greekLetters addObject:dict];    //[self.greekLetters addObject:@"aa"];
    //[self.greekLetters addObject:@"bbb"];
    
    //@[@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei"] ;
    //[self.greekLetters addObject: arrayid];
    // self.greekLetters = [arrayName arrayByAddingObjectsFromArray:arrayid];
    
//    NSLog(@"Name= %@",arrayName);
//    NSLog(@"ID= %@",arrayid);


}

-(void)tryJsonlistrow
{
    NSString* path2  =[NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&mode=json&units=metric&cnt=7",self.cityText.text];
    
   // NSString* path2  = @"http://api.openweathermap.org/data/2.5/forecast/daily?q=London&mode=json&units=metric&cnt=7";
    
    // url
    NSURL* url2 = [NSURL URLWithString:path2];
    NSURLRequest* request2 = [NSURLRequest requestWithURL:url2];
    //存到緩沖區
    NSData* jsonData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    
    NSDictionary* dic2 = [NSJSONSerialization JSONObjectWithData:jsonData2 options:NSJSONReadingAllowFragments error:nil];
    //自定解析，
    NSLog(@"%@", dic2);
    NSArray* cod =[dic2 objectForKey:@"cod"];
    NSLog(@"cod=%@",cod);
    NSArray* listArray=[dic2 objectForKey:@"list"];
    //day1
    NSArray* day1 = [[listArray objectAtIndex:0] objectForKey:@"weather"];
    NSArray* day1main = [[day1 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription1 =[NSString stringWithFormat:@"Day1 weather=%@",day1main];
    NSLog(@"day1=%@",stringDayDescription1);
    //day2
    NSArray* day2 = [[listArray objectAtIndex:1] objectForKey:@"weather"];
    NSArray* day2main = [[day1 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription2 =[NSString stringWithFormat:@"Day2 weather=%@",day2main];
    NSLog(@"day2=%@",stringDayDescription2);
    //day3
    NSArray* day3 = [[listArray objectAtIndex:2] objectForKey:@"weather"];
    NSArray* day3main = [[day3 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription3 =[NSString stringWithFormat:@"Day3 weather=%@",day3main];
    NSLog(@"day3=%@",stringDayDescription3);
    //day4
    NSArray* day4 = [[listArray objectAtIndex:3] objectForKey:@"weather"];
    NSArray* day4main = [[day4 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription4 =[NSString stringWithFormat:@"Day4 weather=%@",day4main];
    NSLog(@"day4=%@",stringDayDescription4);
    //day5
    NSArray* day5 = [[listArray objectAtIndex:4] objectForKey:@"weather"];
    NSArray* day5main = [[day1 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription5 =[NSString stringWithFormat:@"Day5 weather=%@",day5main];
    NSLog(@"day5=%@",stringDayDescription5);
        NSLog(@"day5=%@",stringDayDescription5);
    //day6
    NSArray* day6 = [[listArray objectAtIndex:5] objectForKey:@"weather"];
    NSArray* day6main = [[day1 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription6 =[NSString stringWithFormat:@"Day2 weather=%@",day6main];
    NSLog(@"day1=%@",stringDayDescription6);
    //day7
    NSArray* day7 = [[listArray objectAtIndex:6] objectForKey:@"weather"];
    NSArray* day7main = [[day1 objectAtIndex:0] objectForKey:@"main"];
    NSArray* stringDayDescription7 =[NSString stringWithFormat:@"Day7 weather=%@",day7main];
    NSLog(@"day7=%@",stringDayDescription7);
    
    
    self.greekLetters = [[NSMutableArray alloc]initWithObjects:@"7 days weather ",stringDayDescription1,stringDayDescription2,stringDayDescription3,stringDayDescription4,stringDayDescription5,stringDayDescription6,stringDayDescription7,nil];
    
    [self._tableView reloadData];

}

-(IBAction)sevedaysweatherBtn:(id)sender
{
    [self.sevenDaysBtn setTitle:self.cityText.text
                       forState:UIControlStateNormal];
    [self tryJsonlistrow];
    



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)connectDidFinishLoad:(NSURLConnection *)connection {
    
    
    connection = nil;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.greekLetters count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *SimpleIdentifier =  @"SimpleIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:SimpleIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleIdentifier];
    }
  // cell.textLabel.text =self.greekLetters[indexPath.row];
    cell.textLabel.text =self.greekLetters[indexPath.row];
    //cell.textLabel.text = [[jsonData objectAtIndex:indexPath.row] objectForKey:@"deg"];
    //cell.detailTextLabel.text = [[jsonData objectAtIndex:indexPath.row] objectForKey:@"weather"];
    
    
    
    return cell;
    
}



@end
