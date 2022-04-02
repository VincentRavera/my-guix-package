;; Python developer basic toolings
;; guix package --manifest=profile-go-developer.scm --profile=$GUIX_EXTRA_PROFILES/go-develop/go-develop -f go-dev.scm
(specifications->manifest
 (list "go"
       "go-golang-org-x-tools"
       "go-github-com-spf13-cobra"
       ;; "go-github-com-stamblerre-gocode"
       ;; "go-github-com-fatih-gomodifytags"
))
