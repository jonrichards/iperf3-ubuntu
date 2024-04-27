# Using an LTS version for longevity
FROM ubuntu:noble

# Update available packages
RUN apt update && \
    # Upgrade installed packages
    apt upgrade -y && \
    # Install iperf3
    apt install -y iperf3 && \
    # Clean up
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    # Add a user
    adduser --system iperf

# Output iperf3 installed version
RUN mkdir -p /output && \
    dpkg -s iperf3 | grep Version | sed 's/Version: //g' > /output/iperf3-version.txt

# Set our user to run as
USER iperf
    
# Expose iperf3 ports
EXPOSE 5201/tcp 5201/udp

# Run iperf3 on container start
ENTRYPOINT ["iperf3"]

# Run iperf3 in server mode by default
CMD ["-s"]
