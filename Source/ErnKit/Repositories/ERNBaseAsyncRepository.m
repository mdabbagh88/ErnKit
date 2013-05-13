#import "ERNBaseAsyncRepository.h"
#import "ERNErrorHandler.h"

@interface ERNBaseAsyncRepository ()
@property (nonatomic, readonly) NSNotificationCenter *notificationCenter;
@end

@implementation ERNBaseAsyncRepository {
    NSNotificationCenter *_notificationCenter;
}

#pragma mark - public

-(void)notifyObservers
{
    [[self notificationCenter] postNotificationName:[self notificationName]
                                             object:self];
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [self notifyObservers];
}

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    ERNCheckNilNoReturn(observer);
    ERNCheckNilNoReturn(selector);
    [[self notificationCenter] addObserver:observer
                                  selector:selector
                                      name:[self notificationName]
                                    object:self];
}

-(void)removeObserver:(id)observer
{
    ERNCheckNilNoReturn(observer);
    [[self notificationCenter] removeObserver:observer
                                         name:[self notificationName]
                                       object:self];
}

#pragma mark - private

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

#ifdef DEBUG
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter
{
    _notificationCenter = notificationCenter;
}
#endif

#pragma mark - private - accessors

-(NSNotificationCenter *)notificationCenter
{
    return _notificationCenter = _notificationCenter ?
    _notificationCenter :
    [NSNotificationCenter new];
}

@end
