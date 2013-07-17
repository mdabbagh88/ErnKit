#import "ERNBaseObservable.h"
#import "ERNErrorHandler.h"

@interface ERNBaseObservable ()
@property (nonatomic, readonly) NSNotificationCenter *notificationCenter;
@property (nonatomic, readonly) NSMapTable *observers;
@end

@implementation ERNBaseObservable {
    NSNotificationCenter *_notificationCenter;
    NSMapTable *_observers;
}

#pragma mark - public

-(void)notifyObservers
{
    [[self notificationCenter] postNotificationName:[self notificationName]
                                             object:self];
}
#pragma mark - ERNObservable

-(void)addObserver:(id<NSObject>)observer
          selector:(SEL)selector
{
    ERNCheckNilNoReturn(observer);
    ERNCheckNilNoReturn(selector);
    [[self observers] setObject:
     [[self notificationCenter] addObserverForName:[self notificationName]
                                           object:self
                                            queue:[NSOperationQueue currentQueue]
                                       usingBlock:^(__unused NSNotification *note) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                           [observer performSelector:selector];
#pragma clang diagnostic pop
                                       }]
                         forKey:observer];
}


-(void)removeObserver:(id)observer
{
    ERNCheckNilNoReturn(observer);
    [[self notificationCenter] removeObserver:[[self observers] objectForKey:observer]
                                         name:[self notificationName]
                                       object:self];
    [[self observers] removeObjectForKey:observer];
}

#pragma mark - private

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

#pragma mark - private - accessors

-(NSNotificationCenter *)notificationCenter
{
    return _notificationCenter = _notificationCenter ?
    _notificationCenter :
    [NSNotificationCenter new];
}

-(NSMapTable *)observers
{
    return _observers = _observers ? _observers : [NSMapTable strongToStrongObjectsMapTable];
}

@end
