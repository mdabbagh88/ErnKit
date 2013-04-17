#import "ERNDemoApplicationConfigurator.h"
#import "ERNDemoFirstScreenConfigurator.h"
#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNRoutingTableViewManager.h"
#import "ERNNavigationViewControllerTransitioner.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNViewControllerAction.h"
#import "ERNMimeRoutingAction.h"
#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNExternalUrlAction.h"
#import "ERNRoutingUrlMimeFactory.h"
#import "ERNDemoObject.h"

@implementation ERNDemoApplicationConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];


    id<ERNViewControllerTransitioner> navigationTransitioner = [ERNNavigationViewControllerTransitioner transitionerWithNavigationController:navigationController];

    NSDictionary *urlMimeFactoryMappings = @{NSStringFromClass([ERNDemoObject class]) : [ERNDemoObjectUrlMimeFactory urlMimeFactory]};
    id<ERNUrlMimeFactory> urlMimeFactory = [ERNRoutingUrlMimeFactory urlMimeFactoryWithMappings:urlMimeFactoryMappings];

    id<ERNViewControllerConfigurator> secondScreenConfigurator = [ERNDemoSecondScreenConfigurator configurator];
    id<ERNAction> secondAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:secondScreenConfigurator];
    NSDictionary *mimeMapping = @{[ERNDemoObjectUrlMimeFactory mime]: [ERNExternalUrlAction actionWithApplication:[UIApplication sharedApplication]],
                                  @"": secondAction};
    id<ERNAction> routingAction = [ERNMimeRoutingAction actionWithActionsForMimes:mimeMapping];
    id<ERNViewControllerConfigurator> firstScreenConfigurator = [ERNDemoFirstScreenConfigurator configuratorWithItemAction:routingAction
                                                                                                            urlMimeFactory:urlMimeFactory];
    id<ERNAction> firstAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:firstScreenConfigurator];
    [firstAction actionForUrl:url
                         mime:mime];
    return navigationController;
}

- (id)init
{
    self = [super init];
    return self;
}

+ (instancetype)configurator
{
    return [[self alloc] init];
}

@end
