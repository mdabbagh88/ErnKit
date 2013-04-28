#import "ERNDemoApplicationConfigurator.h"
#import "ERNDemoFirstScreenConfigurator.h"
#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNDemoThirdScreenConfigurator.h"
#import "ERNDemoFourthScreenConfigurator.h"
#import "ERNNavigationViewControllerTransitioner.h"
#import "ERNViewControllerAction.h"
#import "ERNMimeRoutingAction.h"
#import "ERNExternalUrlAction.h"
#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNRoutingUrlMimeFactory.h"
#import "ERNURLUrlMimeFactory.h"
#import "ERNDemoObject.h"
#import "ERNDemoObject2.h"
#import "ERNNumberUrlMimeFactory.h"
#import "ERNStringUrlMimeFactory.h"
#import "ERNActionHandlerImpl.h"
#import "ERNArrayAsyncItemsRepository.h"

static NSArray *gArray;

@implementation ERNDemoApplicationConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    UINavigationController *navigationController = [[UINavigationController alloc] init];

    id<ERNViewControllerTransitioner> navigationTransitioner = [ERNNavigationViewControllerTransitioner transitionerWithNavigationController:navigationController];

    id<ERNAsyncItemsRepository> repository = [ERNArrayAsyncItemsRepository asyncItemsRepositoryWithArray:gArray];
    
    id<ERNViewControllerConfigurator> secondScreenConfigurator = [ERNDemoSecondScreenConfigurator configurator];
    id<ERNAction> secondAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:secondScreenConfigurator];

    ERNDemoThirdScreenConfigurator *thirdScreenConfigurator = [ERNDemoThirdScreenConfigurator configurator];
    id<ERNAction> thirdAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:thirdScreenConfigurator];

    ERNDemoFourthScreenConfigurator *fourthScreenConfigurator = [ERNDemoFourthScreenConfigurator configuratorWithRepository:repository];
    id<ERNAction> fourthAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:fourthScreenConfigurator];

    id<ERNAction> externalUrlAction = [ERNExternalUrlAction actionWithApplication:[UIApplication sharedApplication]];

    NSDictionary *mimeActionMappings = @{[ERNDemoObjectUrlMimeFactory mime]: externalUrlAction,
                                         [ERNURLUrlMimeFactory mime] : externalUrlAction,
                                         [ERNNumberUrlMimeFactory mime] : thirdAction,
                                         [ERNStringUrlMimeFactory mime] :fourthAction,
                                         @"": secondAction};

    id<ERNActionHandler> actionHandler = [self actionHandler:mimeActionMappings];

    [thirdScreenConfigurator setActionHandler:actionHandler];
    [fourthScreenConfigurator setActionHandler:actionHandler];
    id<ERNViewControllerConfigurator> firstScreenConfigurator = [ERNDemoFirstScreenConfigurator configuratorWithItemActionHandler:actionHandler
                                                                 repository:repository];
    id<ERNAction> firstAction = [ERNViewControllerAction actionWithTransitioner:navigationTransitioner
                                                                   configurator:firstScreenConfigurator];
    [firstAction actionForUrl:url
                         mime:mime];
    return navigationController;
}

-(id<ERNActionHandler>)actionHandler:(NSDictionary *)mimeActionMappings
{
    return [ERNActionHandlerImpl actionHandlerWithAction:[ERNMimeRoutingAction actionWithActionsForMimes:mimeActionMappings]
                                          urlMimeFactory:[self routingUrlMimeFactory]];
}

-(id<ERNUrlMimeFactory>)routingUrlMimeFactory
{
    return [ERNRoutingUrlMimeFactory urlMimeFactoryWithMappings:[self mimeUrlFactoryMappings]];
}

-(NSDictionary *)mimeUrlFactoryMappings
{
    return @{NSStringFromClass([ERNDemoObject class]) : [ERNDemoObjectUrlMimeFactory urlMimeFactory],
             NSStringFromClass([NSURL class]) : [ERNURLUrlMimeFactory urlMimeFactory],
             @"__NSCFNumber" : [ERNNumberUrlMimeFactory urlMimeFactory],
             @"__NSCFConstantString" : [ERNStringUrlMimeFactory urlMimeFactory]};
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

+(void)initialize
{
    gArray = @[
               [ERNDemoObject objectWithTitle:@"Ernstsson.net"
                                         info:@"Blog on software"
                                          url:[NSURL URLWithString:@"http://ernstsson.net"]
                                   coordinate:CLLocationCoordinate2DMake(51.5045, -0.0865)],
               @"String amongst demo objects",
               [ERNDemoObject doubleHeightObjectWithTitle:@"ThoughtWorks"
                                                     info:@"Software company"
                                                      url:[NSURL URLWithString:@"http://thoughtworks.com"]
                                               coordinate:CLLocationCoordinate2DMake(51.515731, -0.125307)],
               [NSURL URLWithString:@"http://bing.com"],
               [ERNDemoObject2 objectWithTitle:@"Location"
                                    coordinate:CLLocationCoordinate2DMake(51.50, -0.1)],
               @123,
               @YES,
               @1.3f,
               @[@"arrayitem1", @"arrayitem2"],
               @{@"key":@"value"}];
}

@end
