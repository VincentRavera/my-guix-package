(define-module (gnu packages python-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages adns)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages attr)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages dbm)
  #:use-module (gnu packages django)
  #:use-module (gnu packages djvu)
  #:use-module (gnu packages docker)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages file)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages geo)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gsasl)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages imagemagick)
  #:use-module (gnu packages jupyter)
  #:use-module (gnu packages kerberos)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages openstack)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages photo)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages rdf)
  #:use-module (gnu packages readline)
  #:use-module (gnu packages regex)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages scanner)
  #:use-module (gnu packages search)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages sphinx)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tex)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wxwidgets)
  #:use-module (gnu packages base)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages bdw-gc)
  #:use-module (gnu packages serialization)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix hg-download)
  #:use-module (guix gexp)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26))
;;  node
;;  pytest
;;  pyflakes
;;  isort
;;  python-language-server
;;  ptvsd
;;  mypy
;;  flake8

(define-public python-ptvsd
  (let ((version  "4.3.2"))
    (package
     (name "python-ptvsd")
     (version version)
     (source
      (origin
       (method url-fetch)
       (uri (pypi-uri "ptvsd" version ".zip"))
       (sha256
        (base32 "1ar8v9mk0m68cr91mqpr4q9w3dcmqsm0pysh7jafbg7x31hc019v"))))
     (build-system python-build-system)
     (native-inputs `(("unzip" ,unzip)))
     (home-page "https://aka.ms/ptvs")
     (synopsis
      "Remote debugging server for Python support in Visual Studio and Visual Studio Code")
     (description
      "Remote debugging server for Python support in Visual Studio and Visual Studio
Code")
     (license license:expat))
    )
  )

;; (define-public python-zope.lifecycleevent
;;   (package
;;     (name "python-zope.lifecycleevent")
;;     (version "4.3")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.lifecycleevent" version))
;;         (sha256
;;           (base32 "1vha9xbnil1d1qy2jphjkfq9a6zbjmidrng7axaya90mrj3r1hvy"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools python-zope.event python-zope.interface))
;;     (native-inputs
;;       (list python-zope.component
;;             python-zope.configuration
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.lifecycleevent")
;;     (synopsis "Object life-cycle events")
;;     (description "Object life-cycle events")
;;     (license #f)))

;; (define-public python-zope.deprecation
;;   (package
;;     (name "python-zope.deprecation")
;;     (version "4.4.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.deprecation" version))
;;         (sha256
;;           (base32 "1pz2cv7gv9y1r3m0bdv7ks1alagmrn5msm5spwdzkb2by0w36i8d"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs (list python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.deprecation")
;;     (synopsis "Zope Deprecation Infrastructure")
;;     (description "Zope Deprecation Infrastructure")
;;     (license #f)))

;; (define-public python-zope.copy
;;   (package
;;     (name "python-zope.copy")
;;     (version "4.2")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.copy" version))
;;         (sha256
;;           (base32 "06m75434krl57n6p73c2qj55k5i3fixg887j8ss01ih6zw4rvfs7"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools python-zope.interface))
;;     (native-inputs
;;       (list python-zope.component
;;             python-zope.location
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.copy")
;;     (synopsis "Pluggable object copying mechanism")
;;     (description "Pluggable object copying mechanism")
;;     (license #f)))

;; (define-public python-zope.security
;;   (package
;;     (name "python-zope.security")
;;     (version "5.1.1")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.security" version))
;;         (sha256
;;           (base32 "11lfw67cigscfax9c5j63xcvz2qcj724zx5fcdqyc94am2glim0h"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools
;;             python-zope.component
;;             python-zope.i18nmessageid
;;             python-zope.interface
;;             python-zope.location
;;             python-zope.proxy
;;             python-zope.schema))
;;     (native-inputs
;;       (list python-btrees
;;             python-zope.component
;;             python-zope.configuration
;;             python-zope.location
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.security")
;;     (synopsis "Zope Security Framework")
;;     (description "Zope Security Framework")
;;     (license #f)))

;; (define-public python-zope.proxy
;;   (package
;;     (name "python-zope.proxy")
;;     (version "4.5.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.proxy" version))
;;         (sha256
;;           (base32 "06nhp9pdsz2zxc1lf2qda5wd3clrs7x3r7sp0lmmav6gc5i88a8k"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools python-zope.interface))
;;     (native-inputs (list python-zope.security python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.proxy")
;;     (synopsis "Generic Transparent Proxies")
;;     (description "Generic Transparent Proxies")
;;     (license #f)))

;; (define-public python-zope.location
;;   (package
;;     (name "python-zope.location")
;;     (version "4.2")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.location" version))
;;         (sha256
;;           (base32 "1b40pzl8v00d583d3gsxv1qjdw2dhghlgkbgxl3m07d5r3izj857"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools
;;             python-zope.interface
;;             python-zope.proxy
;;             python-zope.schema))
;;     (native-inputs
;;       (list python-zope.component
;;             python-zope.configuration
;;             python-zope.copy
;;             python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.location/")
;;     (synopsis "Zope Location")
;;     (description "Zope Location")
;;     (license #f)))

;; (define-public python-zope.schema
;;   (package
;;     (name "python-zope.schema")
;;     (version "6.2.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.schema" version))
;;         (sha256
;;           (base32 "0nsr4iqsff98la05xpkvr9nisrl4sfnadmw42a45mvkmmpwaw092"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools python-zope.event python-zope.interface))
;;     (native-inputs
;;       (list python-zope.i18nmessageid
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.schema")
;;     (synopsis "zope.interface extension for defining data schemas")
;;     (description "zope.interface extension for defining data schemas")
;;     (license #f)))

;; (define-public python-zope.i18nmessageid
;;   (package
;;     (name "python-zope.i18nmessageid")
;;     (version "5.0.1")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.i18nmessageid" version))
;;         (sha256
;;           (base32 "0ndhn4w1qgwkfbwf9vm2bgq418z5g0wmfsgl0d9nz62cd0mi8d4m"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools python-six))
;;     (native-inputs (list python-coverage python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.i18nmessageid")
;;     (synopsis "Message Identifiers for internationalization")
;;     (description "Message Identifiers for internationalization")
;;     (license #f)))

;; (define-public python-zope.configuration
;;   (package
;;     (name "python-zope.configuration")
;;     (version "4.4.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.configuration" version))
;;         (sha256
;;           (base32 "0g6vrl7y27z9cj5xyrww9xlzk4npj55mgmlrcd9d2nj08jn2pw79"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools
;;             python-zope.i18nmessageid
;;             python-zope.interface
;;             python-zope.schema))
;;     (native-inputs
;;       (list python-manuel
;;             python-zope.schema
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.configuration")
;;     (synopsis "Zope Configuration Markup Language (ZCML)")
;;     (description "Zope Configuration Markup Language (ZCML)")
;;     (license #f)))

;; (define-public python-zope.hookable
;;   (package
;;     (name "python-zope.hookable")
;;     (version "5.1.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.hookable" version))
;;         (sha256
;;           (base32 "03ma9wppfsmwngh9989jhd9mg6vixyfjjz1iwd4azil60k6ydhwg"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs
;;       (list python-coverage python-zope.testing python-zope.testrunner))
;;     (home-page "http://github.com/zopefoundation/zope.hookable")
;;     (synopsis "Zope hookable")
;;     (description "Zope hookable")
;;     (license #f)))

;; (define-public python-zope.component
;;   (package
;;     (name "python-zope.component")
;;     (version "5.0.1")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.component" version))
;;         (sha256
;;           (base32 "1rgmrmy7z9a39czrxw3zri4wg80q0w7zh4djwlnbd9wgp8kf9jrj"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools
;;             python-zope.event
;;             python-zope.hookable
;;             python-zope.interface))
;;     (native-inputs
;;       (list python-persistent
;;             python-zope.configuration
;;             python-zope.i18nmessageid
;;             python-zope.location
;;             python-zope.proxy
;;             python-zope.security
;;             python-zope.testing
;;             python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.component")
;;     (synopsis "Zope Component Architecture")
;;     (description "Zope Component Architecture")
;;     (license #f)))

;; (define-public python-zope.testing
;;   (package
;;     (name "python-zope.testing")
;;     (version "4.9")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.testing" version))
;;         (sha256
;;           (base32 "0kmm7h488ycn24fsbnfhwqkzc2w0p38gb4zf2drm97dglx3vhp27"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs (list python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.testing")
;;     (synopsis "Zope testing helpers")
;;     (description "Zope testing helpers")
;;     (license #f)))

;; (define-public python-zope.exceptions
;;   (package
;;     (name "python-zope.exceptions")
;;     (version "4.4")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.exceptions" version))
;;         (sha256
;;           (base32 "1nkgfwawswmyc6i0b8g3ymvja4mb507m8yhid8s4rbxq3dmqhwhd"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools python-zope.interface))
;;     (native-inputs (list python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.exceptions")
;;     (synopsis "Zope Exceptions")
;;     (description "Zope Exceptions")
;;     (license #f)))

;; (define-public python-zope.testrunner
;;   (package
;;     (name "python-zope.testrunner")
;;     (version "5.4.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.testrunner" version))
;;         (sha256
;;           (base32 "1d0g47ll0s7a7pxaab5kb0wgg26wj27p2nk6fs7amr09r6gj4sa8"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-setuptools
;;             python-six
;;             python-zope.exceptions
;;             python-zope.interface))
;;     (native-inputs (list python-zope.testing))
;;     (home-page "https://github.com/zopefoundation/zope.testrunner")
;;     (synopsis "Zope testrunner script.")
;;     (description "Zope testrunner script.")
;;     (license #f)))

;; (define-public python-zope.event
;;   (package
;;     (name "python-zope.event")
;;     (version "4.5.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.event" version))
;;         (sha256
;;           (base32 "0c0kvfz6yazw98n0dqpp6fj6xhdn3mw1k26a6z7rl4cvbdzm2xjy"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs (list python-zope.testrunner))
;;     (home-page "https://github.com/zopefoundation/zope.event")
;;     (synopsis "Very basic event publishing system")
;;     (description "Very basic event publishing system")
;;     (license #f)))

;; (define-public python-zope.interface
;;   (package
;;     (name "python-zope.interface")
;;     (version "5.4.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "zope.interface" version))
;;         (sha256
;;           (base32 "03jsiad578392pfmxa1ihkmvdh2q3dcwqy1vv240jgzc1x9mzfjx"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs
;;       (list python-coverage python-zope.event python-zope.testing))
;;     (home-page "https://github.com/zopefoundation/zope.interface")
;;     (synopsis "Interfaces for Python")
;;     (description "Interfaces for Python")
;;     (license #f)))

;; (define-public python-plumber
;;   (package
;;     (name "python-plumber")
;;     (version "1.6")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "plumber" version))
;;         (sha256
;;           (base32 "1m4apgi442pbbirik1lc59pb7cj8a8b48riq242y8qana3mwln3p"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (native-inputs (list python-zope.interface))
;;     (home-page "http://github.com/bluedynamics/plumber")
;;     (synopsis "An alternative to mixin-based extension of classes.")
;;     (description "An alternative to mixin-based extension of classes.")
;;     (license #f)))

;; (define-public python-odict
;;   (package
;;     (name "python-odict")
;;     (version "1.8.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "odict" version))
;;         (sha256
;;           (base32 "13gq34mlx5ly4f1xh9y03yxj9607bhkal2mpns4yflnahij9ghkv"))))
;;     (build-system python-build-system)
;;     (propagated-inputs (list python-setuptools))
;;     (home-page "https://github.com/conestack/odict")
;;     (synopsis "Ordered Dictionary.")
;;     (description "Ordered Dictionary.")
;;     (license #f)))

;; (define-public python-node
;;   (package
;;     (name "python-node")
;;     (version "0.9.28")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (pypi-uri "node" version))
;;         (sha256
;;           (base32 "0b4k3pb52clq5rz0qcl925xyyl6jgr3s8vcph2jpnjjlkrh5280v"))))
;;     (build-system python-build-system)
;;     (propagated-inputs
;;       (list python-odict
;;             python-plumber
;;             python-setuptools
;;             python-zope.component
;;             python-zope.deprecation
;;             python-zope.lifecycleevent))
;;     (home-page "http://github.com/conestack/node")
;;     (synopsis "Building data structures as node trees")
;;     (description "Building data structures as node trees")
;;     (license #f)))

python-ptvsd
;; python-zope.security
;; python-zope.proxy
;; python-zope.location
;; python-zope.schema
;; python-zope.i18nmessageid
;; python-zope.configuration
;; python-zope.hookable
;; python-zope.component
;; python-zope.testing
;; python-zope.exceptions
;; python-zope.testrunner
;; python-zope.event
;; python-zope.interface
;; python-plumber
;; python-odict
;; python-node
;; python-zope.lifecycleevent
;; python-zope.deprecation
;; python-zope.copy
