#import "ERNActionSheetViewTransitioner.h"
#import "NSObject+ERNHelper.h"

@interface ERNActionSheetViewTransitioner ()
@property (nonatomic, readonly) UIView *view;
@end

@implementation ERNActionSheetViewTransitioner

-(void)transitionToActionSheet:(UIActionSheet *)actionSheet
{
    ERNCheckNil([self view]);
    [actionSheet showInView:[self view]];
}

-(id)initWithView:(UIView *)view
{
    self = [self init];
    ERNCheckNil(self);
    _view = view;
    return self;
}

+(instancetype)transitionerWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

@end
