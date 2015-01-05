(defalias 'list-buffers 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("home"
         ("Shell" (name . "\*shell\*"))
         ("SQL" (name . "\*SQL"))
         ("Org" (or (mode . org-mode)
                    (filename . "OrgMode")))
         ("Magit" (name . "\*magit"))
         ("ERC" (or (mode . erc-mode)
                    (name . "ERC Keywords")))
         ("Help" (or (name . "\*Help\*")
                     (name . "\*Apropos\*")
                     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")))

