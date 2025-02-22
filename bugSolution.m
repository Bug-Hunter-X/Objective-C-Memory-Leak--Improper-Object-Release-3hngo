The solution involves properly releasing the allocated object.  Using Automatic Reference Counting (ARC), this is handled automatically, but in manual retain-release scenarios, the correct usage is essential:

```objectivec
@interface MyClass : NSObject
@property (strong, nonatomic) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    NSLog(@"MyClass deallocated");
    [super dealloc];
}
@end

- (void)someMethod {
    MyClass *obj = [[MyClass alloc] init];
    obj.myString = @"Hello";
    [obj release]; // Release the object 
    // OR, better with ARC (recommended):
    // MyClass *obj = [MyClass new]; // obj will be autoreleased
}
```

With ARC, the compiler handles the release automatically, therefore, manual `release` calls are unnecessary and should be avoided.  The use of `[MyClass new]` will ensure the object's proper autorelease management. This version is cleaner and less prone to errors.