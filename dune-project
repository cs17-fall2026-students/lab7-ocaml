(lang dune 3.7)

(map_workspace_root false)

(name lab07)

(generate_opam_files false)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name lab07)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml ppx_expect ppx_sexp_conv sexplib0)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
