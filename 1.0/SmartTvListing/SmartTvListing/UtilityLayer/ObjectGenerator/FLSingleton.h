//
//  FLSingleton.h
//  LCK
//
//  Created by Muhammad Asif Kamboh on 27/09/2012.
//
//
#ifndef     __FL_SINGLETON_STRUCTURE__
#define     __FL_SINGLETON_STRUCTURE__

#if __has_feature(objc_arc)
/**
  * The _FL_MAKE_SINGLETON macro replicates the common implementation of a singleton class.
  * Write this macro in the implementation block.
  * The only parameter to this macro is the name off the class
  * The impelentation supports Non-ARC and ARC
  *
  * Usage:
  *
  *   #import "FLSingleton.h"
  *
  *   @interface MySingleton
  *   // declaration
  *   + (id)sharedInstance;
  *   @end
  *
  *   @implementation MySingleton
  *
  *   _FL_MAKE_SINGLETON(MySingleton)
  *
  *   @end
  *
  */
#define _FL_MAKE_SINGLETON(className)                               \
                                                                    \
+ (id)sharedInstance                                                \
{                                                                   \
    static className *_sharedInstance = nil;                        \
    if (nil == _sharedInstance) {                                   \
                                                                    \
        _sharedInstance = [[super allocWithZone:nil] init];         \
    }                                                               \
    return _sharedInstance;                                         \
}                                                                   \
                                                                    \
+ (id)allocWithZone:(NSZone *)zone                                  \
{                                                                   \
    return [self sharedInstance];                                   \
}                                                                   \
                                                                    \
- (id)copyWithZone:(NSZone *)zone                                   \
{                                                                   \
    return self;                                                    \
}

 //    end _FL_SINGLETON

#else

#define _FL_MAKE_SINGLETON(className)                               \
                                                                    \
+ (id)sharedInstance                                                \
{                                                                   \
    static className *_sharedInstance = nil;                        \
    if (nil == _sharedInstance) {                                   \
                                                                    \
        _sharedInstance = [[super allocWithZone:nil] init];         \
    }                                                               \
    return _sharedInstance;                                         \
}                                                                   \
                                                                    \
+ (id)allocWithZone:(NSZone *)zone                                  \
{                                                                   \
    return [[self sharedInstance] retain];                          \
}                                                                   \
                                                                    \
- (id)copyWithZone:(NSZone *)zone                                   \
{                                                                   \
    return self;                                                    \
}                                                                   \
                                                                    \
- (id)retain                                                        \
{                                                                   \
    return self;                                                    \
}                                                                   \
                                                                    \
- (NSUInteger)retainCount                                           \
{                                                                   \
    return NSUIntegerMax;                                           \
}                                                                   \
                                                                    \
- (oneway void)release                                              \
{                                                                   \
}                                                                   \
                                                                    \
- (id)autorelease                                                   \
{                                                                   \
    return self;                                                    \
}
// end _FL_SINGLETON

#endif // __has_feature(objc_arc)

#endif // __FL_SINGLETON_STRUCTURE__


