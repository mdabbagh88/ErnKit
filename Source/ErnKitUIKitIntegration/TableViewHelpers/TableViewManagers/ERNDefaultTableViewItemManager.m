#import "ERNDefaultTableViewItemManager.h"
#import "ERNErrorHandler.h"
#import "ERNActionHandler.h"
#import "ERNTableViewCellFactory.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"

@interface ERNDefaultTableViewItemManager ()
@property (nonatomic, readonly) id<ERNActionHandler> actionHandler;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> cellFactory;
@end

@implementation ERNDefaultTableViewItemManager {
    id<ERNTableViewCellFactory> _cellFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
                       actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithCellFactory:cellFactory
                               actionHandler:actionHandler];
}

#pragma mark - ERNTableViewItemManager

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    [[self actionHandler] actionForObject:object];
}

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                            fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNNullTableViewCell create]);
    return [[self cellFactory] cellWithCellReuser:block
                                       fromObject:object];
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(object, defaultHeight);
    return [[self cellFactory] cellHeightForObject:object
                                     defaultHeight:defaultHeight];
}

#pragma mark - private - accessors

-(id<ERNTableViewCellFactory>)cellFactory
{
    return _cellFactory = _cellFactory ?
    _cellFactory :
    [ERNNullTableViewCellFactory create];
}

#pragma mark - private - initializers

-(id)initWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
           actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [super init];
    ERNCheckNil(self);
    _cellFactory = cellFactory;
    _actionHandler = actionHandler;
    return self;
}

@end
