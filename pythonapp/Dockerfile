FROM python
#  we are telling dockerfile to use / pull python image from docker hub
LABEL name=ashutoshh
LABEL email=ashutoshh@linux.com
# label is optional keyword but to share image designer info 
RUN  mkdir  /mycode 
# RUn is to get shell during image build time
COPY  hello.py  /mycode/hello.py
# copy code inside docker image during build 
# make sure Dockerfile and hello.py must be on same location 
CMD  ["python","/mycode/hello.py"]
# CMD is to define default process for container 
# if not given by user during container creation time

