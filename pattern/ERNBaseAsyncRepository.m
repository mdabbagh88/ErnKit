#import "ERNBaseAsyncRepository.h"

@interface ERNBaseAsyncRepository ()
@property (nonatomic, readonly) NSNotificationCenter *notificationCenter;
@end

@implementation ERNBaseAsyncRepository

-(void)notifyObservers
{
    [[self notificationCenter] postNotificationName:[self notificationName]
                                             object:self];
}

- (void)addObserver:(id)observer selector:(SEL)selector
{
    [[self notificationCenter] addObserver:observer
                                  selector:selector
                                      name:[self notificationName]
                                    object:self];
}

- (void)removeObserver:(id)observer
{
    [[self notificationCenter] removeObserver:observer
                                         name:[self notificationName]
                                       object:self];
}

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

-(id)init
{
    self = [super init];
    _notificationCenter = [NSNotificationCenter defaultCenter];
    return self;
}

@end
