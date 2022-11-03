FROM thothbot/alpine-jre8
ADD ./target/myproject-0.0.1-SNAPSHOT.jar /myproject-0.0.1-SNAPSHOT.jar
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8080:8080
CMD /run.sh 

#Entrypoint will be good to make it executable but I cannot test URL hence keeping the CMD.
#Below is the syntax which we can use for entrypoint. 
#ENTRYPOINT ["./run.sh"] 
