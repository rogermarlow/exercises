Ruby classes to solve the Towers of Hanoi problem.
```
$ irb -I. --noecho
2.5.0 :001 > load 'tower_of_hanoi.rb'
2.5.0 :002 > load 'tower_of_hanoi_reporting.rb'
2.5.0 :003 > game = TowerOfHanoi.new(10)
2.5.0 :004 > game.print
From: 10-9-8-7-6-5-4-3-2-1
Via:  .
To:   .
Move counter: 0
2.5.0 :005 > game.solve
2.5.0 :006 > game.print
From: .
Via:  .
To:   10-9-8-7-6-5-4-3-2-1
Move counter: 1023
2.5.0 :007 >
```
This was written with TDD. Run the tests like this
```
$ cd tests
$ ruby test_tower.rb
Run options: --seed 55606

# Running:

...........

Finished in 0.006881s, 1598.6049 runs/s, 2325.2434 assertions/s.

11 runs, 16 assertions, 0 failures, 0 errors, 0 skips
$
$ ruby test_tower_of_hanoi.rb
Run options: --seed 26410

# Running:

......

Finished in 0.707471s, 8.4809 runs/s, 33.9237 assertions/s.

6 runs, 24 assertions, 0 failures, 0 errors, 0 skips
```
