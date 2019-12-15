;;; scratchy.el --- Transient scratch project generator  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Jacob Scaggs

;; Author: Jacob Scaggs <jacsc@Shangri-La>
;; Keywords: lisp, convenience, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(require 'cl-lib)

(defvar schy-dir (expand-file-name "scratch" user-home-directory)
  "The directory to look for schy templates")
(defvar schy-templates (expand-file-name "templates" schy-dir))

(defconst schy-template-structure '(root link include scripts))


(define-minor-mode schy-edit-mode "Schy edit minor mode."
  :init-value nil
  :keymap)

;; Schy gen structure.
(cl-defstruct (schy-gen (:constructor schy-gen-from-list
                                      (list &aux
                                            (name (nth 0 list))
                                            (lang (nth 1 list))
                                            (template (nth 2 list))
                                            (scripts (nth 3 list))
                                            (hook (nth 4 list))))
                        (:constructor schy-gen-create
                                      (name lang
                                            &key
                                            (template nil)
                                            (scripts nil)
                                            (hook nil))))
  name
  lang
  template
  scripts
  hook)

(cl-defgeneric schy-folder-name
    ()
  :documentation "Return the subdirectory for the generator using the generator, or the name and language.")

(cl-defmethod schy-folder-name
  ((gen schy-gen))
  "Implementation of schy-folder-name for schy-gen structure."
  (let* ((lang (schy-gen-lang gen))
         (lang-folder (expand-file-name lang schy-dir))
         (name (schy-gen-name gen))
         (name-folder (expand-file-name name lang-folder)))
    name-folder))

(cl-defmethod schy-folder-name
  ((name string) lang)
  "Implementation of schy-folder-name for two string args."
  (seq-reduce #'(lambda (parent child)
                  (expand-file-name child parent))
              (list lang name)
              schy-dir))

(cl-defmethod schy-gen-init
  ((gen schy-gen))
  "Generates a directory for a scratchy generator"
  (let ((root (schy-folder-name gen)))
    (when (file-directory-p root)
      (make-directory root t))
    (mapc (lambda (dir)
            (make-directory (expand-file-name (symbol-name dir)
                                              root)
                            t))
          schy-template-structure)
    root))

(defun schy-dir-p ()
  "Check to see if the default path to the schy directory exists."
  (file-directory-p schy-dir))

(defun schy-dir-init ()
  "Initialize the schy directory."
  (interactive)
  (if (schy-dir-p)
      nil
    (progn
      (make-directory schy-dir)
      schy-dir)))

(defun schy-mode-to-string (mode)
  "Convert MODE to a string, whether it is a symbol or not."
  (cond
   ((stringp mode) mode)
   ((symbolp mode)
    (symbol-name mode))))

(defun schy-find-generator (dir)
  "Search the default directory for generator directories"
  (interactive
   ())
  )

(defun schy-main-menu ()
  "Open the schy main menu"
  (interactive)
  (let ((choice (read-char-choice "[c]reate scratchy directory\n[e]dit a template\n[n]ew template"
                                  '(?r ?l ?t ?s))))))

(defun schy-edit-menu ()
  "Open the edit menu for a template generator"
  (interactive)
  (let ((choice (read-char-choice "Choose a subcommand\nr -> root\tl -> link\ti -> include\ts -> scripts"
                                  '(?r ?l ?t ?s))))
    (cond
     ((eql choice ?r)
      (message "root"))
     ((eql choice ?l)
      (message "link"))
     ((eql choice ?i)
      (message "include"))
     ((eql choice ?s)
      (message "scripts")))))

(provide 'scratchy)
;;; scratchy.el ends here
