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
 * @file        Semaphore.m
 * @copyright   (c) 2014 - Jean-David Gadina - www.xs-labs.com
 * @abstract    Test class for Semaphore
 */

@import Semaphore;

@interface SemaphoreTest: XCTestCase
{}

@end

@implementation SemaphoreTest

- ( void )setUp
{
    [ super setUp ];
}

- ( void )tearDown
{
    [ super tearDown ];
}

- ( void )testNew
{
    Semaphore * s;
    
    s = [ Semaphore new ];
    
    XCTAssertNotNil( s );
}

- ( void )testSemaphoreWithCount
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithCount: 1 ];
    
    XCTAssertNotNil( s );
    
    s = [ Semaphore semaphoreWithCount: 0 ];
    
    XCTAssertNil( s );
}

- ( void )testInitWithCount
{
    Semaphore * s;
    
    s = [ [ Semaphore alloc ] initWithCount: 1 ];
    
    XCTAssertNotNil( s );
    
    s = [ [ Semaphore alloc ] initWithCount: 0 ];
    
    XCTAssertNil( s );
}

- ( void )testSemaphoreWithName
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore" ];
    
    XCTAssertNotNil( s );
    
    s = [ Semaphore semaphoreWithName: nil ];
    
    XCTAssertNil( s );
}

- ( void )testInitWithName
{
    Semaphore * s;
    
    s = [ [ Semaphore alloc ] initWithName: @"org.xs-labs.semaphore" ];
    
    XCTAssertNotNil( s );
    
    s = [ [ Semaphore alloc ] initWithName: nil ];
    
    XCTAssertNil( s );
}

- ( void )testSemaphoreWithName_Count
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    
    XCTAssertNotNil( s );
    
    s = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore" count: 0 ];
    
    XCTAssertNotNil( s );
    
    s = [ Semaphore semaphoreWithName: nil count: 1 ];
    
    XCTAssertNil( s );
    
    s = [ Semaphore semaphoreWithName: nil count: 0 ];
    
    XCTAssertNil( s );
}

- ( void )testInitWithName_Count
{
    Semaphore * s;
    
    s = [ [ Semaphore alloc ] initWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    
    XCTAssertNotNil( s );
    
    s = [ [ Semaphore alloc ] initWithName: @"org.xs-labs.semaphore" count: 0 ];
    
    XCTAssertNotNil( s );
    
    s = [ [ Semaphore alloc ] initWithName: nil count: 1 ];
    
    XCTAssertNil( s );
    
    s = [ [ Semaphore alloc ] initWithName: nil count: 0 ];
    
    XCTAssertNil( s );
}

- ( void )testIsNamed
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    
    XCTAssertTrue( s.isNamed );
    
    s = [ Semaphore semaphoreWithCount: 1 ];
    
    XCTAssertFalse( s.isNamed );
}

- ( void )testName
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    
    XCTAssertEqualObjects( s.name, @"org.xs-labs.semaphore.1" );
    
    s = [ Semaphore semaphoreWithCount: 1 ];
    
    XCTAssertNil( s.name );
}

- ( void )testCount
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithCount: 1 ];
    
    XCTAssertEqual( s.count, ( NSUInteger )1 );
}

- ( void )testUnnamedBinaryTryWait
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithCount: 1 ];
    
    XCTAssertTrue(  [ s tryWait ] );
    XCTAssertFalse( [ s tryWait ] );
    
    [ s signal ];
}

- ( void )testUnnamedTryWait
{
    Semaphore * s;
    
    s = [ Semaphore semaphoreWithCount: 2 ];
    
    XCTAssertTrue(  [ s tryWait ] );
    XCTAssertTrue(  [ s tryWait ] );
    XCTAssertFalse( [ s tryWait ] );
    
    [ s signal ];
    [ s signal ];
}

- ( void )testNamedBinaryTryWait
{
    Semaphore * s1;
    Semaphore * s2;
    
    s1 = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    s2 = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.1" count: 1 ];
    
    XCTAssertTrue(  [ s1 tryWait ] );
    XCTAssertFalse( [ s1 tryWait ] );
    XCTAssertFalse( [ s2 tryWait ] );
    
    [ s1 signal ];
    
    XCTAssertTrue(  [ s2 tryWait ] );
    XCTAssertFalse( [ s2 tryWait ] );
    XCTAssertFalse( [ s1 tryWait ] );
    
    [ s2 signal ];
}

- ( void )testNamedTryWait
{
    Semaphore * s1;
    Semaphore * s2;
    
    s1 = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.2" count: 2 ];
    s2 = [ Semaphore semaphoreWithName: @"org.xs-labs.semaphore.2" count: 2 ];
    
    XCTAssertTrue(  [ s1 tryWait ] );
    XCTAssertTrue(  [ s2 tryWait ] );
    XCTAssertFalse( [ s1 tryWait ] );
    XCTAssertFalse( [ s2 tryWait ] );
    
    [ s1 signal ];
    [ s2 signal ];
}

@end
