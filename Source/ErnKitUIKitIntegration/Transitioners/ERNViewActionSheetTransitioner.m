#import <UIKit/UIKit.h>
#import "ERNViewActionSheetTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewActionSheetTransitioner ()
@property (nonatomic, readonly) UIView *view;
@end

@implementation ERNViewActionSheetTransitioner {
    UIView *_view;
}

#pragma mark - public - constructors

+(instancetype)createWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

#pragma mark - ERNActionSheetTransitioner

-(void)transitionToActionSheet:(UIActionSheet *)actionSheet
{
    [actionSheet showInView:[self view]];
}

#pragma mark - accessors

ERNLazyLoadGetter(UIView *, view, [UIView new])

#pragma mark - private - initializers

-(id)initWithView:(UIView *)view
{
    self = [super init];
    ERNCheckNil(self);
    _view = view;
    return self;
}

@end
