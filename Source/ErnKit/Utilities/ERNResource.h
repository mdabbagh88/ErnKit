#import <Foundation/Foundation.h>

@interface ERNResource : NSObject
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSString *mime;
+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime;
+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
                      object:(id<NSObject>)object;
@end
