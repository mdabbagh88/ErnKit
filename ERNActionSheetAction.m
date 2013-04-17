#import "ERNActionSheetAction.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionSheetConfigurator.h"

@interface ERNActionSheetAction ()
@property (nonatomic, readonly) id<ERNActionSheetConfigurator> configurator;
@property (nonatomic, readonly) id<ERNActionSheetTransitioner> transitioner;
@end

@implementation ERNActionSheetAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    UIActionSheet *actionSheet = [[self configurator] createActionSheetForUrl:url
                                                                         mime:mime];
    [self.transitioner transitionToActionSheet:actionSheet];
}

-(id)initWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
             configurator:(id<ERNActionSheetConfigurator>)configurator
{
    self = [super init];
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

