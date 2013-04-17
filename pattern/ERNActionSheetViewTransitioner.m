#import "ERNActionSheetViewTransitioner.h"

@interface ERNActionSheetViewTransitioner ()
@property (nonatomic, readonly) UIView *view;
@end

@implementation ERNActionSheetViewTransitioner

-(void)transitionToActionSheet:(UIActionSheet *)actionSheet
{
    [actionSheet showInView:[self view]];
}

-(id)initWithView:(UIView *)view
{
    self = [super init];
    _view = view;
    return self;
}

+(instancetype)transitionerWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

@end
