//
//  NSObject+LKUtils.m
//  LKDBHelper
//
//  Created by upin on 13-4-15.
//  Copyright (c) 2013年 ljh. All rights reserved.
//

#import "LKDBUtils.h"

@implementation LKDBUtils
+(NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}
+(NSString *)getDirectoryForDocuments:(NSString *)dir
{
    NSError* error;
    NSString* path = [[self getDocumentPath] stringByAppendingPathComponent:dir];
    
    if(![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;
}
+ (NSString *)getPathForDocuments:(NSString *)filename
{
    return [[self getDocumentPath] stringByAppendingPathComponent:filename];
}
+(NSString *)getPathForDocuments:(NSString *)filename inDir:(NSString *)dir
{
    return [[self getDirectoryForDocuments:dir] stringByAppendingPathComponent:filename];
}
+(BOOL)isFileExists:(NSString *)filepath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:filepath];
}


+(BOOL)checkStringIsEmpty:(NSString *)string
{
    if(string == nil)
    {
        return YES;
    }
    if([string isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    return [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString:@""];
}
+(NSString*)stringWithDate:(NSDate*)date
{
    NSDateFormatter* formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString* datestr = [formatter stringFromDate:date];
    return datestr;
}
+(NSDate *)dateWithString:(NSString *)str
{
    NSDateFormatter* formatter = [[[NSDateFormatter alloc]init] autorelease];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate* date = [formatter dateFromString:str];
    return date;
}
@end