#import "Kiwi.h"
#import "CoreData+MagicalRecord.h"

SPEC_BEGIN(CoreDataSpec)
describe(@"CoreData", ^{
    beforeEach(^{
        [MagicalRecord setDefaultModelFromClass:[self class]];
        [MagicalRecord setupCoreDataStackWithInMemoryStore];
    });
    afterEach(^{
        [MagicalRecord cleanUp];
    });
});
SPEC_END