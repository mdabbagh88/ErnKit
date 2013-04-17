#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewCellFactory.h"
#import "ERNAction.h"
#import "ERNUrlMimeFactory.h"

@interface ERNAsyncItemsRepositoryTableViewManager ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@property (nonatomic, readonly) id<ERNTableViewCellFactory>cellFactory;
@property (nonatomic, readonly) id<ERNAction>action;
@property (nonatomic, readonly) id<ERNUrlMimeFactory>urlMimeFactory;
@end

@implementation ERNAsyncItemsRepositoryTableViewManager

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    id<ERNUrlMimeFactory> urlMimeFactory = [self urlMimeFactory];
    id<ERNAction> action = [self action];
    id<NSObject> object = [[self repository] itemAtIndex:indexPath.row];
    NSURL *url  = [urlMimeFactory urlForObject:object];
    NSString *mime  = [urlMimeFactory mimeForObject:object];
    [action actionForUrl:url
                    mime:mime];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    id<NSObject> object = [[self repository] itemAtIndex:indexPath.row];
    return [[self cellFactory] cellForTableView:tableView
                                     fromObject:object];
}

-(NSInteger)sections
{
    return 1;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    id<ERNAsyncItemsRepository> repository = [self repository];
    NSInteger count = [repository count];
    return count;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                 action:(id<ERNAction>)action
         urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    self = [self initWithRepository:repository
                        cellFactory:cellFactory];
    _action = action;
    _urlMimeFactory = urlMimeFactory;
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    self = [super init];
    _repository = repository;
    _cellFactory = cellFactory;
    _action = nil;
    _urlMimeFactory = nil;
    return self;
}

+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                  action:(id<ERNAction>)action
                               urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory
                                     action:action
                             urlMimeFactory:urlMimeFactory];
}

+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory];
}
@end
