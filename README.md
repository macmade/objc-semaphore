Objective-C Semaphore
=====================

[![Build Status](https://img.shields.io/travis/macmade/objc-semaphore.svg?branch=master&style=flat)](https://travis-ci.org/macmade/objc-semaphore)
[![Coverage Status](https://img.shields.io/coveralls/macmade/objc-semaphore.svg?branch=master&style=flat)](https://coveralls.io/r/macmade/objc-semaphore?branch=master)
[![Issues](http://img.shields.io/github/issues/macmade/objc-semaphore.svg?style=flat)](https://github.com/macmade/objc-semaphore/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat)
![License](https://img.shields.io/badge/license-mit-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)  
[![Donate-Patreon](https://img.shields.io/badge/donate-patreon-yellow.svg?style=flat)](https://patreon.com/macmade)
[![Donate-Gratipay](https://img.shields.io/badge/donate-gratipay-yellow.svg?style=flat)](https://www.gratipay.com/macmade)
[![Donate-Paypal](https://img.shields.io/badge/donate-paypal-yellow.svg?style=flat)](https://paypal.me/xslabs)

About
-----

Semaphores for Objective-C and Swift.

### Swift support

This project is fully compatible with Swift.

In order to use the `Semaphore` class from Swift, simply link with `Semaphore.framework` (ARC target - see below) and:

    import Semaphore

### Targets

The following targets are available:

 * OS X static library (`.a`).
 * OS X dynamic library (`.dylib`).
 * OS X framework (`.framework`).
 * iOS static library (`.a`).

All targets are available for both ARC and MRC (see below).

### Supported platforms

 * OS X deployment target: **OS X 10.6** (ARC - see below), **OS X 10.4** (MRC - see below)
 * OS X architectures: **x86_64, i386** (non-ARC - see below)
 * iOS deployment target: **iOS 6.0**
 * iOS architectures: **armv7, armv7s, arm64**

### Automatic Reference Counting (ARC) Note

All project's targets comes in two flavors.  
One using ARC - Automatic Reference Counting, the other using Manual Reference Counting (MRC).

If you're targeting only 64-bits platforms and/or 10.7 deployment targets, you're advised to use the ARC targets.  
Otherwise, if targeting 32-bits platforms and/or deployment targets lower than 10.7, MRC targets are available.

License
-------

The project is released under the terms of the MIT License.

Repository Infos
----------------

    Owner:			Jean-David Gadina - XS-Labs
    Web:			www.xs-labs.com
    Blog:			www.noxeos.com
    Twitter:		@macmade
    GitHub:			github.com/macmade
    LinkedIn:		ch.linkedin.com/in/macmade/
    StackOverflow:	stackoverflow.com/users/182676/macmade


