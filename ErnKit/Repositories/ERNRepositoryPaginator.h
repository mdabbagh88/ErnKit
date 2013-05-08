#import <Foundation/Foundation.h>

@protocol ERNRepositoryPaginator <NSObject>
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) NSURL *nextPage;
@property (nonatomic, readonly) NSURL *previousPage;
@property (nonatomic, readonly) NSArray *items;
@end
