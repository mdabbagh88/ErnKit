#import <Foundation/Foundation.h>

@protocol ERNRepositoryPaginator <NSObject>
@property (nonatomic, readonly) NSUInteger total;
@property (nonatomic, readonly) NSURL *nextPage;
@property (nonatomic, readonly) NSURL *previousPage;
@property (nonatomic, readonly) NSArray *items;
@end
