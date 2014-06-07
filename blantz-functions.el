;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my (blantz) functions
;;
;;  -- yeah, so alot of them are from Writing Gnu Emacs Extensions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun other-window-backward (&optional n)
  "move cursor to previous window"
  (interactive "p")
  (other-window (- (or n 1))))

(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-back)

(defun scroll-one-line-ahead ()
  "Scroll ahead one line."
  (interactive)
  (scroll-ahead 1))

(defun scroll-one-line-behind ()
  "Scroll behind one line."
  (interactive)
  (scroll-behind 1))

(defun point-to-top ()
  "move point to first visible line."
  (interactive)
  (move-to-window-line 0))

(defun point-to-bottom ()
  "Move point to last visibile line."
  (interactive)
  (move-to-window-line -1))

(defun line-to-top ()
  "Move current line to top of window."
  (interactive)
  (recenter 0))

(global-set-key "\C-x\C-n" 'other-window)
(global-set-key "\C-x\C-p" 'other-window-backward)
(global-set-key "\C-x," 'point-to-top)
(global-set-key "\C-x." 'point-to-bottom)
;; align-regexp
(global-set-key "\C-c=" 'align-regexp)

(defun read-only-if-symlink ()
  (if (file-symlink-p buffer-file-name)
      (progn
        (setq buffer-read-only t)
        (message "File is a symlink"))))
(add-hook 'find-file-hooks 'read-only-if-symlink)



(provide 'blantz-functions)
