#import "ERNDemoTableViewControllerConfigurator.h"
#import "ERNTogglingAsyncItemsRepository.h"
#import "ERNTableViewController.h"
#import "ERNTableViewController+ERNAsyncItemsRepository.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNSegmentedControlTogglerController.h"
#import "UIViewController+ERNHelper.h"
#import "ERNDefaultTableViewCellFactory.h"
#import "ERNErrorHandler.h"
#import "ERNDefaultTableViewItemManager.h"

@interface ERNDemoTableViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoTableViewControllerConfigurator {
    UIViewController *_tableViewController;
    UISegmentedControl *_feedSegmentedControl;
    ERNSegmentedControlTogglerController *_feedController;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithRepository:repository
                                    toggler:toggler];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    [[self feedSegmentedControl] setSegmentedControlStyle:UISegmentedControlStyleBar];
    [[self feedSegmentedControl] setSelectedSegmentIndex:0];
    [[[self tableViewController] navigationItem] setTitleView:[self feedSegmentedControl]];
    [[self tableViewController] ERN_addMicroController:[self feedController]];
    return [self tableViewController];
}

#pragma mark - private - accessors

-(UIViewController *)tableViewController
{
    return _tableViewController = _tableViewController ?
    _tableViewController :
    [ERNTableViewController createRefreshableWithRepository:[self repository]
     itemManager:[ERNDefaultTableViewItemManager
                  createWithCellFactory:[ERNDefaultTableViewCellFactory create]]];
}

-(UISegmentedControl *)feedSegmentedControl
{
    return _feedSegmentedControl = _feedSegmentedControl ?
    _feedSegmentedControl :
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Magnus", @"Jim"]];
}

-(ERNSegmentedControlTogglerController *)feedController
{
    return _feedController = _feedController ?
    _feedController :
    [ERNSegmentedControlTogglerController createWithSegmentedControl:[self feedSegmentedControl]
                                                             toggler:[self toggler]];
}

#pragma mark - private - initializer

-(id)initWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                toggler:(id<ERNToggler>)toggler
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _toggler = toggler;
    return self;
}

@end
