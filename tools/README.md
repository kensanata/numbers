# Generating the SVG

The Emacs Lisp code is used to help generate the SVG containing
20×30=600 random digits numbers in equal numbers
([random.svg](random.svg)).

Then, all the lines containing the string "label" are flushed in order
to create the empty SVG file ([empty.svg](empty.svg)).

Both are opened in Inkscape, the document borders are adjusted to fit
the drawing and saved as PDF. These two PDF files are then printed,
scaled to fit the printer.

# Gathering the samples

The subjects are asked to fill a printout of the empty sheet with the
random numbers matching the other printout, using a black pen of their
own choosing, writing on a surface of their own choosing
([scanned.pdf](../example/scanned.pdf)).

The result was scanned and resulted in a PDF containing an image. We
extracted the image using [poppler](https://poppler.freedesktop.org/):
`pdfimages -j scanned.pdf scan`

The resulting [scan-000.bpm](../example/scan-000.bpm) was loaded
into [Gimp](https://www.gimp.org/), rotate, cropped, and saved
as [scan-000.png](../example/scan-000.png).

Then we use ImageMagick to crop the image into 20×30 roughly equally
sized divisions, with a some border shaved off: `convert scan-000.png
-crop "20x30@" -shave "7x7" +repage +adjoin number-%d.png`

This will give you image files from `number-0.png` to
`number-599.png`.

# Organizing the images

The sequence is the following:

6 0 9 3 7 2 9 9 5 9 7 4 3 5 0 4 0 5 2 9 7 7 8 8 1 0 1 7 6 1 7 6 9 8 4
8 5 1 1 0 6 7 8 5 7 7 6 5 9 9 3 5 9 0 8 1 3 7 7 9 7 1 3 7 1 4 6 4 7 5
9 4 3 9 1 3 6 5 6 0 9 0 3 2 1 0 5 9 6 3 4 9 5 0 1 8 1 0 1 5 0 1 2 7 5
5 6 3 9 5 0 8 9 9 3 7 9 7 7 2 2 3 2 6 6 9 3 9 0 0 7 9 0 4 8 2 6 9 8 2
1 5 6 3 3 3 5 8 7 4 7 3 6 3 5 2 2 9 4 6 7 6 2 4 9 8 9 5 4 8 3 6 8 7 3
8 2 3 6 3 3 0 3 2 2 4 6 4 3 7 7 0 8 8 7 5 1 5 0 9 9 2 0 2 8 3 3 4 0 7
3 6 2 7 0 7 4 6 1 4 9 3 3 5 4 6 0 5 7 9 9 2 6 8 2 4 4 8 7 3 0 8 5 0 1
1 5 7 5 6 6 2 6 3 4 8 3 4 4 7 6 6 9 4 8 0 6 6 6 9 6 2 6 5 4 0 7 1 3 6
5 2 4 1 4 7 8 0 7 5 0 1 1 0 9 2 1 0 3 4 7 5 5 1 9 7 7 4 4 5 3 5 4 7 9
5 5 9 4 7 2 1 0 7 0 2 3 0 3 9 2 2 2 1 8 6 0 1 6 2 5 1 7 2 6 8 7 1 4 1
8 4 7 5 2 4 3 8 6 6 7 0 2 0 9 7 7 6 3 0 0 1 1 1 6 0 1 0 9 9 5 2 1 5 0
6 1 8 1 9 0 1 1 4 5 8 6 2 0 3 4 6 6 2 2 2 7 5 2 9 9 8 1 4 0 1 4 2 6 1
5 2 4 2 3 9 0 8 3 8 0 8 0 4 7 5 6 3 7 8 2 6 6 9 8 1 2 4 8 5 8 3 4 1 0
7 6 3 4 5 4 0 9 6 2 8 4 1 7 2 4 2 8 8 4 3 8 1 8 1 1 8 8 4 5 5 5 9 0 5
8 8 2 3 6 9 3 2 8 0 8 8 9 1 2 1 9 8 5 3 9 7 9 9 2 3 5 4 3 8 4 0 7 3 3
4 8 9 3 8 9 8 6 5 1 2 5 7 4 9 2 0 6 0 7 3 0 4 0 6 2 3 1 7 1 1 0 4 6 6
3 9 7 2 2 6 0 2 6 1 4 2 1 1 2 8 4 9 5 7 4 0 3 8 5 5 8 8 2 5 5 9 1 3 8
4 4 5 5 1

Here's a way to organize them. First, prepare a directory structure:
`for f in $(seq 0 9); do mkdir -p ../alex/$f; done`

Next, use the sequence above to move the files into the appropriate
directory:

```
f=0; for i in \
6 0 9 3 7 2 9 9 5 9 7 4 3 5 0 4 0 5 2 9 7 7 8 8 1 0 1 7 6 1 7 6 9 8 4 \
8 5 1 1 0 6 7 8 5 7 7 6 5 9 9 3 5 9 0 8 1 3 7 7 9 7 1 3 7 1 4 6 4 7 5 \
9 4 3 9 1 3 6 5 6 0 9 0 3 2 1 0 5 9 6 3 4 9 5 0 1 8 1 0 1 5 0 1 2 7 5 \
5 6 3 9 5 0 8 9 9 3 7 9 7 7 2 2 3 2 6 6 9 3 9 0 0 7 9 0 4 8 2 6 9 8 2 \
1 5 6 3 3 3 5 8 7 4 7 3 6 3 5 2 2 9 4 6 7 6 2 4 9 8 9 5 4 8 3 6 8 7 3 \
8 2 3 6 3 3 0 3 2 2 4 6 4 3 7 7 0 8 8 7 5 1 5 0 9 9 2 0 2 8 3 3 4 0 7 \
3 6 2 7 0 7 4 6 1 4 9 3 3 5 4 6 0 5 7 9 9 2 6 8 2 4 4 8 7 3 0 8 5 0 1 \
1 5 7 5 6 6 2 6 3 4 8 3 4 4 7 6 6 9 4 8 0 6 6 6 9 6 2 6 5 4 0 7 1 3 6 \
5 2 4 1 4 7 8 0 7 5 0 1 1 0 9 2 1 0 3 4 7 5 5 1 9 7 7 4 4 5 3 5 4 7 9 \
5 5 9 4 7 2 1 0 7 0 2 3 0 3 9 2 2 2 1 8 6 0 1 6 2 5 1 7 2 6 8 7 1 4 1 \
8 4 7 5 2 4 3 8 6 6 7 0 2 0 9 7 7 6 3 0 0 1 1 1 6 0 1 0 9 9 5 2 1 5 0 \
6 1 8 1 9 0 1 1 4 5 8 6 2 0 3 4 6 6 2 2 2 7 5 2 9 9 8 1 4 0 1 4 2 6 1 \
5 2 4 2 3 9 0 8 3 8 0 8 0 4 7 5 6 3 7 8 2 6 6 9 8 1 2 4 8 5 8 3 4 1 0 \
7 6 3 4 5 4 0 9 6 2 8 4 1 7 2 4 2 8 8 4 3 8 1 8 1 1 8 8 4 5 5 5 9 0 5 \
8 8 2 3 6 9 3 2 8 0 8 8 9 1 2 1 9 8 5 3 9 7 9 9 2 3 5 4 3 8 4 0 7 3 3 \
4 8 9 3 8 9 8 6 5 1 2 5 7 4 9 2 0 6 0 7 3 0 4 0 6 2 3 1 7 1 1 0 4 6 6 \
3 9 7 2 2 6 0 2 6 1 4 2 1 1 2 8 4 9 5 7 4 0 3 8 5 5 8 8 2 5 5 9 1 3 8 \
4 4 5 5 1; do
	mv number-$f.png ../alex/$i/
	f=$(($f+1))
done
```
