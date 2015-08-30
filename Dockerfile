FROM thewtex/jupyter-notebook-debian:latest
MAINTAINER Matt McCormick <matt.mccormick@kitware.com>

# fetch juptyerhub-singleuser entrypoint
ADD https://raw.githubusercontent.com/jupyter/jupyterhub/master/jupyterhub/singleuser.py /usr/local/bin/jupyterhub-singleuser
RUN chmod 755 /usr/local/bin/jupyterhub-singleuser

EXPOSE 8888
ADD https://raw.githubusercontent.com/everware/dockerspawner/master/singleuser/singleuser.sh /srv/singleuser/singleuser.sh
RUN chmod 755 /srv/singleuser/singleuser.sh
CMD ["sh", "/srv/singleuser/singleuser.sh"]

# jupyter is our user
RUN useradd -m -s /bin/bash jupyter

USER jupyter
ENV HOME /home/jupyter
ENV SHELL /bin/bash
ENV USER jupyter

WORKDIR /home/jupyter/

