This is a solution to the puzzle set at this site: http://www.loyalty.org/~schoen/rsa/

It demonstrates the problem of insufficient randomness when generating RSA keys.
The modulus is a product of two large primes (p x q). Factoring pq is impractical
but finding the common factor with another modulus can done done very quickly.
Once you have a factor you just divide it into the modulus to get the other one.
You now have p and q for both RSA keys and you can construct a private key to
decrypt the bin file. So this solution extracts the modulus for each of the 100
PEM files (public keys) and finds the GCD with all the other ones. If any GCD > 1
then we have a common factor and we proceed to derive the private key and decrypt
the file.
```
$ cd challenge
$ ruby solution.rb
7.bin: si bellum finire manu si pellere Teucros
93.bin: debita complerant cum Turni iniuria Matrem
9.bin: quattuor ex omni delectae classe carinae
44.bin: Sarpedon ubi tot Simois correpta sub undis
29.bin: olli sensit enim simulata mente locutam
82.bin: sic fatus meritos aris mactauit honores
34.bin: una omnes iuuenum primi pauperque senatus
80.bin: omnia praecepi atque animo mecum ante peregi
58.bin: tum uero ardemus scitari et quaerere causas
71.bin: externi uenient generi qui sanguine nostrum
60.bin: procedit legio Ausonidum pilataque plenis
97.bin: quandoquidem Ausonios coniungi foedere Teucris
$
```
Google quickly tells us that each line is from Virgil's Aeneid:

 7.bin si bellum finire manu si pellere Teucros         Book 11 line 116
 9.bin quattuor ex omni delectae classe carinae         Book  4 line 115
29.bin olli sensit enim simulata mente locutam          Book  4 line 105
34.bin una omnes iuuenum primi pauperque senatus        Book  8 line 105
44.bin Sarpedon ubi tot Simois correpta sub undis       Book  1 line 100
58.bin tum uero ardemus scitari et quaerere causas      Book  2 line 105
60.bin procedit legio Ausonidum pilataque plenis        Book 12 line 121
71.bin externi uenient generi qui sanguine nostrum      Book  7 line  98
80.bin omnia praecepi atque animo mecum ante peregi     Book  6 line 105
82.bin sic fatus meritos aris mactauit honores          Book  3 line 118
93.bin debita complerant cum Turni iniuria Matrem       Book  9 line 108
97.bin quandoquidem Ausonios coniungi foedere Teucris   Book 10 line 105

The Book and line number are significant.

Look up the line number as an ASCII char:

Line   ASCII
 98 -> b
100 -> d
105 -> i
108 -> l
115 -> s
116 -> t
118 -> v
121 -> y

Then sort them by the book number followed by line number, and you get
the resulting twelve letter English word relevant to the challenge:

 1, 100: d
 2, 105: i
 3, 118: v
 4, 105: i
 4, 115: s
 6, 105: i
 7,  98: b
 8, 105: i
 9, 108: l
10, 105: i
11, 116: t
12, 121: y

divisibility.
