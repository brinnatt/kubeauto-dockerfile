# This dockerfile is used to build the kubeauto into an image and run as a container
# @author: Brinnatt
# @repo: https://github.com/brinnatt/kubeauto

# nothing changed for once
FROM brinnatt/ansible:2.18.6

# KUBEAUTO will be set by build-args
ARG KUBEAUTO_VER=""

ENV TZ="Asia/Shanghai"

RUN set -x \
    # Downloading kubeauto
    && wget https://github.com/brinnatt/kubeauto/archive/refs/tags/"$KUBEAUTO_VER".tar.gz \
    && tar zxf "$KUBEAUTO_VER".tar.gz \
    && mv kubeauto-"$KUBEAUTO_VER" /usr/local/kubeauto \
    && rm -rf "$KUBEAUTO_VER".tar.gz

CMD ["tail", "-f", "/dev/null"]