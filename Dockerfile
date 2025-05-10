FROM espressif/idf:latest

# --- Function: install tools and SSH server for Remote-SSH ---
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      cmake \
      ninja-build \
      curl \
      unzip \
      tar \
      ca-certificates \
      openssh-server \
      ccache \
      libusb-1.0-0 \
      libftdi1 \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/run/sshd \
 && echo 'root:MyRootPasword' | chpasswd \
 && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
 && ssh-keygen -A \
 && echo '. /opt/esp/idf/export.sh' >> /root/.bashrc

ENV CCACHE_DIR=/root/.ccache
ENV IDF_CCACHE_ENABLE=1

# --- Function: copy entrypoint script ---
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh \
 && sed -i 's/\r$//' /entrypoint.sh

# --- Function: expose SSH port only ---
EXPOSE 22

# --- Function: start SSH ---
ENTRYPOINT ["/entrypoint.sh"]
CMD []
