(define-module (gnu packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix cvs-download)
  #:use-module (guix download)
  #:use-module (guix bzr-download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system perl)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages chez)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dictionaries)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages ibus)
  #:use-module (gnu packages java)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages lesstif)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages image)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages music)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages node)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages acl)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages messaging)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages scheme)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gd)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages video)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages finance)
  #:use-module (guix utils)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public emacs-vterm
  (let ((version "0.0.2")
        (revision "0")
        (commit "ed6e867cfab77c5a311a516d20af44f57526cfdc"))
    (package
      (name "emacs-vterm")
      (version (git-version version revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/akermu/emacs-libvterm")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0mq2q7yj09812iklj49n8p3kfpk1l6az33hr2dyxyl5i2nqps0vs"))))
      (build-system emacs-build-system)
      (arguments
       `(#:modules ((guix build emacs-build-system)
                    ((guix build cmake-build-system) #:prefix cmake:)
                    (guix build emacs-utils)
                    (guix build utils))
         #:imported-modules (,@%emacs-build-system-modules
                             (guix build cmake-build-system))
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'substitute-vterm-module-path
             (lambda* (#:key outputs #:allow-other-keys)
               (chmod "vterm.el" #o644)
               (emacs-substitute-sexps "vterm.el"
                 ("(require 'vterm-module nil t)"
                  `(module-load
                    ,(string-append (assoc-ref outputs "out")
                                    "/lib/vterm-module.so"))))))
           (add-after 'build 'configure
             ;; Run cmake.
             (lambda* (#:key outputs #:allow-other-keys)
               ((assoc-ref cmake:%standard-phases 'configure)
                #:outputs outputs
                #:out-of-source? #f
                #:configure-flags '("-DUSE_SYSTEM_LIBVTERM=ON"))))
           (add-after 'configure 'make
             ;; Run make.
             (lambda* (#:key (make-flags '()) outputs #:allow-other-keys)
               ;; Compile the shared object file.
               (apply invoke "make" "all" make-flags)
               ;; Move the file into /lib.
               (install-file
                "vterm-module.so"
                (string-append (assoc-ref outputs "out") "/lib")))))
         #:tests? #f))
      (native-inputs
       (list cmake-minimal libtool libvterm))
      (home-page "https://github.com/akermu/emacs-libvterm")
      (synopsis "Emacs libvterm integration")
      (description "This package implements a bridge to @code{libvterm} to
display a terminal in an Emacs buffer.")
      (license license:gpl3+))))
emacs-vterm