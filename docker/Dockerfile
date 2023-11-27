FROM ubuntu:20.04

MAINTAINER "Mehmet Ali" mbektas@dakkasinda.com

RUN apt update && apt upgrade -y && \
    apt install -y openssh-server curl sudo net-tools &&  \
    addgroup --gid 1000 ubuntu && \
    adduser --uid 1000 --gid 1000 --disabled-password --gecos "" ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    ssh-keygen -A && \
    systemctl enable ssh

RUN mkdir /run/sshd

## Install Oh my Zsh
#RUN bash -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#RUN sed -i -- 's/robbyrussell/sonicradish/g' /root/.zshrc

# Add none root user
# RUN  useradd ubuntu && echo "ubuntu:ubuntu" | chpasswd && adduser ubuntu sudosol
USER ubuntu

RUN ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519

COPY ./.ssh-public/authorized_keys /home/ubuntu/.ssh/authorized_keys

# Reset user to root
USER root
RUN chmod a+r /home/ubuntu/.ssh/authorized_keys

EXPOSE 22
CMD ["/usr/sbin/init"]
#CMD ["/usr/sbin/sshd", "-D"]