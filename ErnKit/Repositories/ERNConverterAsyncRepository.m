#import "ERNConverterAsyncRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNConverterAsyncRepository ()
@property (nonatomic, readonly) id<ERNAsyncRepository>repository;
@end

@implementation ERNConverterAsyncRepository

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    [[self repository] addObserver:observer
                          selector:selector];
}

-(void)removeObserver:(id)observer
{
    [self removeObserver:observer];
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
