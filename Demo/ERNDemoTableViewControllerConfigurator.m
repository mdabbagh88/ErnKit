#import "ERNDemoTableViewControllerConfigurator.h"
#import "ERNTogglingAsyncItemsRepository.h"
#import "ERNTableViewController.h"
#import "ERNTableViewController+Refreshable.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNSegmentedControlTogglerController.h"
#import "UIViewController+ERNHelper.h"
#import "ERNTableViewController+Refreshable.h"
#import "ERNErrorHandler.h"

@interface ERNDemoTableViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoTableViewControllerConfigurator {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithRepository:repository
                                    toggler:toggler];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // Setup the map view controller with the RestKit repository and the annotation view factory
    UIViewController *tableViewController =
    [ERNTableViewController createRefreshableWithRepository:[self repository]];

    // Setup a segmented control used to select what feed to show
    UISegmentedControl *feedSegmentedControl =
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Magnus", @"Jim"]];
    [feedSegmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [feedSegmentedControl setSelectedSegmentIndex:0];

    // Wire the toggling repository with the segmented control using a segmented control toggler
    // controller
    ERNSegmentedControlTogglerController *feedController =
    [ERNSegmentedControlTogglerController createWithSegmentedControl:feedSegmentedControl
                                                             toggler:[self toggler]];

    // Setup the toolbar in the view controller, left space, segmented control, right space
    [[tableViewController navigationItem] setTitleView:feedSegmentedControl];

    // Save the feed toggler controllers to the view controller so that they are
    // appropriately retained and released by ARC
    [tableViewController ERN_addSubController:feedController];

    // Return the controller to the system for transitioning
    return tableViewController;
}

#pragma mark - private - initializer

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
                toggler:(id<ERNToggler>)toggler
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _toggler = toggler;
    return self;
}

@end
