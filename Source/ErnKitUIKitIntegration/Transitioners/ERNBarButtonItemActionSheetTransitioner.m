#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionSheetTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNBarButtonItemActionSheetTransitioner ()
@property (nonatomic, readonly) UIBarButtonItem *barButtonItem;
@end

@implementation ERNBarButtonItemActionSheetTransitioner {
    UIBarButtonItem *_barButtonItem;
}

#pragma mark - public - constructors

+(instancetype)createWithBarButtonItem:(UIBarButtonItem *)barButtonItem;
{
    return [[self alloc] initWithBarButtonItem:barButtonItem];
}

#pragma mark - ERNActionSheetTransitioner

-(void)transitionToActionSheet:(UIActionSheet *)actionSheet
{
    [actionSheet showFromBarButtonItem:[self barButtonItem]
                              animated:YES];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(UIBarButtonItem *, barButtonItem, [UIBarButtonItem new])

#pragma mark - private - initializers

-(id)initWithBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self = [super init];
    ERNCheckNil(self);
    _barButtonItem = barButtonItem;
    return self;
}

@end
