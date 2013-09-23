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
    __weak id<NSObject> weakObserver = observer;
    [[self observers] setObject:
     [[self notificationCenter] addObserverForName:[self notificationName]
                                           object:self
                                            queue:[NSOperationQueue currentQueue]
                                       usingBlock:^(__unused NSNotification *note) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                                           id<NSObject> blockObserver = weakObserver;
                                           [blockObserver performSelector:selector];
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

-(void)dealloc
{
    for (id observer in [self observers]) {
    [[self notificationCenter] removeObserver:observer
                                         name:[self notificationName]
                                       object:self];
    }
}

#pragma mark - private

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

#pragma mark - private - accessors

ERNLazyLoadGetter(NSNotificationCenter *, notificationCenter, [NSNotificationCenter new])

ERNLazyLoadGetter(NSMapTable *, observers, [NSMapTable weakToStrongObjectsMapTable])

@end
