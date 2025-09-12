# This dockerfile is used to build the kubeauto into an image and run as a container
# @author: Brinnatt
# @repo: https://github.com/brinnatt/kubeauto

# nothing changed for third
FROM python:3.12.11

# KUBEAUTO will be set by build-args
ARG KUBEAUTO_VER=""

ENV TZ="Asia/Shanghai"

RUN set -x \
    # Downloading kubeauto
    && wget https://github.com/brinnatt/kubeauto/archive/refs/tags/"$KUBEAUTO_VER".tar.gz \
    && tar zxf "$KUBEAUTO_VER".tar.gz \
    && cd kubeauto-"$KUBEAUTO_VER" \
    && python3 build.py \
    && mkdir -p /usr/local/kubeauto \
    && cp -ar playbooks roles example dist /usr/local/kubeauto/ \
    && cd .. \
    && rm -rf kubeauto-"$KUBEAUTO_VER" "$KUBEAUTO_VER".tar.gz

CMD ["tail", "-f", "/dev/null"]