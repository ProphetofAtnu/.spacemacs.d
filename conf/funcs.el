(defun file-string (file)
  "Return a file's contents as a sexp"
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)
    ))
