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

/*!
 * @header      Semaphore.h
 * @copyright   (c) 2014 - Jean-David Gadina - www.xs-labs.com
 * @abstract    Semaphores for Objective-C and Swift
 */

@import Foundation;

#ifndef NS_DESIGNATED_INITIALIZER
#define NS_DESIGNATED_INITIALIZER
#endif

@interface Semaphore: NSObject

@property( atomic, readonly ) NSUInteger count;
@property( atomic, readonly ) BOOL       isNamed;
@property( atomic, readonly ) NSString * name;

+ ( instancetype )semaphoreWithCount: ( NSUInteger )c;
+ ( instancetype )semaphoreWithName: ( NSString * )n count: ( NSUInteger )c;
- ( instancetype )initWithCount: ( NSUInteger )c;
- ( instancetype )initWithName: ( NSString * )n count: ( NSUInteger )c NS_DESIGNATED_INITIALIZER;

@end
