#import "ERNBaseAsyncRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNBaseAsyncRepository ()
@property (nonatomic, readonly) NSNotificationCenter *notificationCenter;
@end

@implementation ERNBaseAsyncRepository

@synthesize notificationCenter = _notificationCenter;

-(NSNotificationCenter *)notificationCenter
{
    _notificationCenter = _notificationCenter ? _notificationCenter : [NSNotificationCenter defaultCenter];
    return _notificationCenter;
}

-(void)refresh
{
    [self notifyObservers];
}

-(void)notifyObservers
{
    [[self notificationCenter] postNotificationName:[self notificationName]
                                             object:self];
}

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    ERNCheckNil(observer);
    ERNCheckNil(selector);
    [[self notificationCenter] addObserver:observer
                                  selector:selector
                                      name:[self notificationName]
                                    object:self];
}

-(void)removeObserver:(id)observer
{
    ERNCheckNil(observer);
    [[self notificationCenter] removeObserver:observer
                                         name:[self notificationName]
                                       object:self];
}

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

@end
