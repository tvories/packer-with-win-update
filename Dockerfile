# DOCKERFILE that installs packer with packer-provisioner-windows-update
ARG PACKER_VERSION=1.6.5
FROM hashicorp/packer:${PACKER_VERSION}

ARG WIN_UPDATE_PROVISIONER_VERSION=0.10.1

LABEL maintainer="Taylor Vories <tvories@gmail.com>"
LABEL app.packer.version="$PACKER_VERSION" app.win_update_provisioner.version="$WIN_UPDATE_PROVISIONER_VERSION"

# download, extract, delete tgz, and allow plugin to execute
ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/v${WIN_UPDATE_PROVISIONER_VERSION}/packer-provisioner-windows-update_${WIN_UPDATE_PROVISIONER_VERSION}_linux_amd64.tar.gz ./packer-provisioner-windows-update-linux.tgz
RUN tar -xzf ./packer-provisioner-windows-update-linux.tgz -C /bin
RUN chmod +x /bin/packer-provisioner-windows-update
RUN rm ./packer-provisioner-windows-update-linux.tgz

ENTRYPOINT [ "/bin/packer" ]