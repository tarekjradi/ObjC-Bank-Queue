//
//  Clientes.m
//  FilaDoBanco
//
//  Created by Tarek Jradi on 08/07/13.
//  Copyright (c) 2013 DasDad. All rights reserved.
//

#import "Clientes.h"

@implementation Clientes

-(id)init{
    self.tempoAtendimento = [[Timer alloc] init];
    [self.tempoAtendimento startTimer];
    return self;
}

@end
