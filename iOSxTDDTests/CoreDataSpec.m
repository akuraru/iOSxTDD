#import "Kiwi.h"
#import "CoreData+MagicalRecord.h"
#import "Item.h"

SPEC_BEGIN(CoreDataSpec)
describe(@"CoreData", ^{
    beforeEach(^{
        [MagicalRecord setDefaultModelFromClass:[self class]];
        [MagicalRecord setupCoreDataStackWithInMemoryStore];
    });
    afterEach(^{
        [MagicalRecord cleanUp];
    });
    context(@"create item", ^{
        __block Item *item;
        beforeEach(^{
            item = [Item MR_createEntity];
            [item.managedObjectContext MR_saveOnlySelfAndWait];
        });
        it(@"count", ^{
            [[theValue([Item MR_countOfEntities]) should] equal:theValue(1)];
        });
        context(@"delete item", ^{
            beforeEach(^{
                [item MR_deleteEntity];
                [item.managedObjectContext MR_saveOnlySelfAndWait];
            });
            it(@"count", ^{
                [[theValue([Item MR_countOfEntities]) should] equal:theValue(0)];
            });
        });
        context(@"more create item", ^{
            __block Item *anotherItme;
            beforeEach(^{
                anotherItme = [Item MR_createEntity];
                [anotherItme.managedObjectContext MR_saveOnlySelfAndWait];
            });
            it(@"count", ^{
                [[theValue([Item MR_countOfEntities]) should] equal:theValue(2)];
            });
        });
    });
});
SPEC_END