FROM rust:1.59.0

# Install dependencies
RUN apt-get update \
 && apt-get install -y curl libudev-dev nodejs npm

# Setup Solana
RUN sh -c "$(curl -sSfL https://release.solana.com/v1.9.9/install)"
ENV PATH="/root/.local/share/solana/install/active_release/bin:$PATH"
RUN solana config set --url localhost

# Setup nodejs
RUN npm install -g npm \
  && npm cache clean -f \
  && npm install -g n \
  && n lts