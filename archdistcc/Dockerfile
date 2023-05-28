# docker image build --pull -t mkheironimus/archdistcc:latest .
FROM archlinux:base-devel
COPY distcc.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/distcc.sh \
    && pacman -Syu --noconfirm \
    && pacman -S --noconfirm distcc \
    && pacman -Scc --noconfirm \
    && update-distcc-symlinks \
    && cd /usr/lib/distcc \
    && ln -s ../../bin/distcc x86_64-linux-gnu-gcc \
    && ln -s ../../bin/distcc x86_64-linux-gnu-g++
ENV LOGLEVEL=error
USER distcc
CMD ["distcc.sh"]
