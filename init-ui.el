
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; 细条状的光标
(setq-default cursor-type 'bar)
(setq inhibit-splash-screen t)

;; 全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(provide 'init-ui)
