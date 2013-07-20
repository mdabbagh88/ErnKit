#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <MapKit/MapKit.h>
#import "ERNMapViewAnnotationViewFactoryTest.h"

@implementation ERNMapViewAnnotationViewFactoryTest {
}

+(void)testMapViewAnnotationViewFactory:(id<ERNMapViewAnnotationViewFactory>)mapViewAnnotationViewFactory
{
    [self testAnnotationViewWithNilReuserNilAnnotation:mapViewAnnotationViewFactory];
    [self testAnnotationViewWithReuserNilAnnotation:mapViewAnnotationViewFactory];
    [self testAnnotationViewWithNilReuserAnnotation:mapViewAnnotationViewFactory];
    [self testAnnotationViewWithReuserAnnotation:mapViewAnnotationViewFactory];
}

+(void)testAnnotationViewWithNilReuserNilAnnotation:(id<ERNMapViewAnnotationViewFactory>)mapViewAnnotationViewFactory
{
    assertThat([mapViewAnnotationViewFactory annotationViewWithViewReuser:nil
                                                           fromAnnotation:nil],
               instanceOf([MKAnnotationView class]));
}

+(void)testAnnotationViewWithReuserNilAnnotation:(id<ERNMapViewAnnotationViewFactory>)mapViewAnnotationViewFactory
{
    assertThat([mapViewAnnotationViewFactory annotationViewWithViewReuser:
                ^MKAnnotationView *(NSString *identifier) {
                    return nil;
                }
                                                           fromAnnotation:nil],
               instanceOf([MKAnnotationView class]));
}

+(void)testAnnotationViewWithNilReuserAnnotation:(id<ERNMapViewAnnotationViewFactory>)mapViewAnnotationViewFactory
{
    id mockAnnotation = [OCMockObject niceMockForProtocol:@protocol(MKAnnotation)];
    assertThat([mapViewAnnotationViewFactory annotationViewWithViewReuser:nil
                                                           fromAnnotation:mockAnnotation],
                instanceOf([MKAnnotationView class]));
}

+(void)testAnnotationViewWithReuserAnnotation:(id<ERNMapViewAnnotationViewFactory>)mapViewAnnotationViewFactory
{
    id mockAnnotation = [OCMockObject niceMockForProtocol:@protocol(MKAnnotation)];
    assertThat([mapViewAnnotationViewFactory annotationViewWithViewReuser:
                ^MKAnnotationView *(NSString *identifier) {
                    return nil;
                }
                                                           fromAnnotation:mockAnnotation],
               instanceOf([MKAnnotationView class]));
}

@end
