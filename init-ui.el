
(tool-bar-mode -1)

(scroll-bar-mode -1)

;; 细条状的光标
(setq-default cursor-type 'bar)

(setq inhibit-splash-screen t)

;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;字体设置

(set-default-font "Consolas-16")

(load-theme 'gruvbox t)

(provide 'init-ui)
