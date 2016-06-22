FROM kino/conts:deb-ghc

RUN su worker -c "cabal update; cabal install music-suite"
RUN dnf install -y lilypond

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
