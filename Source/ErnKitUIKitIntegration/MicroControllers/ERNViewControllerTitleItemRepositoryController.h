#import <UIKit/UIKit.h>

@protocol ERNAsyncItemRepository;

@interface ERNViewControllerTitleItemRepositoryController : NSObject
+(instancetype)createWithViewController:(UIViewController *)viewController
                             repository:(id<ERNAsyncItemRepository>)repository;
@end
