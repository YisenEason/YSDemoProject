//
//  DataModel.h
//  BaseProject
//
//  Created by eason yi on 2018/10/9.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "BaseModel.h"

@interface ResponeModel : BaseModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *message;

@end
