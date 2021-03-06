#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import "ERNNullResource.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <RestKit/RestKit.h>

@interface ERNRestKitAsyncItemsRepository ()
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@property (nonatomic, readonly) ERNResource *resource;
@property (nonatomic, readonly) NSOperationQueue *operationQueue;
@property (nonatomic) NSOperation *currentOperation;
@end

@implementation ERNRestKitAsyncItemsRepository {
    ERNResource *_resource;
    NSOperationQueue *_operationQueue;
}

#pragma mark - public - constructors

+(instancetype)createWithResource:(ERNResource *)resource
               responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    return [[self alloc] initWithResource:resource
                       responseDescriptor:responseDescriptor];
}

#pragma mark - ERNAsyncItemsRepository

-(void)refresh
{
    if (![[self currentOperation] isExecuting]) {
        [self enqueueOperation];
    }
}

#pragma mark - NSObject

-(void)dealloc
{
    [_currentOperation cancel];
}

#pragma mark - private

-(void)enqueueOperation
{
    [self setCurrentOperation:[self setupCompletionForOperation:[self requestOperation]
                                        responseOperationsQueue:responseQueue()]];
    [[self operationQueue] addOperation:[self currentOperation]];

}

static NSOperationQueue *responseQueue(void)
{
    return [NSOperationQueue currentQueue];
}

-(RKObjectRequestOperation *)requestOperation
{
    return requestOperation([NSURLRequest requestWithURL:[[self resource] url]],
                            [self responseDescriptor]);
}

static RKObjectRequestOperation *requestOperation(NSURLRequest *request,
                                                  RKResponseDescriptor *responseDescriptor)
{
    return [[RKObjectRequestOperation alloc] initWithRequest:request
                                         responseDescriptors:@[responseDescriptor]];
}

-(RKObjectRequestOperation *)setupCompletionForOperation:(RKObjectRequestOperation *)operation
                                 responseOperationsQueue:(NSOperationQueue *)responseOperationQueue
{
    __weak ERNRestKitAsyncItemsRepository *blockSelf = self;

    [operation setCompletionBlockWithSuccess:
     ^(__unused RKObjectRequestOperation *completionOperation, RKMappingResult *mappingResult) {
         [responseOperationQueue addOperationWithBlock:
          ^(){
              ERNRestKitAsyncItemsRepository *localBlockSelf = blockSelf;
              [localBlockSelf refreshedWithItems:[mappingResult array]];
          }];
     }
                                     failure:
     ^(__unused RKObjectRequestOperation *completionOperation, NSError *error) {
         [responseOperationQueue addOperationWithBlock:
          ^(){
              ERNRestKitAsyncItemsRepository *localBlockSelf = blockSelf;
              [localBlockSelf refreshedWithError:error];
          }];
     }];
    return operation;
}

-(void)refreshedWithItems:(NSArray *)items
{
    [self setArray:items];
}

-(void)refreshedWithError:(NSError *)__unused error
{
    [self setArray:@[]];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(ERNResource *, resource, [ERNNullResource create])

ERNLazyLoadGetter(NSOperationQueue *, operationQueue, [NSOperationQueue new])

#pragma mark - private - initializers

-(id)initWithResource:(ERNResource *)resource
   responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    self = [super init];
    ERNCheckNil(self);
    _responseDescriptor = responseDescriptor;
    _resource = resource;
    return self;
}

@end
