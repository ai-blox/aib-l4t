#NVIDIA L4T base image
ARG TAG
FROM aiblox/aibl4t-base:${TAG}

WORKDIR /aib-l4t

CMD ["/bin/bash"]