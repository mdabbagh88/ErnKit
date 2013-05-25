#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"
#import <RestKit/RestKit.h>

@interface ERNRestKitAsyncItemsRepository ()
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@property (nonatomic, readonly) NSURL *url;
@property (nonatomic, readonly) NSOperationQueue *operationQueue;
@property (nonatomic) NSOperation *currentOperation;
@property (nonatomic) NSError *lastError;
@end

@implementation ERNRestKitAsyncItemsRepository {
    NSURL *_url;
    NSOperationQueue *_operationQueue;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
          responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    return [[self alloc] initWithUrl:url
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

-(NSOperationQueue *)createOperationQueue
{
    return [self setupOperationQueue:[NSOperationQueue new]];
}

-(NSOperationQueue *)setupOperationQueue:(NSOperationQueue *)operationQueue
{
    [operationQueue setMaxConcurrentOperationCount:10];
    return operationQueue;
}

-(RKObjectRequestOperation *)requestOperation
{
    return [self requestOperationWithRequest:[NSURLRequest requestWithURL:[self url]]
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
    [self setLastError:error];
    [self setArray:@[]];
}

#pragma mark - private - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL ERN_createNull];
}

-(NSOperationQueue *)operationQueue
{
    return _operationQueue = _operationQueue ? _operationQueue : [self createOperationQueue];
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
responseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    self = [super init];
    ERNCheckNil(self);
    _responseDescriptor = responseDescriptor;
    _url = url;
    return self;
}

@end
