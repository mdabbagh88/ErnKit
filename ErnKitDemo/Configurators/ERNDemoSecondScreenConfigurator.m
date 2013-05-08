#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNArrayAsyncItemsRepository.h"
#import "ERNTableViewController.h"

@implementation ERNDemoSecondScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    return [self setupViewController:[ERNTableViewController
                                      createWithRepository:[ERNArrayAsyncItemsRepository
                                                                    createWithArray:@[
                                                                    @"second screen item",
                                                                    @"...and another one"]]
                                      cellFactory:[ERNNullTableViewCellFactory
                                                   create]]];
}

-(UIViewController *)setupViewController:(UITableViewController *)viewController
{
    [viewController setTitle:@"Second Screen"];
    return viewController;
}

+(instancetype)configurator
{
    return [self new];
}

@end
