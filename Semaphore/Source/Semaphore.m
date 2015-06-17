/*******************************************************************************
 * The MIT License (MIT)
 * 
 * Copyright (c) 2014 Jean-David Gadina - www-xs-labs.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

#import "Semaphore.h"

@import Darwin.sys.semaphore;
@import Darwin.POSIX.fcntl;
@import Darwin.Mach.mach_init;
@import Darwin.Mach.task;
@import Darwin.Mach.semaphore;

#ifndef __has_feature
#define __has_feature( _x_ )    0
#endif

#if __has_feature( objc_arc )
#define SEMAPHORE_ARC           1
#else
#define SEMAPHORE_ARC           0
#endif

#if defined( __IPHONE_OS_VERSION_MIN_REQUIRED ) && __IPHONE_OS_VERSION_MIN_REQUIRED
#define SEMAPHORE_IOS           1
#else
#define SEMAPHORE_IOS           0
#endif

@interface Semaphore()
{
    semaphore_t _semaphore;
}

@property( atomic, readwrite, assign ) NSUInteger count;
@property( atomic, readwrite, assign ) BOOL       isNamed;
@property( atomic, readwrite, strong ) NSString * name;

@end

@implementation Semaphore

@synthesize count;
@synthesize isNamed;
@synthesize name;

+ ( instancetype )semaphoreWithCount: ( NSUInteger )c
{
    #if SEMAPHORE_ARC
    return [ [ self alloc ] initWithCount: c ];
    #else
    return [ [ [ self alloc ] initWithCount: c ] autorelease ];
    #endif
}

+ ( instancetype )semaphoreWithName: ( NSString * )n count: ( NSUInteger )c
{
    #if SEMAPHORE_ARC
    return [ [ self alloc ] initWithName: n count: c ];
    #else
    return [ [ [ self alloc ] initWithName: n count: c ] autorelease ];
    #endif
}

- ( instancetype )initWithCount: ( NSUInteger )c
{
    return [ self initWithName: nil count: c ];
}

- ( instancetype )initWithName: ( NSString * )n count: ( NSUInteger )c
{
    if( c == 0 )
    {
        #if SEMAPHORE_ARC == 0
        [ self release ];
        #endif
        
        return nil;
    }
    
    if( ( self = [ super init ] ) )
    {
        self.count   = c;
        self.isNamed = ( n == nil ) ? NO : YES;
        self.name    = n;
        
        if( self.isNamed )
        {
            
        }
        else
        {
            if( semaphore_create( mach_task_self(), &_semaphore, SYNC_POLICY_FIFO, ( int )c ) != KERN_SUCCESS )
            {
                #if SEMAPHORE_ARC == 0
                [ self release ];
                #endif
                
                return nil;
            }
        }
    }
    
    return self;
}

- ( instancetype )init
{
    return [ self initWithCount: 1 ];
}

- ( void )dealloc
{
    if( self.isNamed )
    {
        
    }
    else
    {
        semaphore_destroy( mach_task_self(), _semaphore );
    }
    
    self.name = nil;
    
    #if SEMAPHORE_ARC == 0
    [ super dealloc ];
    #endif
}

- ( BOOL )tryWait
{
    if( self.isNamed )
    {
        return NO;
    }
    else
    {
        {
            mach_timespec_t ts;
            
            ts.tv_sec  = 0;
            ts.tv_nsec = 0;
            
            return ( semaphore_timedwait( _semaphore, ts ) == KERN_SUCCESS ) ? YES : NO;
        }
    }
}

- ( void )signal
{}

@end
