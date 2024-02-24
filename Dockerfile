## Go alpine image to work with
FROM ubuntu 
COPY test.sh /ubuntu/home/test.sh
ENTRYPOINT ["/ubuntu/home/test.sh"]
CMD ["/bin/bash"]