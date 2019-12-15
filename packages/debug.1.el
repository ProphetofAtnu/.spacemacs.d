;;; -*- lexical-binding: t; -*-

;; Complete files based on scratchy directory 
(message (completing-read "Completing read?" (directory-files "~/scratch" t directory-files-no-dot-files-regexp) nil nil "test1"))
