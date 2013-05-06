#import <UIKit/UIKit.h>
#import "ERNViewActionSheetTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewActionSheetTransitioner ()
@property (nonatomic, readonly) UIView *view;
@end

@implementation ERNViewActionSheetTransitioner {
}

#pragma mark - public - constructors

+(instancetype)transitionerWithView:(UIView *)view
{
    return [[self alloc] initWithView:view];
}

#pragma mark - ERNActionSheetTransitioner

-(void)transitionToActionSheet:(UIActionSheet *)actionSheet
{
    ERNCheckNilNoReturn([self view]);
    [actionSheet showInView:[self view]];
}

#pragma mark - private - initializers

-(id)initWithView:(UIView *)view
{
    self = [self init];
    ERNCheckNil(self);
    _view = view;
    return self;
}

@end
