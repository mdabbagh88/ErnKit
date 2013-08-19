#import "ERNHideNavigationBarOnUncaughtTapController.h"
#import "ERNErrorHandler.h"

@interface ERNHideNavigationBarOnUncaughtTapController ()
@property (nonatomic, readonly, weak) UIViewController *viewController;
@end

@implementation ERNHideNavigationBarOnUncaughtTapController {
}

#pragma mark - public - constructors

+(instancetype)createWithViewController:(UIViewController *)viewController
{
    return [[self alloc] initWithViewController:viewController];
}

#pragma mark - private

-(void)hideBars
{
    UIViewController *viewController = self.viewController;
    [viewController.navigationController setNavigationBarHidden:
     !viewController.navigationController.navigationBarHidden
                                                            animated:YES];
}

#pragma mark - private - initializers

-(id)initWithViewController:(UIViewController *)viewController
{
    self = [super init];
    ERNCheckNil(self);
    _viewController = viewController;
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc]
                                      initWithTarget:self action:@selector(hideBars)];
    [[[viewController view] gestureRecognizers]enumerateObjectsUsingBlock:
     ^(UIGestureRecognizer *recognizer, __unused NSUInteger index, __unused BOOL *stop) {
         [tapRecognizer requireGestureRecognizerToFail:recognizer];
     }];
    [viewController.view addGestureRecognizer:tapRecognizer];
    return self;
}

@end
