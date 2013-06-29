#import <Foundation/Foundation.h>

@protocol ERNAsyncItemRepository;

@protocol ERNRepositoryStore <NSObject>
-(void)storeUrl:(NSURL *)url
        forItem:(id<NSObject>)item;
@end
