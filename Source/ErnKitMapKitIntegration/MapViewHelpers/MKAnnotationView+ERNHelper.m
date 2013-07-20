#import "MKAnnotationView+ERNHelper.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullAnnotation.h"

@implementation MKAnnotationView (ERNHelper)

#pragma mark - public - constructors

+(instancetype)ERN_createWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                             annotation:(id<MKAnnotation>)annotation
{
    return [self ERN_createWithViewReuser:block
                               annotation:annotation
                               identifier:NSStringFromClass([self class])];
}

#pragma mark - private

+(instancetype)ERN_createWithViewReuser:(MKAnnotationView *(^)(NSString *))block
                         annotation:(id<MKAnnotation>)annotation
                         identifier:(NSString *)identifier
{
    return [self ERN_createAnnotationView:block ? block(identifier) : nil
                               annotation:validateAnnotation(annotation)
                               identifier:identifier];
    
}

static id<MKAnnotation> validateAnnotation(id<MKAnnotation> annotation)
{
    return annotation ? annotation : [ERNNullAnnotation create];
}

+(instancetype)ERN_createAnnotationView:(MKAnnotationView *)view
                             annotation:(id<MKAnnotation>)annotation
                             identifier:(NSString *)identifier
{
    return view ? [view ERN_setupAnnotation:annotation] :
    [[self alloc] initWithAnnotation:annotation
                     reuseIdentifier:identifier];
}

-(instancetype)ERN_setupAnnotation:(id<MKAnnotation>)annotation
{
    [self setAnnotation:annotation];
    return self;
}

@end
