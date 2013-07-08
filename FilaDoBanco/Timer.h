//
//  Timer.h
//  FilaDoBanco
//
//  Created by Tarek Jradi on 08/07/13.
//  Copyright (c) 2013 DasDad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Timer : NSObject {
    NSDate *start;
    NSDate *end;
}

@property (nonatomic, strong) NSDate *dataInicial;

- (void)startTimer;
- (void)stopTimer;
- (double)timeElapsedInSeconds;
- (double)timeElapsedInMilliseconds;
- (double)timeElapsedInMinutes;
- (double) timeElapsedInSecondsTotal;

@end
