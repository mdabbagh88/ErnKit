#import "ERNDemoApplicationConfigurator.h"
#import "ERNDemoFirstScreenConfigurator.h"
#import "ERNDemoSecondScreenConfigurator.h"
#import "ERNDemoThirdScreenConfigurator.h"
#import "ERNDemoFourthScreenConfigurator.h"
#import "ERNDemoFifthScreenConfigurator.h"
#import "ERNNavigationViewControllerTransitioner.h"
#import "ERNViewControllerAction.h"
#import "ERNMimeRoutingAction.h"
#import "ERNExternalUrlAction.h"
#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNDemoObject2UrlMimeFactory.h"
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
    return [self setupNavigationController:[self createNavigationController]
                                       url:url
                                      mime:mime];
}

-(UINavigationController *)createNavigationController
{
    return [[UINavigationController alloc] init];
}

-(UINavigationController *)setupNavigationController:(UINavigationController *)navigationController
                                                 url:(NSURL *)url
                                                mime:(NSString *)mime
{
    id<ERNViewControllerTransitioner> transitioner = [ERNNavigationViewControllerTransitioner transitionerWithNavigationController:navigationController];

    id<ERNAsyncItemsRepository> repository = [ERNArrayAsyncItemsRepository asyncItemsRepositoryWithArray:gArray];

    ERNDemoThirdScreenConfigurator *thirdScreenConfigurator = [ERNDemoThirdScreenConfigurator configurator];
    id<ERNAction> thirdAction = [ERNViewControllerAction actionWithTransitioner:transitioner
                                                                   configurator:thirdScreenConfigurator];

    ERNDemoFourthScreenConfigurator *fourthScreenConfigurator = [ERNDemoFourthScreenConfigurator configuratorWithRepository:repository];
    id<ERNAction> fourthAction = [ERNViewControllerAction actionWithTransitioner:transitioner
                                                                    configurator:fourthScreenConfigurator];

    id<ERNAction> externalUrlAction = [ERNExternalUrlAction actionWithApplication:[UIApplication sharedApplication]];

    NSDictionary *mimeActionMappings = @{[ERNDemoObjectUrlMimeFactory mime]: externalUrlAction,
                                         [ERNURLUrlMimeFactory mime] : externalUrlAction,
                                         [ERNNumberUrlMimeFactory mime] : thirdAction,
                                         [ERNStringUrlMimeFactory mime] :fourthAction,
                                         [ERNDemoObject2UrlMimeFactory mime] :[self createFifthAction:transitioner],
                                         @"": [self createSecondActionWithTransitioner:transitioner]};

    id<ERNActionHandler> actionHandler = [self actionHandler:mimeActionMappings];

    [thirdScreenConfigurator setActionHandler:actionHandler];
    [fourthScreenConfigurator setActionHandler:actionHandler];
    [self setupFirstAction:[self createFirstActionWithRepository:repository
                                                   actionHandler:actionHandler
                                                    transitioner:transitioner]
                       url:url
                      mime:mime];
    return navigationController;
}

-(id<ERNAction>)createFirstActionWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  actionHandler:(id<ERNActionHandler>)actionHandler
                                   transitioner:(id<ERNViewControllerTransitioner>)transitioner
{
    return [ERNViewControllerAction actionWithTransitioner:transitioner
                                              configurator:[ERNDemoFirstScreenConfigurator configuratorWithItemActionHandler:actionHandler
                                                                                                                  repository:repository]];
}

-(void)setupFirstAction:(id<ERNAction>)action
                    url:(NSURL *)url
                   mime:(NSString *)mime
{
    [action actionForUrl:url
                    mime:mime];
}

-(id<ERNAction>)createSecondActionWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
{
    return [ERNViewControllerAction actionWithTransitioner:transitioner
                                              configurator:[ERNDemoSecondScreenConfigurator configurator]];
}

- (id<ERNAction>)createFifthAction:(id<ERNViewControllerTransitioner>)transitioner
{
    return [ERNViewControllerAction actionWithTransitioner:transitioner
                                              configurator:[ERNDemoFifthScreenConfigurator configurator]];
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
             @"__NSCFConstantString" : [ERNStringUrlMimeFactory urlMimeFactory],
             NSStringFromClass([ERNDemoObject2 class]) : [ERNDemoObject2UrlMimeFactory urlMimeFactory]};
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
