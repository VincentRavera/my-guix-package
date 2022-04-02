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


;; guix import go -r "github.com/stamblerre/gocode@1.0.0"
(define-public go-github-com-keegancsmith-rpc
  (package
    (name "go-github-com-keegancsmith-rpc")
    (version "1.3.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/keegancsmith/rpc")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "0np1nxx8iw669y9316s5d2mwqzjkz0zjm40y3zjqxis1l2fmmnpw"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/keegancsmith/rpc"))
    (home-page "https://github.com/keegancsmith/rpc")
    (synopsis "rpc")
    (description
      "Package rpc is a fork of the stdlib net/rpc which is frozen.  It adds support
for context.Context on the client and server, including propogating
cancellation.  See the README at
@url{https://github.com/keegancsmith/rpc,https://github.com/keegancsmith/rpc}
for motivation why this exists.")
    (license license:bsd-3)))

(define-public go-github-com-stamblerre-gocode
  (package
    (name "go-github-com-stamblerre-gocode")
    (version "1.0.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/stamblerre/gocode")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1yx32nsryrv3rc4l7gw1a5r7bvidnhjzmg5s2b17i0nayfn9h0v0"))))
    (build-system go-build-system)
    (arguments '(#:import-path "github.com/stamblerre/gocode"))
    (propagated-inputs
      `(("go-golang-org-x-tools" ,go-golang-org-x-tools)
        ("go-github-com-keegancsmith-rpc" ,go-github-com-keegancsmith-rpc)))
    (home-page "https://github.com/stamblerre/gocode")
    (synopsis
      ": This fork of gocode is currently in maintenance mode. For a better development experience with Go modules, we suggest you use the Go language server,")
    (description "This version of gocode works with Go modules.")
    (license license:expat)))

go-github-com-stamblerre-gocode
