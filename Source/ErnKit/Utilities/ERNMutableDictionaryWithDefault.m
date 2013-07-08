#import "ERNMutableDictionaryWithDefault.h"
#import "ERNErrorHandler.h"

@interface ERNMutableDictionaryWithDefault ()
@property (nonatomic, readonly) NSMutableDictionary *mutableDictionary;
@property (nonatomic, readonly) id defaultValue;
@end

@implementation ERNMutableDictionaryWithDefault {
}

#pragma mark - public - constructors

+(instancetype)createWithDefault:(id)defaultValue
{
    return [[self alloc] initWithDefault:defaultValue];
}

#pragma mark - NSDictionary

-(id)objectForKey:(id)key
{
    id object = [[self mutableDictionary] objectForKey:key];
    return object ? object : [self defaultValue];
}

-(NSUInteger)count
{
    return [[self mutableDictionary] count];
}

-(NSEnumerator *)keyEnumerator
{
    return [[self mutableDictionary] keyEnumerator];
}

-(id)initWithObjects:(NSArray *)objects
             forKeys:(NSArray *)keys
{
    self = [super init];
    ERNCheckNil(self);
    _defaultValue = nil;
    _mutableDictionary = [[NSMutableDictionary alloc] initWithObjects:objects
                                                              forKeys:keys];
    return self;
}

#pragma mark - NSMutableDictionary

-(void)setObject:(id)object
          forKey:(id<NSCopying>)key
{
    [[self mutableDictionary] setObject:object
                                 forKey:key];
}

-(void)removeObjectForKey:(id)key
{
    [[self mutableDictionary] removeObjectForKey:key];
}

#pragma mark - private - initializers

-(id)initWithDefault:(id)defaultValue
{
    self = [self initWithObjects:@[]
                         forKeys:@[]];
    ERNCheckNil(self);
    _defaultValue = defaultValue;
    return self;
}
@end
