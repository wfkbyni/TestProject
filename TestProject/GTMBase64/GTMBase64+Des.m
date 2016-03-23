//
//  GTMBase64+Des.m
//  youqinghai
//
//  Created by 舒永超 on 16/3/20.
//  Copyright © 2016年 舒永超. All rights reserved.
//

#import "GTMBase64+Des.h"
#import "GTMBase64.h"

#define YQH_DEBUGMODEL @"eVfcMiA="
#define YQH_RELEASEMODEL @"swimQingHaiAPP="

static NSString *const DESEncrypt_Key     = YQH_DEBUGMODEL;

@implementation GTMBase64 (DES)

#pragma mark - AES

+ (NSString *)desEncrypt:(NSString *)plainText
{
    return [[self class] des:plainText
                      desKey:DESEncrypt_Key
                   operation:kCCEncrypt];
}

+ (NSString *)desDecrypt:(NSString *)encryptText
{
    return [[self class] des:encryptText
                      desKey:DESEncrypt_Key
                   operation:kCCDecrypt];
}

+ (NSString *)des:(NSString*)text
           desKey:(NSString *)desKey
        operation:(CCOperation)operation
{
    NSData* cipherData = [GTMBase64 decodeString:text];
    unsigned char buffer[[cipherData length]];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    
    Byte iv[] = {12, 22, 32, 43, 51, 64, 57, 98};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          [desKey UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          [cipherData length],
                                          &numBytesDecrypted);
    NSString* jsonString = nil;
    if (cryptStatus == kCCSuccess) {
        jsonString = [[NSString alloc] initWithBytes:buffer length:(NSUInteger)numBytesDecrypted encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end