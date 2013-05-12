#import "ERNActionSheetAction.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionSheetConfigurator.h"
#import "ERNErrorHandler.h"

@interface ERNActionSheetAction ()
@property (nonatomic, readonly) id<ERNActionSheetConfigurator> configurator;
@property (nonatomic, readonly) id<ERNActionSheetTransitioner> transitioner;
@end

@implementation ERNActionSheetAction {
}

#pragma mark - public - constructors

+(instancetype)createWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
                         configurator:(id<ERNActionSheetConfigurator>)configurator
{
    return [[self alloc] initWithTransitioner:transitioner
                                 configurator:configurator];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn([self configurator]);
    ERNCheckNilNoReturn([self transitioner]);
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(mime);
    [[self transitioner] transitionToActionSheet:
     [[self configurator] createActionSheetForUrl:url
                                             mime:mime]];
}

#pragma mark - private - initializers

-(id)initWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
             configurator:(id<ERNActionSheetConfigurator>)configurator
{
    self = [self init];
    ERNCheckNil(self);
    _configurator = configurator;
    _transitioner = transitioner;
    return self;
}

@end

