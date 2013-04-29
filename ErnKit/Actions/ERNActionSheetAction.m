#import "ERNActionSheetAction.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionSheetConfigurator.h"
#import "NSObject+ERNHelper.h"

@interface ERNActionSheetAction ()
@property (nonatomic, readonly) id<ERNActionSheetConfigurator> configurator;
@property (nonatomic, readonly) id<ERNActionSheetTransitioner> transitioner;
@end

@implementation ERNActionSheetAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNil([self configurator]);
    ERNCheckNil(url);
    ERNCheckNil(mime);
    [[self transitioner] transitionToActionSheet:[[self configurator] createActionSheetForUrl:url
                                                                                         mime:mime]];
}

-(id)initWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
             configurator:(id<ERNActionSheetConfigurator>)configurator
{
    self = [self init];
    ERNCheckNil(self);
    _configurator = configurator;
    _transitioner = transitioner;
    return self;
}

+(instancetype)actionWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
                         configurator:(id<ERNActionSheetConfigurator>)configurator
{
    return [[self alloc] initWithTransitioner:transitioner
                                 configurator:configurator];
}

@end

