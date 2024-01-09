#NVIDIA L4T base image
ARG TAG
FROM aiblox/aibl4t-base:${TAG}

WORKDIR /aib-l4t

RUN apt-get update && apt-get install --no-install-recommends -y \
    git

CMD ["/bin/bash"]