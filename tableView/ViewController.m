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
    
    
    //self.greekLetters =@[@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei",@"Taipei"] ;

//[self retrieveData];

   // [self connAndLog];
   // NSLog(array[1]);
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
    //NSNumber* lon =[arrayCoord objectForKey:@"lon"];
    //NSNumber* leg =[arrayCoord objectForKey:@"leg"];
    
    CGFloat lon = [[arrayCoord objectForKey: @"lon"] floatValue];
    CGFloat lat = [[arrayCoord objectForKey: @"lat"] floatValue];
    
    
    //NSArray* outstring = [NSString stringWithFormat:@"%@", [NSNumber numberWithDouble:leg]];
    NSLog(@"lon=%f＾%f＾",lon,lat);
    //NSArray* stringLeg =[NSString stringWithFormat:@"leg=%f",leg];
    //NSArray* stringLon =[NSString stringWithFormat:@"lon=%f",lon];
    
    
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=London"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:15.0];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    if (connection) {
    //connect
        
        
       // NSLog(response);
    }else{
        NSLog(@"ERROE");
    //Error
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

*/

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
