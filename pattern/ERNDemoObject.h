#import <Foundation/Foundation.h>

@interface ERNDemoObject : NSObject
@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *info;
@property (nonatomic, readonly) NSURL *url;
+(instancetype)objectWithTitle:(NSString *)title
                          info:(NSString *)info
                           url:(NSURL *)url;
@end
