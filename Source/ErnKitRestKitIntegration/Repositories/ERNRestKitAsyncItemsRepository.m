#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import "ERNResource.h"
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
        [self setCurrentOperation:[self setupCompletionForOperation:[self requestOperation]
                                            responseOperationsQueue:[self responseQueue]]];
        [[self operationQueue] addOperation:[self currentOperation]];
    }
}

#pragma mark - NSObject

-(void)dealloc
{
    [_currentOperation cancel];
}

#pragma mark - private

-(NSOperationQueue *)responseQueue
{
    return [NSOperationQueue currentQueue];
}

-(RKObjectRequestOperation *)requestOperation
{
    return [self requestOperationWithRequest:[NSURLRequest requestWithURL:[[self resource] url]]
                          responseDescriptor:[self responseDescriptor]];
}

-(RKObjectRequestOperation *)requestOperationWithRequest:(NSURLRequest *)request
                                      responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    return [[RKObjectRequestOperation alloc] initWithRequest:request
                                         responseDescriptors:@[responseDescriptor]];
}

-(RKObjectRequestOperation *)setupCompletionForOperation:(RKObjectRequestOperation *)operation
                                 responseOperationsQueue:(NSOperationQueue *)responseOperationQueue
{
    __weak ERNRestKitAsyncItemsRepository *blockSelf = self;

    [operation setCompletionBlockWithSuccess:
     ^(RKObjectRequestOperation *completionOperation, RKMappingResult *mappingResult) {
         [responseOperationQueue addOperationWithBlock:
          ^(){
              ERNRestKitAsyncItemsRepository *localBlockSelf = blockSelf;
              [localBlockSelf refreshedWithItems:[mappingResult array]];
          }];
     }
                                     failure:
     ^(RKObjectRequestOperation *completionOperation, NSError *error) {
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

-(void)refreshedWithError:(NSError *)error
{
    [self setArray:@[]];
}

#pragma mark - private - accessors

-(ERNResource *)resource
{
    return _resource = _resource ? _resource : [ERNResource createNull];
}

-(NSOperationQueue *)operationQueue
{
    return _operationQueue = _operationQueue ? _operationQueue : [NSOperationQueue new];
}

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
