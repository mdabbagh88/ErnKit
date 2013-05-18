#import "UIViewController+ERNHelper.h"
#import <objc/runtime.h>

static NSString *ERN_addMicroController = @"ERN_addMicroControllers";

@implementation UIViewController (ERNHelper)

#pragma mark - public

-(void)ERN_addMicroController:(id)microController
{
    NSMutableArray *array = [self ERN_getMutableMicroControllers];
    array = array ? array : [NSMutableArray array];
    [array addObject:microController];
    [self ERN_setMicroControllers:array];
}

-(NSArray *)ERN_getMicroControllers
{
    return [self ERN_getMutableMicroControllers];
}

#pragma mark - private

-(void)ERN_setMicroControllers:(NSMutableArray *)subControllers
{
    objc_setAssociatedObject(self,
                             &ERN_addMicroController,
                             subControllers,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray *)ERN_getMutableMicroControllers
{
    return objc_getAssociatedObject(self, &ERN_addMicroController);
}

@end
