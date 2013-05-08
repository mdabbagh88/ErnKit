#import "ERNDemoThirdScreenConfigurator.h"
#import "ERNTableViewController.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNDemoStringAsyncItemsRepository.h"

@implementation ERNDemoThirdScreenConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    return [self setupViewController:[ERNTableViewController createRefreshableWithRepository:[ERNDemoStringAsyncItemsRepository asyncItemsRepository]
                                                                                         cellFactory:[ERNNullTableViewCellFactory create]
                                                                                       actionHandler:[self actionHandler]]];
}

-(UIViewController *)setupViewController:(UITableViewController *)viewController
{
    [viewController setTitle:@"Third Screen"];
    return viewController;
}

+(instancetype)configurator
{
    return [self new];
}

@end
