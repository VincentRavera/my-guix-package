;; Dependencies for go lsp and other go tools
(define-module (gnu packages golang-personal)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module ((guix build utils) #:select (alist-replace))
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system go)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module ((gnu packages bootstrap) #:select (glibc-dynamic-linker))
  #:use-module (gnu packages check)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages syncthing)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages golang)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1))


;; guix import go -r github.com/fatih/gomodifytags@1.16.0
(define-public go-github-com-fatih-camelcase
  (package
    (name "go-github-com-fatih-camelcase")
    (version "1.0.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/fatih/camelcase")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0z7rw6f5j97dkzqya257dqlxf3cm8zl508081gmnr4bsjhkwpz2l"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/fatih/camelcase"))
    (home-page "https://github.com/fatih/camelcase")
    (synopsis "CamelCase")
    (description
      "Package camelcase is a micro package to split the words of a camelcase type
string into a slice of words.")
    (license license:expat)))

(define-public go-github-com-fatih-structtag
  (package
    (name "go-github-com-fatih-structtag")
    (version "1.2.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/fatih/structtag")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "09a9pycvkf384v5f47ff4q33bjbzpx6kbkn23za1gcwc96466sk3"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/fatih/structtag"))
    (home-page "https://github.com/fatih/structtag")
    (synopsis "structtag")
    (description
      "structtag provides an easy way of parsing and manipulating struct tag fields.
Please vendor the library as it might change in future versions.")
    (license license:bsd-3)))

(define-public go-github-com-fatih-gomodifytags
  (package
    (name "go-github-com-fatih-gomodifytags")
    (version "1.16.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/fatih/gomodifytags")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1yhkn9mdvsn9i5v03c5smz32zlhkylnxhkcbjb7llafxzbhzgfm6"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/fatih/gomodifytags"))
    (propagated-inputs
      `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
        ("go-github-com-fatih-structtag" ,go-github-com-fatih-structtag)
        ("go-github-com-fatih-camelcase" ,go-github-com-fatih-camelcase)))
    (home-page "https://github.com/fatih/gomodifytags")
    (synopsis "gomodifytags")
    (description
      "Go tool to modify/update field tags in structs. @code{gomodifytags} makes it
easy to update, add or delete the tags in a struct field.  You can easily add
new tags, update existing tags (such as appending a new key, i.e: @code{db},
@code{xml}, etc..) or remove existing tags.  It also allows you to add and
remove tag options.  It's intended to be used by an editor, but also has modes
to run it from the terminal.  Read the usage section below for more information.")
    (license license:bsd-3)))

go-github-com-fatih-gomodifytags
