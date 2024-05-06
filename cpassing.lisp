;; cpassing.lisp
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

(in-package :cpassing)

(cffi:define-foreign-library (clib-lib :search-path (asdf:system-relative-pathname :cpassing "clib/"))
  (:darwin (:default "libclib.dylib"))
  (:unix (:or "libclib.so" "libclib" "clib"))
  (t (:default "libclib")))

(cffi:use-foreign-library clib-lib)

(declaim (inline byte-at
                 double-at))

(cffi:defcfun ("byte_at" byte-at) :uint8 (array (:pointer :uint8))
  (idx :size ))

(cffi:defcfun ("double_at" double-at) :double (array (:pointer :double))
  (idx :size ))

(defun byte-array-test (&rest args)
  (declare (optimize (speed 3)
                     (space 0)
                     (debug 0)
                     (safety 0)
                     (compilation-speed 0)))

  (let ((my-array (make-array (length args)
                              :element-type '(unsigned-byte 8)
                              :initial-contents args)))
    (cffi:with-pointer-to-vector-data (ptr my-array)
      (loop
        :for i fixnum :below (length my-array)
            :collect (byte-at ptr i )))))


(defun double-array-test (&rest args)
  (declare (optimize (speed 3)
                     (space 0)
                     (debug 0)
                     (safety 0)
                     (compilation-speed 0)))

  (let ((my-array (make-array (length args)
                              :element-type 'double-float
                              :initial-contents args)))
    (cffi:with-pointer-to-vector-data (ptr my-array)
      (loop
        :for i fixnum :below (length my-array)
        :collect (double-at ptr i )))))
