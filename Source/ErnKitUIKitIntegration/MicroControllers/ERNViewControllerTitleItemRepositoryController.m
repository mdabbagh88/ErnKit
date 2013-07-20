#import "ERNViewControllerTitleItemRepositoryController.h"
#import "ERNAsyncItemRepository.h"

@interface ERNViewControllerTitleItemRepositoryController ()
@property (nonatomic, readonly, weak) UIViewController *viewController;
@property (nonatomic, readonly) id<ERNAsyncItemRepository> repository;
@end

@implementation ERNViewControllerTitleItemRepositoryController {
}

#pragma mark - public - constructors

+(instancetype)createWithViewController:(UIViewController *)viewController
                             repository:(id<ERNAsyncItemRepository>)repository
{
    return [[self alloc] initWithViewController:viewController
                                     repository:repository];
}

#pragma mark - NSObject

-(void)dealloc
{
    [[self repository] removeObserver:self];
}

#pragma mark - private

-(void)repositoryRefreshed
{
    setTitle([self viewController], [[[self repository] item] description]);
}

static void setTitle(UIViewController *viewController, NSString *title)
{
    [viewController setTitle:title];
}

#pragma mark - private - initializers

-(id)initWithViewController:(UIViewController *)viewController
                 repository:(id<ERNAsyncItemRepository>)repository
{
    self = [self init];
    _viewController = viewController;
    _repository = repository;
    [_repository addObserver:self
                    selector:@selector(repositoryRefreshed)];
    [self repositoryRefreshed];
    return self;
}

@end
