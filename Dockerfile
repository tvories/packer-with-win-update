# DOCKERFILE that installs packer with packer-provisioner-windows-update

FROM hashicorp/packer:1.6.0

# download, extract, delete tgz, and allow plugin to execute
ADD https://github.com/rgl/packer-provisioner-windows-update/releases/download/v0.9.0/packer-provisioner-windows-update-linux.tgz ./packer-provisioner-windows-update-linux.tgz
RUN tar -xzf ./packer-provisioner-windows-update-linux.tgz -C /bin
RUN chmod +x /bin/packer-provisioner-windows-update
RUN rm ./packer-provisioner-windows-update-linux.tgz

ENTRYPOINT [ "/bin/packer" ]