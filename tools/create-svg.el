(defun shuffle (list)
  "Shuffle the elements in LIST."
  ;; http://kitchingroup.cheme.cmu.edu/blog/2014/09/06/Randomize-a-list-in-Emacs/
  (loop for i in (reverse (number-sequence 1 (1- (length list))))
        do (let ((j (random (+ i 1))))
	     ;; swap
	     (psetf (elt list j) (elt list i)
		    (elt list i) (elt list j))))
  list)

(let (numbers)
  (dotimes (y 30)
    (dotimes (x 20)
      (push (mod x 10) numbers)))
  (shuffle numbers)
  (dotimes (y 30)
    (dotimes (x 20)
      (insert (format "    <use xlink:href=\"#r%d\" transform=\"translate(%d0,%d0)\"/>\n"
		      (pop numbers) x y)))))
