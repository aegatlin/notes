# Vim

* `:helptags ALL` will generate missing docs.
    - Use case: newly installed plugin docs seem to be missing. If the package 
    is in the runtime path, `:set runtime?`, then vim _should_ be able to find 
    the `plugin/doc/` folder and generate the helptags, which allow you to run 
    `:h ...`.

