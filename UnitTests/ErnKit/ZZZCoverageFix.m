#import "ZZZCoverageFix.h"

extern void __gcov_flush();

@implementation ZZZCoverageFix {
}

-(void)testFlushCoverage
{
    __gcov_flush();
}

@end

