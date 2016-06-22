FROM fedora

# --- build local OS specific ---
ADD ./build-local.sh /tmp/build-local.sh
RUN  /tmp/build-local.sh

# --- sshd -----------
RUN (mkdir -p /var/run/sshd; \
     yes|ssh-keygen -f /etc/ssh/ssh_host_rsa_key -t rsa -N ''; \
     yes|ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa -N ''; \
     yes|ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -t ed25519 -N '')

# --- files ---------------------
ADD magit.el /usr/share/emacs/site-lisp/
ADD dm /usr/local/bin/
ADD copy.sh startservice.sh /usr/local/

# --- worker --------------------
RUN (useradd -s /bin/bash worker; \
     usermod -s /bin/bash root; \
     echo 'worker:newpass' | chpasswd; \
     echo 'root:newpass' | chpasswd; \
     mkdir -p /home/worker)
ADD sudoers /etc/sudoers.d/

# --- user files ----------------
ADD authorized_keys /home/worker/.ssh/
ADD emacs /home/worker/.emacs
ADD bashrc /home/worker/.bashrc
ADD screenrc /home/worker/.screenrc
ADD gitconfig /home/worker/.gitconfig

RUN (chmod 700 /home/worker/.ssh/; \
     chmod 600 /home/worker/.ssh/authorized_keys; \
     chown -R worker:worker /home/worker)

# -------------------------------
EXPOSE 22
CMD ["/usr/local/startservice.sh"]
