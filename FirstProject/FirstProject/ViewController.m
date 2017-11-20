//
//  ViewController.m
//  FirstProject
//
//  Created by 徐亚辉 on 2017/10/23.
//  Copyright © 2017年 XH. All rights reserved.
//

#import "ViewController.h"
#import "FirstCell.h"
#import "FirstModel.h"
#import <AFNetworking.h>
#import "SecondController.h"
#import <UMengUShare/UMSocialSmsHandler.h>
#import <UShareUI/UShareUI.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak)UITableView * tableV;
@property (nonatomic, strong)NSArray * dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[FirstModel alloc]init];
    
//NSUserDefaults 无法识别Null 类型
//    NSNull * null1 = [NSNull null];
//    NSDictionary * dict = @{@"":@"123",@"444":null1};
//    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"key"];
    
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationItem.title = @"123123";
    self.navigationItem.title = @"234234";
    
    //
    UIImage * imageblack = [self imageWithColor:[UIColor blackColor]];
    
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"left" style:UIBarButtonItemStyleDone target:self action:@selector(leftButtonClicked)];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithImage:imageblack style:UIBarButtonItemStyleDone target:self action:@selector(rightButtonClicked)];

    
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    view.backgroundColor = [UIColor brownColor];
    view.clipsToBounds = YES;
    view.layer.cornerRadius = 5;
    
    self.navigationItem.titleView = view;
    
    UIImage * backgroundImage = [self imageWithColor:[UIColor whiteColor]];
    
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage  forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:25]}];
    
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
//    UIWebView * webview = [[UIWebView alloc]initWithFrame:CGRectMake(00, 0, 320, 480)];
//    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.sina.com"]];
//    [webview loadRequest:request];
//    [self.view addSubview:webview];
    
    
//    UITableView * tableV = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    tableV.delegate = self;
//    tableV.dataSource = self;
//    self.tableV = tableV;
//    [self.view addSubview:tableV];
    [self sendNetwrokRequest];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)leftButtonClicked{
    NSLog(@"leftButtonClicked");
}
-(void)rightButtonClicked{
    NSLog(@"rightButtonClicked");
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   static NSString * ident = @"ViewControllerCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    FirstModel * model = self.dataArray[indexPath.row];
    cell.textLabel.text =@"";
    return cell;
    
}
-(void)sendNetwrokRequest{
//    NSString *url = [@"https://news-at.zhihu.com/api/7/" stringByAppendingString:@"stories/latest"];
//    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]
//                                                       cachePolicy: NSURLRequestReloadIgnoringCacheData
//                                                   timeoutInterval:30.f];
//
//    [req setValue:@"daily/201607251035 CFNetwork/808.2.16 Darwin/16.3.0" forHTTPHeaderField:@"User-Agent"];
//    [req setValue:@"Bearer fZTTlAT2QvKUoWNVvLlZNA" forHTTPHeaderField:@"Authorization"];
//
//    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//        if (httpResponse.statusCode == 200) {
//            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//            NSLog(@"%@====",jsonDic);
//
//            }else {
//                           }
//
//            }];
//    [task resume];

    
    
    
    
    
    
    AFHTTPSessionManager * manger = [AFHTTPSessionManager manager];
//    manger.securityPolicy.allowInvalidCertificates = YES;
    manger.requestSerializer = [AFHTTPRequestSerializer serializer];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//https://stackoverflow.com/users/login?ssrc=head&returnurl=https%3a%2f%2fstackoverflow.com%2fquestions%2f30299826%2fafnetworking-issue-nserrorfailingurlkey-url-nslocalizeddescription-request-fai
//    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
//
//
//http://13.1.18.147:9081/portal/loginpre.do?_locale=zh_CN&BankId=9999&LoginType=P
//
    manger.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", @"text/plain", nil];
    
    
//    [CSIIBusinessContext sharedInstance].PublicArgument=[NSMutableDictionary dictionaryWithObjectsAndKeys:@"zh_CN",@"_locale",@"PMBS",@"_ChannelId",@"9999",@"BankId", nil];

    
    NSMutableDictionary *postDic = [[NSMutableDictionary alloc] init];
    [postDic setObject:@"zh_CN" forKey:@"_locale"];
    [postDic setObject:@"PMBS" forKey:@"_ChannelId"];
    [postDic setObject:@"9999" forKey:@"BankId"];
    [manger.requestSerializer setValue:@"" forHTTPHeaderField:@"If-None-Match"];

    NSString * urlStr = @"http://13.1.18.147:9081/portal/HighYieldFinListQryForLogin.do";
    [manger.requestSerializer requestWithMethod:@"POST" URLString:urlStr parameters:postDic error:nil];

    [manger POST:urlStr parameters:postDic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject === %@",responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error === %@",error.userInfo);
    }];
