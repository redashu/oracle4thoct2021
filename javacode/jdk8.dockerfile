from oraclelinux:8.3
LABEL email="ashutoshh@linux.com"
RUN  yum install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64  -y
# installing jdk 8 in OL 8.3
RUN mkdir /hello
ADD oracle.java /hello/
# COPY and ADD both are same 
# add can also take data from URL while copy can only take from local system 
WORKDIR /hello
RUN javac oracle.java 
# compiling code  and storing class file 
ENTRYPOINT java myclass 
# Replacement of CMD 
#  CMD argument will be replaced if process give by user 
# entrypoint can't be replaced even if process given by user
