#import "UIViewController+ERNHelper.h"
#import <objc/runtime.h>

static NSString *ERN_addSubControllers = @"ERN_addSubControllers";

@implementation UIViewController (ERNHelper)

-(void)ERN_setSubControllers:(NSArray *)subControllers
{
    objc_setAssociatedObject(self,
                             &ERN_addSubControllers,
                             subControllers,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSArray *)ERN_getSubControllers
{
    return objc_getAssociatedObject(self, &ERN_addSubControllers);
}

@end
