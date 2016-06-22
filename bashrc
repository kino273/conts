if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export PATH=~/.cabal/bin:/opt/cabal/1.20/bin:/opt/ghc/7.8.4/bin:$PATH
