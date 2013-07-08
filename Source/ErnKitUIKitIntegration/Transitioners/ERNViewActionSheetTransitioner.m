#import <UIKit/UIKit.h>
#import "ERNViewActionSheetTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewActionSheetTransitioner ()
@property (nonatomic, readonly) UIView *view;
@end

@implementation ERNViewActionSheetTransitioner {
}

#pragma mark - public - constructors

+(instancetype)createWithView:(UIView *)view
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
    self = [super init];
    ERNCheckNil(self);
    _view = view;
    return self;
}

@end
