#import <Foundation/Foundation.h>

@class UITableView;
@protocol ERNAsyncRepository;

@interface ERNTableViewRepositoryRefreshController : NSObject
+(instancetype)createWithTableView:(UITableView *)tableView
                        repository:(id<ERNAsyncRepository>)repository;
@end
