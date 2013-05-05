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

+(instancetype)asyncItemsRepositoryWithUrl:(NSURL *)url
                                   keyPath:(NSString *)keyPath
                                   mapping:(RKObjectMapping *)mapping
                               statusCodes:(NSIndexSet *)statusCodes
{
    return [[self alloc] initWithUrl:url
                             keyPath:keyPath
                             mapping:mapping
                         statusCodes:statusCodes];
}

+(instancetype)asyncItemsRepositoryWithUrl:(NSURL *)url
                                   keyPath:(NSString *)keyPath
                               pathPattern:(NSString *)pathPattern
                                   mapping:(RKObjectMapping *)mapping
                               statusCodes:(NSIndexSet *)statusCodes
{
    return [[self alloc] initWithUrl:url
                             keyPath:keyPath
                         pathPattern:pathPattern
                             mapping:mapping
                         statusCodes:statusCodes];
}

#pragma mark - ERNAsyncItemsRepository

-(void)refresh
{
    [[self currentOperation] cancel];
    [self setCurrentOperation:[self setupCompletionForOperation:[self requestOperation]
                                        responseOperationsQueue:[self responseQueue]]];
    [[self operationQueue] addOperation:[self currentOperation]];
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
    return [self setupOperationQueue:[[NSOperationQueue alloc] init]];
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
    return _url = _url ? _url : [NSURL nullURL];
}

-(NSOperationQueue *)operationQueue
{
    return _operationQueue = _operationQueue ? _operationQueue : [self createOperationQueue];
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
         keyPath:(NSString *)keyPath
         mapping:(RKObjectMapping *)mapping
     statusCodes:(NSIndexSet *)statusCodes
{
    self = [self initWithUrl:url
                     keyPath:keyPath
                 pathPattern:nil
                     mapping:mapping
                 statusCodes:statusCodes];
    return self;
}

-(id)initWithUrl:(NSURL *)url
         keyPath:(NSString *)keyPath
         pathPattern:(NSString *)pathPattern
         mapping:(RKObjectMapping *)mapping
     statusCodes:(NSIndexSet *)statusCodes
{
    self = [super init];
    ERNCheckNil(self);
    _responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                  pathPattern:pathPattern
                                                                      keyPath:keyPath
                                                                  statusCodes:statusCodes];
    _url = url;
    return self;
}

@end
