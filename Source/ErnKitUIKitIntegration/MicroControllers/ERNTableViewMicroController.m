#import <UIKit/UIKit.h>
#import "ERNTableViewMicroController.h"
#import "ERNNullTableViewDataSource.h"
#import "ERNNullTableViewDelegate.h"
#import "ERNErrorHandler.h"

@interface ERNTableViewMicroController ()
@property (nonatomic, readonly) id<UITableViewDataSource> dataSource;
@property (nonatomic, readonly) id<UITableViewDelegate> delegate;
@end

@implementation ERNTableViewMicroController {
    id<UITableViewDelegate> _delegate;
    id<UITableViewDataSource> _dataSource;
}

#pragma mark - public - constructors

+(instancetype)createWithTableViewDelegate:(id<UITableViewDelegate>)delegate
                       tableViewDataSource:(id<UITableViewDataSource>)dataSource
                                 superView:(UIView *)superView
{
    return [[self alloc] initWithTableViewDelegate:delegate
                               tableViewDataSource:dataSource
                                         superView:superView];
}

#pragma mark - NSObject

-(void)dealloc
{
    [[self tableView] setDelegate:nil];
    [[self tableView] setDataSource:nil];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<UITableViewDataSource>, dataSource, [ERNNullTableViewDataSource create])

ERNLazyLoadGetter(id<UITableViewDelegate>, delegate, [ERNNullTableViewDelegate create])

#pragma mark - private - initializers

-(id)initWithTableViewDelegate:(id<UITableViewDelegate>)delegate
           tableViewDataSource:(id<UITableViewDataSource>)dataSource
                     superView:(UIView *)superView
{
    self = [super init];
    ERNCheckNil(self);
    _delegate = delegate;
    _dataSource = dataSource;
    _tableView = [UITableView new];
    [_tableView setDelegate:[self delegate]];
    [_tableView setDataSource:[self dataSource]];
    [_tableView setFrame:[superView bounds]];
    [_tableView setAutoresizingMask:
     UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [superView addSubview:_tableView];
    return self;
}

@end
