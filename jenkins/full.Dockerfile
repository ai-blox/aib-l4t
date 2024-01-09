#NVIDIA L4T base image
ARG TAG
FROM aiblox/aibl4t-base:${TAG}

WORKDIR /aib-l4t

RUN apt-get install git

CMD ["/bin/bash"]