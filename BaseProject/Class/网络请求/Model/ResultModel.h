//
//  ResultModel.h
//  BaseProject
//
//  Created by eason yi on 2018/10/10.
//  Copyright © 2018年 eason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultData : BaseModel
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *category;
@end

@interface ResultModel : DataModel
@property (nonatomic, strong) ResultData *result;
@end


