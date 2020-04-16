FROM ubuntu

RUN apt update && apt -y install openssh-server git

RUN useradd -m -p $(openssl passwd -1 gitpass) gituser
RUN /usr/bin/ssh-keygen -A

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER gituser
WORKDIR /home/gituser/
RUN mkdir -p .ssh
COPY authorized_keys .ssh/

RUN git init --bare gpr

USER root
RUN mkdir -p /run/sshd

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
