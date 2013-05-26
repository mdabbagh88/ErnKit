#import <ErnKit/ERNTogglingAsyncItemsRepository.h>
#import <ErnKit/ERNTableViewController.h>
#import <ErnKit/ERNTableViewController+ERNAsyncItemsRepository.h>
#import <ErnKit/ERNRefreshAsyncRepositoryAction.h>
#import <ErnKit/ERNBarButtonItemActionController.h>
#import <ErnKit/ERNSegmentedControlTogglerController.h>
#import <ErnKit/UIViewController+ERNHelper.h>
#import <ErnKit/ERNDefaultTableViewCellFactory.h>
#import <ErnKit/ERNErrorHandler.h>
#import <ErnKit/ERNNullActionHandler.h>
#import <ErnKit/ERNDefaultTableViewItemManager.h>
#import "ERNDemoTableViewControllerConfigurator.h"

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
                  createWithCellFactory:[ERNDefaultTableViewCellFactory create]
                  actionHandler:[ERNNullActionHandler create]]];
}

-(UISegmentedControl *)feedSegmentedControl
{
    return _feedSegmentedControl = _feedSegmentedControl ?
    _feedSegmentedControl :
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Demo", @"Demo Two"]];
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
