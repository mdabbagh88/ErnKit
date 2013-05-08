#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "MKAnnotationView+ERNHelperTest.h"
#import "MKAnnotationView+ERNHelper.h"

@implementation MKAnnotationView_ERNHelperTest

-(void)testConstructor
{
    [MKAnnotationView createForMapView:nil
                          annotation:nil
                          identifier:nil];
}

@end
