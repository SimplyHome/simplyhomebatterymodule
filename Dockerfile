FROM %%BASE_IMAGE%%

ENV LANG C.UTF-8

#install UPSPico Dependencies

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
