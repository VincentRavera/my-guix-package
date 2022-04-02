;; (define-module (gnu packages check)
;;   #:use-module (gnu packages)
;;   ;; #:use-module (gnu packages autotools)
;;   ;; #:use-module (gnu packages base)
;;   #:use-module (gnu packages bash)
;;   ;; #:use-module (gnu packages compression)
;;   ;; #:use-module (gnu packages linux)
;;   ;; #:use-module (gnu packages llvm)
;;   ;; #:use-module (gnu packages glib)
;;   ;; #:use-module (gnu packages gnome)
;;   ;; #:use-module (gnu packages golang)
;;   ;; #:use-module (gnu packages gtk)
;;   ;; #:use-module (gnu packages perl)
;;   ;; #:use-module (gnu packages pkg-config)
;;   #:use-module (gnu packages python)
;;   #:use-module (gnu packages python-check)
;;   #:use-module (gnu packages python-build)
;;   #:use-module (gnu packages python-web)
;;   #:use-module (gnu packages python-xyz)
;;   #:use-module (gnu packages python-science)
;;   ;; #:use-module (gnu packages time)
;;   ;; #:use-module (gnu packages xml)
;;   ;; #:use-module (guix utils)
;;   #:use-module ((guix licenses) #:prefix license:)
;;   #:use-module (guix packages)
;;   ;; #:use-module (guix download)
;;   ;; #:use-module (guix git-download)
;;   ;; #:use-module (guix build-system cmake)
;;   ;; #:use-module (guix build-system glib-or-gtk)
;;   ;; #:use-module (guix build-system gnu)
;;   ;; #:use-module (guix build-system go)
;;   ;; #:use-module (guix build-system meson)
;;   #:use-module (guix build-system python)
;;   ;; #:use-module (guix build-system trivial)
;;   ;; #:use-module (srfi srfi-1)
;;   )
;; (define-public python-ptvsd
;;   (package
;;    (name "python-ptvsd")
;;    (version "4.3.2")
;;    (source
;;     (origin
;;      (method url-fetch)
;;      (uri (pypi-uri "ptvsd" version))
;;      (sha256
;;       (base32
;;        "12cyi0lnyaq8sdqfnqlppd76gkw6zcg10gyih5knx9v611l3c6qk"))))
;;    (build-system python-build-system)
;;    (arguments
;;     `(#:phases
;;       (modify-phases %standard-phases
;;                      (add-before 'build 'pretend-version
;;                                  ;; The version string is usually derived via setuptools-scm, but
;;                                  ;; without the git metadata available, the version string is set to
;;                                  ;; '0.0.0'.
;;                                  (lambda _
;;                                    (setenv "SETUPTOOLS_SCM_PRETEND_VERSION" ,version)))
;;                      (replace 'check
;;                               (lambda* (#:key (tests? #t) #:allow-other-keys)
;;                                 (setenv "TERM" "dumb")     ;attempt disabling markup tests
;;                                 ;; (if tests?
;;                                 ;;     (invoke "pytest" "-vv" "-k"
;;                                 ;;             (string-append
;;                                 ;;              ;; This test involves the /usr directory, and fails.
;;                                 ;;              " not test_argcomplete"
;;                                 ;;              ;; These test do not honor the isatty detection and
;;                                 ;;              ;; fail.
;;                                 ;;              " and not test_code_highlight"
;;                                 ;;              " and not test_color_yes"))
;;                                 ;;     (format #t "test suite not run~%"))
;;                                 )))))
;;    (propagated-inputs
;;     `(("python-attrs" ,python-attrs-bootstrap)
;;       ("python-iniconfig" ,python-iniconfig)
;;       ("python-more-itertools" ,python-more-itertools)
;;       ("python-packaging" ,python-packaging-bootstrap)
;;       ("python-pluggy" ,python-pluggy)
;;       ("python-py" ,python-py)
;;       ("python-six" ,python-six-bootstrap)
;;       ("python-toml" ,python-toml)
;;       ("python-wcwidth" ,python-wcwidth)))
;;    (native-inputs
;;     `(;; Tests need the "regular" bash since 'bash-final' lacks `compgen`.
;;       ("bash" ,bash)
;;       ("python-hypothesis" ,python-hypothesis)
;;       ("python-nose" ,python-nose)
;;       ("python-mock" ,python-mock)
;;       ("python-pytest" ,python-pytest-bootstrap)
;;       ("python-setuptools-scm" ,python-setuptools-scm)
;;       ("python-toml" ,python-toml)
;;       ("python-xmlschema" ,python-xmlschema)))
;;    (home-page "https://docs.pytest.org/en/latest/")
;;    (synopsis "Python testing library")
;;    (description
;;     "Pytest is a testing tool that provides auto-discovery of test modules
;; and functions, detailed info on failing assert statements, modular fixtures,
;; and many external plugins.")
;;    (license license:expat)
;;    (properties `((python2-variant . ,(delay python2-pytest))))))
