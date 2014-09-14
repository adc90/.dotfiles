(set-background-color "tsdh-dark")
(menu-bar-mode 0)
;;Set the line number settings
(global-linum-mode 1)
(setq linum-format "%4d \u2502")
(add-to-list 'load-path "~/.emacs.d/")
(require 'powerline)

(custom-set-faces
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
(setq powerline-arrow-shape 'curve)
(push "~/Desktop/" load-path)
(setq merlin-command "/usr/local/bin/ocamlmerlin")
(add-hook 'tuareg-mode-hook 'merlin-mode)
(add-hook 'caml-mode-hook 'merlin-mode)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

