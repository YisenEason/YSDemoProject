//
//  PersonModel.h
//  BaseProject
//
//  Created by eason yi on 2018/7/3.
//  Copyright © 2018年 eason. All rights reserved.
//

#import "BaseModel.h"
#import "Professional.h"

@interface PersonModel : BaseModel

@property(nonatomic,copy) NSString *sex;
@property(nonatomic,copy) NSString *name;
@property(nonatomic) NSNumber *age;
@property(nonatomic,copy) NSString *address;
@property(nonatomic) Professional *professionalModel;

@end
