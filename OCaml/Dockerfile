FROM ocaml/opam2:4.11
RUN sudo apt-get -y install m4 libgmp-dev pkg-config
RUN opam init
RUN eval $(opam env)

# Need to download charInfo_width
# As it won't download by doing opam install
RUN curl -O -L https://github.com/kandu/charInfo_width/archive/1.1.0.tar.gz
RUN tar xvzf 1.1.0.tar.gz  
RUN opam pin charInfo_width ./charInfo_width-1.1.0

RUN opam install base utop

RUN opam install core async yojson core_extended
RUN opam install core_bench cohttp-async async_graphics
RUN sudo apt-get -y install zlib1g-dev
RUN opam install cryptokit menhir

# OCaml-LSP - LSP server implementation for OCaml for VSCode
RUN opam pin add ocaml-lsp-server https://github.com/ocaml/ocaml-lsp.git
RUN opam install ocaml-lsp-server

CMD ["/bin/sh" "-c" "bash"]