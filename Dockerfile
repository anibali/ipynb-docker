FROM ipython/scipyserver

RUN pip install python-louvain

ADD notebook.sh /
RUN chmod +x /notebook.sh
ENTRYPOINT ["/notebook.sh"]
