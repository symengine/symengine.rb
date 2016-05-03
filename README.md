## SymEngine Ruby Wrappers

Ruby wrappers gem for SymEngine, a fast symbolic manipulation library, written in C++. https://github.com/sympy/symengine

### Installation

#### Prerequisites

- C++ compiler        - See supported [compilers](https://github.com/sympy/symengine/wiki/Compiler-Support)

- CMake               - with executable folder in the `PATH` variable

- libsymengine        - See build [instructions](https://github.com/sympy/symengine/wiki/Building-SymEngine)

#### Installing

- Simply do,

        gem install symengine

- If `libsymengine` is not found, you can give the installation directory or build directory by doing,

        gem install symengine -- -DSymEngine_DIR=/path/to/symengine/root

### Development
* Install bundler by `gem install bundler`
* Execute `bundle install` this will install the gems required
* Build the gem, `gem build symengine.gemspec`
* Install the gem, `gem install symengine-0.1.0.gem`

### Using the extensions
SymEngine is a module in the extensions, and the classes are a part of it. To check if
you can use them, fire up the interpreter and load the file
``` ruby
~$ irb
2.2.0 :001 > require 'symengine'
 => true

```
Go ahead and try a function
``` ruby
2.2.0 :002 > SymEngine.ascii_art

 _____           _____         _
|   __|_ _ _____|   __|___ ___|_|___ ___
|__   | | |     |   __|   | . | |   | -_|
|_____|_  |_|_|_|_____|_|_|_  |_|_|_|___|
      |___|               |___|
 => nil
```
Please go through the [IRuby notebooks](https://github.com/symengine/symengine.rb/tree/master/notebooks) for more demonstrations. If you are new to symengine.rb, please refer to the [beginner notebook](https://github.com/symengine/symengine.rb/blob/master/notebooks/beginner.ipynb).
