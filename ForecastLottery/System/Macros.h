//
//  Macros.h
//  ForecastLottery
//
//  Created by Mrr on 16/4/6.
//  Copyright © 2016年 llisent. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

/** UIColor*/
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]


/** UIScreen*/
#define ScreenBonds [UIScreen mainScreen].bounds
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height


#define TICK   NSDate *startTime = [NSDate date];
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);

#endif /* Macros_h */
