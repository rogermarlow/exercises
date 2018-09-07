quine.rb is a Ruby program that prints out a copy of its source code.
```
$ ruby quine.rb
src = "\nputs \"src = \" + src.inspect + src"
puts "src = " + src.inspect + src
$
```
To confirm that the output is the same as quine.rb
```
$ ruby quine.rb | diff quine.rb -
$
```
