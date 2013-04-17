#import <Foundation/Foundation.h>

@protocol ERNAction <NSObject>
-(void)actionForUrl:(NSURL *)url
               mime:(NSString*)mime;
@end
