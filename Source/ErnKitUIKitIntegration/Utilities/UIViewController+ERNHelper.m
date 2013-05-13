#import "UIViewController+ERNHelper.h"
#import <objc/runtime.h>

static NSString *ERN_addSubControllers = @"ERN_addSubControllers";

@implementation UIViewController (ERNHelper)

#pragma mark - public

-(void)ERN_addSubController:(id)subController
{
    NSMutableArray *array = [self ERN_getMutableSubControllers];
    array = array ? array : [NSMutableArray array];
    [array addObject:subController];
    [self ERN_setSubControllers:array];
}

-(void)ERN_setSubControllers:(NSMutableArray *)subControllers
{
    objc_setAssociatedObject(self,
                             &ERN_addSubControllers,
                             subControllers,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSArray *)ERN_getSubControllers
{
    return [self ERN_getMutableSubControllers];
}

#pragma mark - private

-(NSMutableArray *)ERN_getMutableSubControllers
{
    return objc_getAssociatedObject(self, &ERN_addSubControllers);
}

@end
