#import "ERNRefreshControlRepositoryRefreshController.h"
#import "ERNAsyncRepository.h"
#import "ERNErrorHandler.h"
#import <UIKit/UIKit.h>

@interface ERNRefreshControlRepositoryRefreshController ()
@property (nonatomic, readonly) UIRefreshControl *refreshControl;
@property (nonatomic, readonly) id<ERNAsyncRepository> repository;
@end

@implementation ERNRefreshControlRepositoryRefreshController {
}

#pragma mark - public - constructors

+(instancetype)createWithRefreshControl:(UIRefreshControl *)refreshControl
                             repository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithRefreshControl:refreshControl
                                     repository:repository];
}

#pragma mark - private

-(void)refreshRepository
{
    [[self repository] refresh];
}

-(void)repositoryRefreshed
{
    [[self refreshControl] endRefreshing];
}

#pragma mark - private - initializers

-(id)initWithRefreshControl:(UIRefreshControl *)refreshControl
                 repository:(id<ERNAsyncRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _refreshControl = refreshControl;
    _repository = repository;
    [_repository addObserver:self
                    selector:@selector(repositoryRefreshed)];
    [_refreshControl addTarget:self
                        action:@selector(refreshRepository)
              forControlEvents:UIControlEventValueChanged];
    return self;
}

@end
