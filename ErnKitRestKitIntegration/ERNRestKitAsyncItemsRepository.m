#import "ERNRestKitAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"
#import <RestKit/RestKit.h>

@interface ERNRestKitAsyncItemsRepository ()
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@property (nonatomic, readwrite) NSURL *url;
@property (nonatomic) NSOperation *currentOperation;
@property (nonatomic) NSOperationQueue *operationQueue;
@property (nonatomic) NSError *lastError;
@end

@implementation ERNRestKitAsyncItemsRepository

@synthesize url = _url;
@synthesize operationQueue = _operationQueue;

-(NSURL *)url
{
    _url = _url ? _url : [NSURL URLWithString:@""];
    return _url;
}

-(NSOperationQueue *)operationQueue
{
    _operationQueue = _operationQueue ? _operationQueue : [self createOperationQueue];
    return _operationQueue;
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

-(void)refreshWithUrl:(NSURL *)url
{
    [self setUrl:url];
    [self refresh];
}

-(void)refresh
{
    [[self currentOperation] cancel];
    [self setCurrentOperation:[self setupCompletionBlocksForOperation:[self requestOperation]]];
    [[self operationQueue] addOperation:[self currentOperation]];
}

-(RKObjectRequestOperation *)requestOperation
{
    return [[RKObjectRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[self url]]
                                         responseDescriptors:@[[self responseDescriptor]]];
}

-(RKObjectRequestOperation *)setupCompletionBlocksForOperation:(RKObjectRequestOperation *)operation
{
    NSOperationQueue *clientOperationQueue = [NSOperationQueue currentQueue];
    __weak ERNRestKitAsyncItemsRepository *blockSelf = self;

    [operation setCompletionBlockWithSuccess:
     ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         [clientOperationQueue addOperationWithBlock:
          ^(){
              ERNRestKitAsyncItemsRepository *localBlockSelf = blockSelf;
              [localBlockSelf refreshedWithItems:[mappingResult array]];
          }];
     }
                                                  failure:
     ^(RKObjectRequestOperation *operation, NSError *error) {
         [clientOperationQueue addOperationWithBlock:
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
    [self notifyObservers];
}

-(void)refreshedWithError:(NSError *)error
{
    [self setArray:@[]];
    [self setLastError:error];
    [self notifyObservers];
}

-(void)dealloc
{
    [_currentOperation cancel];
}

-(id)initWithUrl:(NSURL *)url
         keyPath:(NSString *)keyPath
         mapping:(RKObjectMapping *)mapping
     statusCodes:(NSIndexSet *)statusCodes
{
    self = [super init];
    ERNCheckNil(self);
    _responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                  pathPattern:nil
                                                                      keyPath:keyPath
                                                                  statusCodes:statusCodes];
    _url = url;
    return self;
}

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

@end
