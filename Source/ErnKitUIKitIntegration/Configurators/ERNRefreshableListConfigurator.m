#import "ERNRefreshableListConfigurator.h"

@interface ERNRefreshableListConfigurator ()
@property (nonatomic, readonly) id<ERNRepositoryFactory> repositoryFactory;
@property (nonatomic, readonly) id<ERNTableViewItemManager> itemManager;
@property (nonatomic, readonly) NSString *title;
@end

@implementation ERNRefreshableListConfigurator {
}

#pragma mark - public - constructors

+(instancetype)createWithItemManager:(id<ERNTableViewItemManager>)itemManager
                   repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                               title:(NSString *)title
{
    return [[self alloc] initWithItemManager:itemManager
                           repositoryFactory:repositoryFactory
                                       title:title];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>) __unused dismisser
{
    id<ERNAsyncPaginatedItemsRepository> repository =
    [[self repositoryFactory] paginatedItemsRepositoryForResource:resource];
    [repository refresh];

    return [self setupViewController:
            [ERNTableViewController createRefreshableWithRepository:repository
                                                        itemManager:[self itemManager]]];
}

#pragma mark - private

-(UIViewController *)setupViewController:(UIViewController *)viewController
{
    [viewController setTitle:[self title]];
    return viewController;
}

#pragma mark - private - initializers

-(id)initWithItemManager:(id<ERNTableViewItemManager>)itemManager
       repositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                   title:(NSString *)title
{
    self = [self init];
    ERNCheckNil(self);
    _repositoryFactory = repositoryFactory;
    _itemManager = itemManager;
    _title = title;
    return self;
}

@end
