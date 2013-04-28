#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNArrayAsyncItemsRepository.h"
#import "ERNTableViewController.h"

@implementation ERNDemoSecondScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    return [self setupViewController:[ERNTableViewController
                                      viewControllerWithRepository:[ERNArrayAsyncItemsRepository
                                                                    asyncItemsRepositoryWithArray:@[
                                                                    @"second screen item",
                                                                    @"...and another one"]]
                                      cellFactory:[ERNNullTableViewCellFactory
                                                   tableViewCellFactory]]];
}

-(UIViewController *)setupViewController:(UITableViewController *)viewController
{
    [viewController setTitle:@"Second Screen"];
    return viewController;
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

@end
