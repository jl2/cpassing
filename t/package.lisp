;; package.lisp
;; Copyright (c) 2024 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>

;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :cl-user)
(defpackage :cpassing.test
  (:use :cl
        :fiveam
        :alexandria
        :cpassing))

(in-package :cpassing.test)

(def-suite :cpassing)
(in-suite :cpassing)

(test byte-array
  (is
   (equal
    '(1 2 3 99 98 100)
    (byte-array-test 1 2 3 99 98 100))))

(test double-array
  (is
   (equal
    '(1.0d0 2.0d0 3.14d0 99.1321312d0 98434.232543d0 -100.12432d0)
    (double-array-test 1.0d0 2.0d0 3.14d0 99.1321312d0 98434.232543d0 -100.12432d0))))
