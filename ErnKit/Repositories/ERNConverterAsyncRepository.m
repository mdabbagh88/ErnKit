#import "ERNConverterAsyncRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNConverterAsyncRepository ()
@property (nonatomic, readonly) id<ERNAsyncRepository>repository;
@end

@implementation ERNConverterAsyncRepository

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    ERNCheckNil(observer);
    ERNCheckNil(selector);
    [[self repository] addObserver:observer
                          selector:selector];
}

-(void)removeObserver:(id)observer
{
    ERNCheckNil(observer);
    [[self repository] removeObserver:observer];
}

-(void)refresh
{
    [[self repository] refresh];
}

-(id)initWithRepository:(id<ERNAsyncRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
