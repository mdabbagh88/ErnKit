#import "ERNDictionaryWithDefault.h"
#import "ERNErrorHandler.h"

@interface ERNDictionaryWithDefault ()
@property (nonatomic, readonly) id defaultValue;
@property (nonatomic, readonly) NSDictionary *dictionary;
@end

@implementation ERNDictionaryWithDefault {
}

#pragma mark - public - constructors

+(instancetype)createWithDefault:(id)defaultValue
{
    return [[self alloc] initWithDefault:defaultValue];
}

#pragma mark - NSDictionary

-(id)objectForKey:(id)key
{
    id object = [[self dictionary] objectForKey:key];
    return object ? object : [self defaultValue];
}

-(NSUInteger)count
{
    return [[self dictionary] count];
}

-(NSEnumerator *)keyEnumerator
{
    return [[self dictionary] keyEnumerator];
}

-(id)initWithObjects:(NSArray *)objects
             forKeys:(NSArray *)keys
{
    self = [self init];
    ERNCheckNil(self);
    _defaultValue = nil;
    _dictionary = [[NSDictionary alloc] initWithObjects:objects
                                                forKeys:keys];
    return self;
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
