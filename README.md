# Numbers

This repository tries to create a repository of handwritten digits,
much like
the
[MNIST database of handwritten digits](http://yann.lecun.com/exdb/mnist/).
In Switzerland, the handwritten digites sometimes look a bit
different, which is why we undertake this effort.

There are two data sets in this repository. They are described below.

**Warning:** If you're using `git` on Windows to clone this
repository, it make take a very long time because there are so many
(tiny) files in it!

# Set 1: manual collection

Our goal was 10,000 handwritten digits and we have met that goal! If
you want to help us reach 20,000 handwritten digits, check out
the [tools](tools/) directory.

The directory name of every contribution adheres to the following
naming scheme:

1. four digits to identify the person
2. an underscore character
3. two letter country code ([ISO 3166 Alpha-2 codes](https://en.wikipedia.org/wiki/ISO_3166-1#Current_codes)) or `XX` if unknown (e.g. Switzerland is `CH`)
4. age, rounded to the nearest decade (e.g. 35 to 44 years is `4`) or `X` if unknown
5. sex (`M` for man, `F` for woman, `X` for unknown, `O` for other)

# Set 2: automatic collection

As part of a commercial project a neural network was trained on the
numbers cut from a very large collection of documents. There are so
many digits in this set that the data quality is lower than in the
manual collection. You can find this set in the
[UNCATEGORIZED](UNCATEGORIZED/) directory. A bit over 800,000 digits!

- digits may be miscategorized or malformed (e.g. [554](UNCATEGORIZED/4/number-0000554.PNG))
- digits are both handwritten and printed (e.g. [552](UNCATEGORIZED/4/number-0000552.PNG))
- the distribution of digits is not uniform
- no information is available about the authors

I'll be happy to take pull requests which fix miscategorized or
malformed digits.

As for the distribution of numbers:

```
digit  files
  0   323945
  1    94075
  2    71820
  3    55240
  4    46143
  5    96376
  6    39868
  7    34836
  8    37124
  9    34571
```