//    urlStr = @"http://13.1.18.147:9081/portal/loginpre.do?_locale=zh_CN&BankId=9999&LoginType=P";
//    [manger GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"====%@",responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"%@",error.userInfo);
//    }];
//
//    [manger GET:@"https://www.weather.com.cn" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//            NSLog(@"====%@",responseObject);
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        NSLog(@"guile");
//    }];

}
#pragma mark 浅拷贝 深拷贝
-(void)testCopy{
    //    NSString * str1 = @"123123";
    //    NSString * str2 = [str1 copy];
    //    NSString * str3 = [str1 mutableCopy];
    ////    NSLog(@"str1=%p\n,str2=%p\n,str3=%p\n",str1,str2,str3);
    ////    NSLog(@"%@--%@--%@",str1,str2,str3);
    ////结论： 对于NSString  copy是浅拷贝   mutableCopy是深拷贝
    //    NSMutableString * str4 = [NSMutableString stringWithFormat:@"456456"];
    //    NSMutableString * str5 = [str4 copy];
    //    NSMutableString * str6 = [str4 mutableCopy];
    //    NSLog(@"str4=%p\n,str5=%p\n,str6=%p\n",str4,str5,str6);
    //    NSLog(@"%@--%@--%@",str4,str5,str6);
    ////结论： 对于NSMutableString  copy是深拷贝   mutableCopy是深拷贝
    //
    //    NSArray * array1 = @[@"123",@"456"];
    //    NSArray * array2 = [array1 copy];
    //    NSArray * array3 = [array1 mutableCopy];
    //    NSLog(@"array1=%p\n,array1=%p\n,array1=%p\n",array1,array2,array3);
    //    NSLog(@"%@--%@--%@",array1,array2,array3);
    ////结论： 对于NSArray  copy是浅拷贝   mutableCopy是深拷贝
    //
    //    NSMutableArray * array4 = [NSMutableArray arrayWithArray:@[@"123",@"456"]];
    //    NSMutableArray * array5 = [array4 copy];
    //    NSMutableArray * array6 = [array4 mutableCopy];
    //    NSLog(@"array4=%p\n,array5=%p\n,array6=%p\n",array4,array5,array6);
    //    NSLog(@"%@--%@--%@",array4,array5,array6);
    ////结论： 对于NSMutableArray  copy是浅拷贝   mutableCopy是深拷贝
    //    NSDictionary * dic1 = @{@"key1":@"value1",@"key2":@"value2"};
    //    NSDictionary * dic2 = [dic1 copy];
    //    NSDictionary * dic3 = [dic1 mutableCopy];
    //    NSLog(@"dic1=%p\n,dic2=%p\n,dic3=%p\n",dic1,dic2,dic3);
    //    NSLog(@"%@--%@--%@",dic1,dic2,dic3);
    ////结论： 对于NSDictionary  copy是浅拷贝   mutableCopy是深拷贝
    //    NSMutableDictionary * dic4 = [NSMutableDictionary dictionaryWithDictionary:@{@"key3":@"value3",@"key4":@"value4"}] ;
    //    NSDictionary * dic5 = [dic4 copy];
    //    NSDictionary * dic6 = [dic4 mutableCopy];
    //    NSLog(@"dic4=%p\n,dic5=%p\n,dic6=%p\n",dic4,dic5,dic6);
    //    NSLog(@"%@--%@--%@",dic4,dic5,dic6);
    ////结论： 对于NSMutableDictionary  copy是深拷贝   mutableCopy是深拷贝
    //above all  对于可变类型     copy是深拷贝  mutableCopy是深拷贝
    //           对于不可变类型   copy是浅拷贝   mutableCopy是深拷贝

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 20.0f, 24.0f); //宽高 1.0只要有值就够了
    UIGraphicsBeginImageContext(rect.size); //在这个范围内开启一段上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);//在这段上下文中获取到颜色UIColor
    CGContextFillRect(context, rect);//用这个颜色填充这个上下文
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//从这段上下文中获取Image属性,,,结束
    UIGraphicsEndImageContext();
    
    return image;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testNoti];
    return;
//    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 根据获取的platformType确定所选平台进行下一步操作
        if (platformType == UMSocialPlatformType_Sms) {
            NSLog(@"231231231");
            UMSocialMessageObject * msgObj = [[UMSocialMessageObject alloc] init];
            
            
            
            msgObj.text = @"我想分享一个网址链接：https://www.baidu.com，请使用浏览器打开。";
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sms messageObject:msgObj currentViewController:self completion:^(id result, NSError *error) {
                NSLog(@"succeed,oh");
            }];

        }
        if (platformType == UMSocialPlatformType_Sina) {
            NSLog(@"545454545");
            UMSocialMessageObject * msgObj = [[UMSocialMessageObject alloc] init];
            UMShareImageObject *shareObj = [[UMShareImageObject alloc] init];
            shareObj.thumbImage = [UIImage imageNamed:@"TEST"];
            shareObj.shareImage = [UIImage imageNamed:@"TEST"];
            msgObj.shareObject = shareObj;
            msgObj.text = @"2321312312312312";
            [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:msgObj currentViewController:self completion:^(id result, NSError *error) {
                NSLog(@"succeed,oh");
            }];

        }
    }];
    return;
    
//    SecondController * secondVC = [[SecondController alloc]init];
//    [self.navigationController pushViewController:secondVC animated:YES];
    

    
    
    
//    UMSocialMessageObject * msgObj = [UMSocialMessageObject messageObjectWithMediaObject:@"12321312"];
}

-(void)testNoti{
    
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
        
        notification.alertTitle = @"推送";
        
        notification.alertBody = @"推送内容";
        
        notification.category = @"foregroundAction";
    
//        notification.identifier
    
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
    
}
@end
