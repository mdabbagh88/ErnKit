#import "ERNTableViewRepositoryRefreshController.h"
#import <UIKit/UIKit.h>
#import "ERNAsyncRepository.h"
#import "ERNNullAsyncRepository.h"
#import "ERNErrorHandler.h"

@interface ERNTableViewRepositoryRefreshController ()
@property (nonatomic, readonly) UITableView *tableView;
@end

@implementation ERNTableViewRepositoryRefreshController {
    id<ERNAsyncRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithTableView:(UITableView *)tableView
                        repository:(id<ERNAsyncRepository>)repository
{
    return [[self alloc] initWithTableView:tableView
                                repository:repository];
}

#pragma mark - NSObject

-(void)dealloc
{
    [_repository removeObserver:self];
}

#pragma mark - private

-(void)repositoryRefreshed
{
    [[self tableView] reloadData];
}

#pragma mark - private- accessors

ERNLazyLoadGetter(id<ERNAsyncRepository>, repository, [ERNNullAsyncRepository create])

#pragma mark - private - initializers

-(id)initWithTableView:(UITableView *)tableView
            repository:(id<ERNAsyncRepository>)repository
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    _tableView = tableView;
    [_repository addObserver:self
                    selector:@selector(repositoryRefreshed)];
    return self;
}

@end
