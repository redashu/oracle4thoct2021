FROM openjdk 
# standard docker image from docker hub 
label email=ashutoshh@linux.com
RUN mkdir  /myapp
COPY oracle.java /myapp/oracle.java
# COPY is just to copy localdata 
WORKDIR  /myapp
# changing folder during build time 
RUN  javac  oracle.java 
# compile java code and put compiled data into current directory that is /myapp
CMD ["java","myclass"]
# CMD is for default container process if user is not defining 
