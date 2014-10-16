(defparameter *my-list* (coerce "HELLO. YOU OK? GREAT!" 'list))

(defun tweak-text (lst caps lit)
  (when lst
    (let ((item (car lst))
          (rest (cdr lst)))
      (cond ((eql item #\space)            (cons item (tweak-text rest caps lit)))
            ((member item '(#\! #\? #\.))  (cons item (tweak-text rest t lit)))
            ((eql item #\")                (tweak-text rest caps (not lit)))
            (lit                           (cons item (tweak-text rest nil lit)))
            (caps                          (cons (char-upcase item) (tweak-text rest nil lit)))
            (t                             (cons (char-downcase item) (tweak-text rest nil nil)))))))
