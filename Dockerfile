FROM ghcr.io/opencyphal/toolshed:ts22.4.5 

RUN pip install -U nunavut

RUN pip install yakut

# Building:
# docker build --platform linux/amd64 -t brtcyphal/cyphal_tools:<tag> .