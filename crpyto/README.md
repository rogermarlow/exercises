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
Google quickly tells us that each line is from Virgil's Aeneid. The Book and line number are significant.
If you look up the line number as an ASCII char then sort them by the book number you get the resulting
twelve letter English word relevant to the challenge.
